import 'dart:async';
import 'package:injectable/injectable.dart';
import '../constants/app_constants.dart';
import '../constants/storage_keys.dart';
import '../errors/exceptions.dart';
import '../services/connectivity_service.dart';
import 'storage_service.dart';
import '../../features/sync/data/models/sync_queue_item.dart';
import '../../features/sync/data/models/sync_operation.dart';
import '../../features/sync/data/services/mock_rest_api_service.dart';
import '../../shared/models/sync_status.dart';

@singleton
class SyncQueueManager {
  final StorageService _storage;
  final MockRestApiService _apiService;
  final ConnectivityService _connectivityService;

  SyncQueueManager(this._storage, this._apiService, this._connectivityService);
  Timer? _syncTimer;
  StreamController<SyncQueueEvent>? _eventController;
  bool _isProcessing = false;

  StreamController<SyncQueueEvent> get eventController {
    _eventController ??= StreamController<SyncQueueEvent>.broadcast();
    return _eventController!;
  }

  Future<void> initialize() async {
    await _storage.initialize();
    _startSyncTimer();
  }

  // Queue operations
  Future<void> queueOperation({
    required String entityType,
    required String entityId,
    required SyncOperation operation,
    required Map<String, dynamic> data,
    int priority = 0,
  }) async {
    final queueItem = SyncQueueItem.create(
      entityType: entityType,
      entityId: entityId,
      operation: operation,
      data: data,
      priority: priority,
    );

    await _storage.save(StorageKeys.syncQueueBox, queueItem);
    _eventController?.add(SyncQueueItemQueued(queueItem));

    // Try to process immediately if online
    if (_isOnline()) {
      _processQueue();
    }
  }

  // Process queue operations
  Future<void> _processQueue() async {
    if (_isProcessing) return;

    _isProcessing = true;

    try {
      final queueItems = await _getSortedQueueItems();

      for (final item in queueItems) {
        if (!_isOnline()) {
          break;
        }

        if (item.shouldRetry(AppConstants.maxRetryAttempts)) {
          await _processQueueItem(item);
        } else {
          await _removeFailedItem(item);
        }
      }
    } finally {
      _isProcessing = false;
    }
  }

  Future<List<SyncQueueItem>> _getSortedQueueItems() async {
    final items = await _storage.getAll<SyncQueueItem>(
      StorageKeys.syncQueueBox,
    );

    // Sort by priority (higher first), then by creation time
    items.sort((a, b) {
      final priorityComparison = b.priority.compareTo(a.priority);
      if (priorityComparison != 0) return priorityComparison;
      return a.createdAt.compareTo(b.createdAt);
    });

    return items;
  }

  Future<void> _processQueueItem(SyncQueueItem item) async {
    try {
      item.markAsSyncing();
      await _storage.save(StorageKeys.syncQueueBox, item);

      _eventController?.add(SyncQueueItemProcessing(item));

      // Simulate API call based on operation type
      await _simulateApiCall(item);

      // Mark as synced and remove from queue
      item.markAsSynced();
      await _storage.delete(StorageKeys.syncQueueBox, item.id);

      _eventController?.add(SyncQueueItemCompleted(item));
    } catch (e) {
      item.setError(e.toString());
      item.incrementRetryCount();
      await _storage.save(StorageKeys.syncQueueBox, item);

      _eventController?.add(SyncQueueItemFailed(item, e.toString()));

      // Schedule retry
      if (item.shouldRetry(AppConstants.maxRetryAttempts)) {
        _scheduleRetry(item);
      }
    }
  }

  Future<void> _simulateApiCall(SyncQueueItem item) async {
    try {
      final response = await _apiService.performSyncOperation(
        entityType: item.entityType,
        entityId: item.entityId,
        operation: item.operation,
        data: item.data,
      );

      // Store server response metadata for conflict resolution
      final updatedData = {
        ...item.data,
        'serverVersion': response['version'],
        'lastSyncAt': response['timestamp'],
      };

      // Update the queue item with server response
      final updatedItem = item.copyWith(
        data: updatedData,
        metadata: {...item.metadata ?? {}, 'serverResponse': response},
      );

      await _storage.save(StorageKeys.syncQueueBox, updatedItem);
    } on SyncConflictException catch (e) {
      // Handle conflicts gracefully
      await _handleConflict(item, e);
      rethrow;
    } on SyncApiException catch (e) {
      // Handle API errors
      throw SyncException('API Error (${e.statusCode}): ${e.message}');
    }
  }

  Future<void> _handleConflict(
    SyncQueueItem item,
    SyncConflictException conflict,
  ) async {
    // Create conflict record
    final conflictData = {
      'entityType': item.entityType,
      'entityId': item.entityId,
      'localData': item.data,
      'serverVersion': conflict.serverVersion,
      'conflictType': 'update_conflict',
      'resolved': false,
      'createdAt': DateTime.now().toIso8601String(),
    };

    await _storage.save(StorageKeys.conflictsBox, {
      'id': '${item.entityType}:${item.entityId}',
      'data': conflictData,
    });

    // Mark item as conflicted
    final conflictedItem = item.copyWith(
      syncStatus: SyncStatus.conflicted,
      errorMessage: conflict.message,
      metadata: {...item.metadata ?? {}, 'conflictInfo': conflictData},
    );

    await _storage.save(StorageKeys.syncQueueBox, conflictedItem);
  }

  void _scheduleRetry(SyncQueueItem item) {
    Timer(item.getRetryDelay(), () {
      if (_isOnline()) {
        _processQueue();
      }
    });
  }

  Future<void> _removeFailedItem(SyncQueueItem item) async {
    await _storage.delete(StorageKeys.syncQueueBox, item.id);
    _eventController?.add(SyncQueueItemRemoved(item));
  }

  // Real connectivity detection
  bool _isOnline() {
    return _connectivityService.isConnected;
  }

  void setOnlineStatus(bool isOnline) {
    // This is now handled by the real connectivity service
    // We can still trigger manual sync when connectivity changes
    if (isOnline) {
      _processQueue();
    }
  }

  // Timer management
  void _startSyncTimer() {
    _syncTimer?.cancel();
    _syncTimer = Timer.periodic(AppConstants.syncInterval, (_) {
      if (_isOnline()) {
        _processQueue();
      }
    });
  }

  // Queue statistics
  Future<SyncQueueStats> getQueueStats() async {
    final items = await _storage.getAll<SyncQueueItem>(
      StorageKeys.syncQueueBox,
    );

    return SyncQueueStats(
      totalItems: items.length,
      pendingItems: items
          .where((i) => i.syncStatus == SyncStatus.pending)
          .length,
      failedItems: items.where((i) => i.syncStatus == SyncStatus.failed).length,
      syncingItems: items
          .where((i) => i.syncStatus == SyncStatus.syncing)
          .length,
    );
  }

  // Manual sync trigger
  Future<void> triggerSync() async {
    if (_isOnline()) {
      _processQueue();
    }
  }

  // Clear queue
  Future<void> clearQueue() async {
    await _storage.deleteAll(StorageKeys.syncQueueBox);
    _eventController?.add(const SyncQueueCleared());
  }

  /// Detect local changes since last sync for a specific entity type
  Future<List<SyncQueueItem>> detectLocalChangesSince({
    required String entityType,
    required DateTime since,
  }) async {
    final allItems = await _storage.getAll<SyncQueueItem>(
      StorageKeys.syncQueueBox,
    );

    return allItems.where((item) {
      return item.entityType == entityType &&
          item.updatedAt.isAfter(since) &&
          item.syncStatus != SyncStatus.synced;
    }).toList();
  }

  /// Perform partial sync for large datasets
  Future<Map<String, dynamic>> performPartialSync({
    required String entityType,
    int batchSize = 50,
    DateTime? since,
  }) async {
    final changes = await detectLocalChangesSince(
      entityType: entityType,
      since: since ?? DateTime.now().subtract(const Duration(days: 7)),
    );

    final batches = <List<SyncQueueItem>>[];
    for (int i = 0; i < changes.length; i += batchSize) {
      batches.add(changes.skip(i).take(batchSize).toList());
    }

    int totalProcessed = 0;
    int successCount = 0;
    int failureCount = 0;

    for (final batch in batches) {
      if (!_isOnline()) break;

      final batchResults = await _processBatch(batch);
      totalProcessed += batch.length;
      successCount += batchResults['success'] ?? 0;
      failureCount += batchResults['failed'] ?? 0;

      // Add delay between batches to prevent overwhelming the server
      await Future.delayed(const Duration(milliseconds: 100));
    }

    return {
      'totalBatches': batches.length,
      'totalProcessed': totalProcessed,
      'successCount': successCount,
      'failureCount': failureCount,
      'entityType': entityType,
    };
  }

  Future<Map<String, int>> _processBatch(List<SyncQueueItem> batch) async {
    int success = 0;
    int failed = 0;

    for (final item in batch) {
      try {
        await _processQueueItem(item);
        success++;
      } catch (e) {
        failed++;
      }
    }

    return {'success': success, 'failed': failed};
  }

  /// Fetch server changes and apply them locally
  Future<void> fetchAndApplyServerChanges({
    required String entityType,
    DateTime? since,
  }) async {
    if (!_isOnline()) return;

    try {
      final serverChanges = await _apiService.fetchChangesSince(
        entityType: entityType,
        since: since ?? DateTime.now().subtract(const Duration(hours: 1)),
      );

      for (final change in serverChanges) {
        await _applyServerChange(change);
      }

      // Update last sync timestamp
      await _updateLastSyncTimestamp(entityType);
    } catch (e) {
      print('Failed to fetch server changes: $e');
    }
  }

  Future<void> _applyServerChange(Map<String, dynamic> change) async {
    // This would integrate with the actual data repositories
    // For now, we'll just log the changes
    print(
      'Applying server change: ${change['operation']} for ${change['entityType']}:${change['entityId']}',
    );

    // In a real implementation, this would:
    // 1. Parse the server data
    // 2. Update the local entity in the appropriate repository
    // 3. Handle conflicts if they occur
    // 4. Update sync status
  }

  Future<void> _updateLastSyncTimestamp(String entityType) async {
    final timestamp = DateTime.now().toIso8601String();
    await _storage.save(StorageKeys.syncStatusBox, {
      'entityType': entityType,
      'lastSyncAt': timestamp,
    });
  }

  // Cleanup
  void dispose() {
    _syncTimer?.cancel();
    _eventController?.close();
  }
}

// Event classes
abstract class SyncQueueEvent {
  const SyncQueueEvent();
}

class SyncQueueItemQueued extends SyncQueueEvent {
  final SyncQueueItem item;
  const SyncQueueItemQueued(this.item);

  static SyncQueueItemQueued itemQueued(SyncQueueItem item) =>
      SyncQueueItemQueued(item);
}

class SyncQueueItemProcessing extends SyncQueueEvent {
  final SyncQueueItem item;
  const SyncQueueItemProcessing(this.item);

  static SyncQueueItemProcessing itemProcessing(SyncQueueItem item) =>
      SyncQueueItemProcessing(item);
}

class SyncQueueItemCompleted extends SyncQueueEvent {
  final SyncQueueItem item;
  const SyncQueueItemCompleted(this.item);

  static SyncQueueItemCompleted itemCompleted(SyncQueueItem item) =>
      SyncQueueItemCompleted(item);
}

class SyncQueueItemFailed extends SyncQueueEvent {
  final SyncQueueItem item;
  final String error;
  const SyncQueueItemFailed(this.item, this.error);

  static SyncQueueItemFailed itemFailed(SyncQueueItem item, String error) =>
      SyncQueueItemFailed(item, error);
}

class SyncQueueItemRemoved extends SyncQueueEvent {
  final SyncQueueItem item;
  const SyncQueueItemRemoved(this.item);

  static SyncQueueItemRemoved itemRemoved(SyncQueueItem item) =>
      SyncQueueItemRemoved(item);
}

class SyncQueueCleared extends SyncQueueEvent {
  const SyncQueueCleared();

  static const SyncQueueCleared queueCleared = SyncQueueCleared();
}

// Statistics class
class SyncQueueStats {
  final int totalItems;
  final int pendingItems;
  final int failedItems;
  final int syncingItems;

  const SyncQueueStats({
    required this.totalItems,
    required this.pendingItems,
    required this.failedItems,
    required this.syncingItems,
  });
}
