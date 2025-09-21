// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderItemModelAdapter extends TypeAdapter<OrderItemModel> {
  @override
  final int typeId = 7;

  @override
  OrderItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderItemModel(
      id: fields[0] as String,
      createdAt: fields[1] as DateTime,
      updatedAt: fields[2] as DateTime,
      version: fields[3] as int,
      syncStatus: fields[4] as SyncStatus,
      metadata: (fields[5] as Map?)?.cast<String, dynamic>(),
      productId: fields[6] as String,
      productName: fields[7] as String,
      quantity: fields[8] as int,
      unitPrice: fields[9] as double,
      selectedVariants: (fields[10] as List).cast<String>(),
      selectedAddons: (fields[11] as List).cast<String>(),
      specialInstructions: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OrderItemModel obj) {
    writer
      ..writeByte(13)
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
      ..write(obj.productId)
      ..writeByte(7)
      ..write(obj.productName)
      ..writeByte(8)
      ..write(obj.quantity)
      ..writeByte(9)
      ..write(obj.unitPrice)
      ..writeByte(10)
      ..write(obj.selectedVariants)
      ..writeByte(11)
      ..write(obj.selectedAddons)
      ..writeByte(12)
      ..write(obj.specialInstructions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderItemModelImpl _$$OrderItemModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemModelImpl(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      syncStatus:
          $enumDecodeNullable(_$SyncStatusEnumMap, json['syncStatus']) ??
              SyncStatus.pending,
      metadata: json['metadata'] as Map<String, dynamic>?,
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: (json['unitPrice'] as num).toDouble(),
      selectedVariants: (json['selectedVariants'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      selectedAddons: (json['selectedAddons'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      specialInstructions: json['specialInstructions'] as String?,
    );

Map<String, dynamic> _$$OrderItemModelImplToJson(
        _$OrderItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'version': instance.version,
      'syncStatus': _$SyncStatusEnumMap[instance.syncStatus]!,
      'metadata': instance.metadata,
      'productId': instance.productId,
      'productName': instance.productName,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'selectedVariants': instance.selectedVariants,
      'selectedAddons': instance.selectedAddons,
      'specialInstructions': instance.specialInstructions,
    };

const _$SyncStatusEnumMap = {
  SyncStatus.pending: 'pending',
  SyncStatus.syncing: 'syncing',
  SyncStatus.synced: 'synced',
  SyncStatus.failed: 'failed',
  SyncStatus.conflicted: 'conflicted',
};
