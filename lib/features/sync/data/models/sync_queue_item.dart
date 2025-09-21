import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../shared/models/sync_status.dart';
import 'sync_operation.dart';

part 'sync_queue_item.g.dart';
part 'sync_queue_item.freezed.dart';

@freezed
@HiveType(typeId: 10)
class SyncQueueItem with _$SyncQueueItem {
  const factory SyncQueueItem({
    @HiveField(0) required String id,
    @HiveField(1) required DateTime createdAt,
    @HiveField(2) required DateTime updatedAt,
    @HiveField(3) @Default(1) int version,
    @HiveField(4) @Default(SyncStatus.pending) SyncStatus syncStatus,
    @HiveField(5) Map<String, dynamic>? metadata,
    @HiveField(6) required String entityType,
    @HiveField(7) required String entityId,
    @HiveField(8) required SyncOperation operation,
    @HiveField(9) required Map<String, dynamic> data,
    @HiveField(10) @Default(0) int retryCount,
    @HiveField(11) DateTime? lastRetryAt,
    @HiveField(12) String? errorMessage,
    @HiveField(13) @Default(0) int priority,
  }) = _SyncQueueItem;

  factory SyncQueueItem.fromJson(Map<String, dynamic> json) => _$SyncQueueItemFromJson(json);

  factory SyncQueueItem.create({
    String? id,
    required String entityType,
    required String entityId,
    required SyncOperation operation,
    required Map<String, dynamic> data,
    int retryCount = 0,
    DateTime? lastRetryAt,
    String? errorMessage,
    int priority = 0,
    Map<String, dynamic>? metadata,
  }) {
    final now = DateTime.now();
    return SyncQueueItem(
      id: id ?? const Uuid().v4(),
      createdAt: now,
      updatedAt: now,
      entityType: entityType,
      entityId: entityId,
      operation: operation,
      data: data,
      retryCount: retryCount,
      lastRetryAt: lastRetryAt,
      errorMessage: errorMessage,
      priority: priority,
      metadata: metadata,
    );
  }
}

// Extension methods for SyncQueueItem operations
extension SyncQueueItemExtension on SyncQueueItem {
  SyncQueueItem incrementRetryCount() {
    return copyWith(
      retryCount: retryCount + 1,
      lastRetryAt: DateTime.now(),
    ).updateVersion();
  }

  SyncQueueItem setError(String error) {
    return copyWith(
      errorMessage: error,
    ).markAsFailed();
  }

  SyncQueueItem clearError() {
    return copyWith(
      errorMessage: null,
    ).markAsPending();
  }

  SyncQueueItem markAsSyncing() {
    return copyWith(
      syncStatus: SyncStatus.syncing,
    ).updateVersion();
  }

  bool shouldRetry(int maxRetries) {
    return retryCount < maxRetries && syncStatus != SyncStatus.synced;
  }

  Duration getRetryDelay() {
    // Exponential backoff: 2^retryCount seconds
    return Duration(seconds: (2 << retryCount).clamp(1, 60));
  }

  SyncQueueItem updateVersion() {
    return copyWith(
      version: version + 1,
      updatedAt: DateTime.now(),
    );
  }

  SyncQueueItem markAsPending() {
    return copyWith(
      syncStatus: SyncStatus.pending,
    ).updateVersion();
  }

  SyncQueueItem markAsFailed() {
    return copyWith(
      syncStatus: SyncStatus.failed,
    ).updateVersion();
  }

  SyncQueueItem markAsSynced() {
    return copyWith(
      syncStatus: SyncStatus.synced,
    ).updateVersion();
  }
}
