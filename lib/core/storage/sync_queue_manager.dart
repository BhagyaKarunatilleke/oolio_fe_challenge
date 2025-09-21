import 'dart:async';
import '../constants/app_constants.dart';
import '../constants/storage_keys.dart';
import '../errors/exceptions.dart';
import 'local_storage_service.dart';
import '../../features/sync/data/models/sync_queue_item.dart';
import '../../features/sync/data/models/sync_operation.dart';
import '../../shared/models/sync_status.dart';

class SyncQueueManager {
  static SyncQueueManager? _instance;
  static SyncQueueManager get instance => _instance ??= SyncQueueManager._();
  
  SyncQueueManager._();

  final LocalStorageService _storage = LocalStorageService.instance;
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
    final items = await _storage.getAll<SyncQueueItem>(StorageKeys.syncQueueBox);
    
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
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Simulate random failures for testing
    if (DateTime.now().millisecondsSinceEpoch % 10 == 0) {
      throw SyncException('Simulated network error');
    }

    // Simulate successful API response
    switch (item.operation) {
      case SyncOperation.create:
        // Simulate creating entity on server
        break;
      case SyncOperation.update:
        // Simulate updating entity on server
        break;
      case SyncOperation.delete:
        // Simulate deleting entity on server
        break;
    }
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

  // Connectivity simulation
  bool _isOnlineSimulated = true;
  
  bool _isOnline() {
    // In a real app, this would check actual connectivity
    return _isOnlineSimulated;
  }

  void setOnlineStatus(bool isOnline) {
    _isOnlineSimulated = isOnline;
    
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
    final items = await _storage.getAll<SyncQueueItem>(StorageKeys.syncQueueBox);
    
    return SyncQueueStats(
      totalItems: items.length,
      pendingItems: items.where((i) => i.syncStatus == SyncStatus.pending).length,
      failedItems: items.where((i) => i.syncStatus == SyncStatus.failed).length,
      syncingItems: items.where((i) => i.syncStatus == SyncStatus.syncing).length,
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
  
  static SyncQueueItemQueued itemQueued(SyncQueueItem item) => SyncQueueItemQueued(item);
}

class SyncQueueItemProcessing extends SyncQueueEvent {
  final SyncQueueItem item;
  const SyncQueueItemProcessing(this.item);
  
  static SyncQueueItemProcessing itemProcessing(SyncQueueItem item) => SyncQueueItemProcessing(item);
}

class SyncQueueItemCompleted extends SyncQueueEvent {
  final SyncQueueItem item;
  const SyncQueueItemCompleted(this.item);
  
  static SyncQueueItemCompleted itemCompleted(SyncQueueItem item) => SyncQueueItemCompleted(item);
}

class SyncQueueItemFailed extends SyncQueueEvent {
  final SyncQueueItem item;
  final String error;
  const SyncQueueItemFailed(this.item, this.error);
  
  static SyncQueueItemFailed itemFailed(SyncQueueItem item, String error) => SyncQueueItemFailed(item, error);
}

class SyncQueueItemRemoved extends SyncQueueEvent {
  final SyncQueueItem item;
  const SyncQueueItemRemoved(this.item);
  
  static SyncQueueItemRemoved itemRemoved(SyncQueueItem item) => SyncQueueItemRemoved(item);
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
