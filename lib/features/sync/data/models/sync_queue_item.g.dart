// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_queue_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SyncQueueItemAdapter extends TypeAdapter<SyncQueueItem> {
  @override
  final int typeId = 10;

  @override
  SyncQueueItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SyncQueueItem(
      id: fields[0] as String,
      createdAt: fields[1] as DateTime,
      updatedAt: fields[2] as DateTime,
      version: fields[3] as int,
      syncStatus: fields[4] as SyncStatus,
      metadata: (fields[5] as Map?)?.cast<String, dynamic>(),
      entityType: fields[6] as String,
      entityId: fields[7] as String,
      operation: fields[8] as SyncOperation,
      data: (fields[9] as Map).cast<String, dynamic>(),
      retryCount: fields[10] as int,
      lastRetryAt: fields[11] as DateTime?,
      errorMessage: fields[12] as String?,
      priority: fields[13] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SyncQueueItem obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.updatedAt)
      ..writeByte(3)
      ..write(obj.version)
      ..writeByte(4)
      ..write(obj.syncStatus)
      ..writeByte(5)
      ..write(obj.metadata)
      ..writeByte(6)
      ..write(obj.entityType)
      ..writeByte(7)
      ..write(obj.entityId)
      ..writeByte(8)
      ..write(obj.operation)
      ..writeByte(9)
      ..write(obj.data)
      ..writeByte(10)
      ..write(obj.retryCount)
      ..writeByte(11)
      ..write(obj.lastRetryAt)
      ..writeByte(12)
      ..write(obj.errorMessage)
      ..writeByte(13)
      ..write(obj.priority);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SyncQueueItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SyncQueueItemImpl _$$SyncQueueItemImplFromJson(Map<String, dynamic> json) =>
    _$SyncQueueItemImpl(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      syncStatus:
          $enumDecodeNullable(_$SyncStatusEnumMap, json['syncStatus']) ??
              SyncStatus.pending,
      metadata: json['metadata'] as Map<String, dynamic>?,
      entityType: json['entityType'] as String,
      entityId: json['entityId'] as String,
      operation: $enumDecode(_$SyncOperationEnumMap, json['operation']),
      data: json['data'] as Map<String, dynamic>,
      retryCount: (json['retryCount'] as num?)?.toInt() ?? 0,
      lastRetryAt: json['lastRetryAt'] == null
          ? null
          : DateTime.parse(json['lastRetryAt'] as String),
      errorMessage: json['errorMessage'] as String?,
      priority: (json['priority'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SyncQueueItemImplToJson(_$SyncQueueItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'version': instance.version,
      'syncStatus': _$SyncStatusEnumMap[instance.syncStatus]!,
      'metadata': instance.metadata,
      'entityType': instance.entityType,
      'entityId': instance.entityId,
      'operation': _$SyncOperationEnumMap[instance.operation]!,
      'data': instance.data,
      'retryCount': instance.retryCount,
      'lastRetryAt': instance.lastRetryAt?.toIso8601String(),
      'errorMessage': instance.errorMessage,
      'priority': instance.priority,
    };

const _$SyncStatusEnumMap = {
  SyncStatus.pending: 'pending',
  SyncStatus.syncing: 'syncing',
  SyncStatus.synced: 'synced',
  SyncStatus.failed: 'failed',
  SyncStatus.conflicted: 'conflicted',
};

const _$SyncOperationEnumMap = {
  SyncOperation.create: 'create',
  SyncOperation.update: 'update',
  SyncOperation.delete: 'delete',
};
