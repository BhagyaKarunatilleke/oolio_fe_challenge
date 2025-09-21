import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../shared/models/sync_status.dart';
import 'conflict_type.dart';
import 'conflict_resolution_strategy.dart';

part 'conflict_resolution.g.dart';
part 'conflict_resolution.freezed.dart';

@freezed
@HiveType(typeId: 13)
class ConflictResolution with _$ConflictResolution {
  const factory ConflictResolution({
    @HiveField(0) required String id,
    @HiveField(1) required DateTime createdAt,
    @HiveField(2) required DateTime updatedAt,
    @HiveField(3) @Default(1) int version,
    @HiveField(4) @Default(SyncStatus.pending) SyncStatus syncStatus,
    @HiveField(5) Map<String, dynamic>? metadata,
    @HiveField(6) required String entityType,
    @HiveField(7) required String entityId,
    @HiveField(8) required Map<String, dynamic> localData,
    @HiveField(9) required Map<String, dynamic> remoteData,
    @HiveField(10) required ConflictType conflictType,
    @HiveField(11) required ConflictResolutionStrategy strategy,
    @HiveField(12) Map<String, dynamic>? resolvedData,
    @HiveField(13) @Default(false) bool isResolved,
  }) = _ConflictResolution;

  factory ConflictResolution.fromJson(Map<String, dynamic> json) => _$ConflictResolutionFromJson(json);

  factory ConflictResolution.create({
    String? id,
    required String entityType,
    required String entityId,
    required Map<String, dynamic> localData,
    required Map<String, dynamic> remoteData,
    required ConflictType conflictType,
    required ConflictResolutionStrategy strategy,
    Map<String, dynamic>? resolvedData,
    bool isResolved = false,
    Map<String, dynamic>? metadata,
  }) {
    final now = DateTime.now();
    return ConflictResolution(
      id: id ?? const Uuid().v4(),
      createdAt: now,
      updatedAt: now,
      entityType: entityType,
      entityId: entityId,
      localData: localData,
      remoteData: remoteData,
      conflictType: conflictType,
      strategy: strategy,
      resolvedData: resolvedData,
      isResolved: isResolved,
      metadata: metadata,
    );
  }
}

// Extension methods for ConflictResolution operations
extension ConflictResolutionExtension on ConflictResolution {
  ConflictResolution resolve(Map<String, dynamic> resolved) {
    return copyWith(
      resolvedData: resolved,
      isResolved: true,
    ).markAsSynced();
  }

  Map<String, dynamic>? getResolution() {
    if (!isResolved || resolvedData == null) {
      return null;
    }

    switch (strategy) {
      case ConflictResolutionStrategy.lastWriteWins:
        return localData['updatedAt'] != null && remoteData['updatedAt'] != null
            ? DateTime.parse(localData['updatedAt'] as String)
                    .isAfter(DateTime.parse(remoteData['updatedAt'] as String))
                ? localData
                : remoteData
            : localData;
      case ConflictResolutionStrategy.firstWriteWins:
        return localData['createdAt'] != null && remoteData['createdAt'] != null
            ? DateTime.parse(localData['createdAt'] as String)
                    .isBefore(DateTime.parse(remoteData['createdAt'] as String))
                ? localData
                : remoteData
            : localData;
      case ConflictResolutionStrategy.merge:
        return _mergeData(localData, remoteData);
      case ConflictResolutionStrategy.manual:
        return resolvedData;
      case ConflictResolutionStrategy.skip:
        return localData; // Keep local version
    }
  }

  Map<String, dynamic> _mergeData(
      Map<String, dynamic> local, Map<String, dynamic> remote) {
    final merged = Map<String, dynamic>.from(local);

    for (final entry in remote.entries) {
      final key = entry.key;
      final remoteValue = entry.value;

      if (!merged.containsKey(key)) {
        merged[key] = remoteValue;
      } else {
        final localValue = merged[key];

        // Handle different data types
        if (localValue is Map<String, dynamic> &&
            remoteValue is Map<String, dynamic>) {
          merged[key] = _mergeData(localValue, remoteValue);
        } else if (localValue is List && remoteValue is List) {
          // Merge lists by combining unique elements
          final combined = List.from(localValue);
          for (final item in remoteValue) {
            if (!combined.contains(item)) {
              combined.add(item);
            }
          }
          merged[key] = combined;
        } else {
          // For primitive types, use remote value if it's newer
          if (local.containsKey('updatedAt') &&
              remote.containsKey('updatedAt')) {
            final localTime = DateTime.parse(local['updatedAt'] as String);
            final remoteTime = DateTime.parse(remote['updatedAt'] as String);
            if (remoteTime.isAfter(localTime)) {
              merged[key] = remoteValue;
            }
          } else {
            merged[key] = remoteValue;
          }
        }
      }
    }

    return merged;
  }

  ConflictResolution updateVersion() {
    return copyWith(
      version: version + 1,
      updatedAt: DateTime.now(),
    );
  }

  ConflictResolution markAsSynced() {
    return copyWith(
      syncStatus: SyncStatus.synced,
    ).updateVersion();
  }
}
