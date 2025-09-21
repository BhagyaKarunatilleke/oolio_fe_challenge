// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conflict_resolution.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConflictResolutionAdapter extends TypeAdapter<ConflictResolution> {
  @override
  final int typeId = 13;

  @override
  ConflictResolution read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConflictResolution(
      id: fields[0] as String,
      createdAt: fields[1] as DateTime,
      updatedAt: fields[2] as DateTime,
      version: fields[3] as int,
      syncStatus: fields[4] as SyncStatus,
      metadata: (fields[5] as Map?)?.cast<String, dynamic>(),
      entityType: fields[6] as String,
      entityId: fields[7] as String,
      localData: (fields[8] as Map).cast<String, dynamic>(),
      remoteData: (fields[9] as Map).cast<String, dynamic>(),
      conflictType: fields[10] as ConflictType,
      strategy: fields[11] as ConflictResolutionStrategy,
      resolvedData: (fields[12] as Map?)?.cast<String, dynamic>(),
      isResolved: fields[13] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ConflictResolution obj) {
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
      ..write(obj.localData)
      ..writeByte(9)
      ..write(obj.remoteData)
      ..writeByte(10)
      ..write(obj.conflictType)
      ..writeByte(11)
      ..write(obj.strategy)
      ..writeByte(12)
      ..write(obj.resolvedData)
      ..writeByte(13)
      ..write(obj.isResolved);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConflictResolutionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConflictResolutionImpl _$$ConflictResolutionImplFromJson(
        Map<String, dynamic> json) =>
    _$ConflictResolutionImpl(
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
      localData: json['localData'] as Map<String, dynamic>,
      remoteData: json['remoteData'] as Map<String, dynamic>,
      conflictType: $enumDecode(_$ConflictTypeEnumMap, json['conflictType']),
      strategy:
          $enumDecode(_$ConflictResolutionStrategyEnumMap, json['strategy']),
      resolvedData: json['resolvedData'] as Map<String, dynamic>?,
      isResolved: json['isResolved'] as bool? ?? false,
    );

Map<String, dynamic> _$$ConflictResolutionImplToJson(
        _$ConflictResolutionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'version': instance.version,
      'syncStatus': _$SyncStatusEnumMap[instance.syncStatus]!,
      'metadata': instance.metadata,
      'entityType': instance.entityType,
      'entityId': instance.entityId,
      'localData': instance.localData,
      'remoteData': instance.remoteData,
      'conflictType': _$ConflictTypeEnumMap[instance.conflictType]!,
      'strategy': _$ConflictResolutionStrategyEnumMap[instance.strategy]!,
      'resolvedData': instance.resolvedData,
      'isResolved': instance.isResolved,
    };

const _$SyncStatusEnumMap = {
  SyncStatus.pending: 'pending',
  SyncStatus.syncing: 'syncing',
  SyncStatus.synced: 'synced',
  SyncStatus.failed: 'failed',
  SyncStatus.conflicted: 'conflicted',
};

const _$ConflictTypeEnumMap = {
  ConflictType.versionMismatch: 'versionMismatch',
  ConflictType.concurrentModification: 'concurrentModification',
  ConflictType.dataIntegrity: 'dataIntegrity',
  ConflictType.businessRule: 'businessRule',
};

const _$ConflictResolutionStrategyEnumMap = {
  ConflictResolutionStrategy.lastWriteWins: 'lastWriteWins',
  ConflictResolutionStrategy.firstWriteWins: 'firstWriteWins',
  ConflictResolutionStrategy.merge: 'merge',
  ConflictResolutionStrategy.manual: 'manual',
  ConflictResolutionStrategy.skip: 'skip',
};
