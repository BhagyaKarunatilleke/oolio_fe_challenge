// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 3;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      id: fields[0] as String,
      createdAt: fields[1] as DateTime,
      updatedAt: fields[2] as DateTime,
      version: fields[3] as int,
      syncStatus: fields[4] as SyncStatus,
      metadata: (fields[5] as Map?)?.cast<String, dynamic>(),
      name: fields[6] as String,
      description: fields[7] as String,
      price: fields[8] as double,
      category: fields[9] as String,
      tags: (fields[10] as List).cast<String>(),
      isAvailable: fields[11] as bool,
      stockQuantity: fields[12] as int,
      variants: (fields[13] as List).cast<ProductVariant>(),
      addons: (fields[14] as List).cast<ProductAddon>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(15)
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
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.price)
      ..writeByte(9)
      ..write(obj.category)
      ..writeByte(10)
      ..write(obj.tags)
      ..writeByte(11)
      ..write(obj.isAvailable)
      ..writeByte(12)
      ..write(obj.stockQuantity)
      ..writeByte(13)
      ..write(obj.variants)
      ..writeByte(14)
      ..write(obj.addons);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      syncStatus:
          $enumDecodeNullable(_$SyncStatusEnumMap, json['syncStatus']) ??
              SyncStatus.pending,
      metadata: json['metadata'] as Map<String, dynamic>?,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      category: json['category'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      isAvailable: json['isAvailable'] as bool? ?? true,
      stockQuantity: (json['stockQuantity'] as num?)?.toInt() ?? 0,
      variants: (json['variants'] as List<dynamic>?)
              ?.map((e) => ProductVariant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      addons: (json['addons'] as List<dynamic>?)
              ?.map((e) => ProductAddon.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'version': instance.version,
      'syncStatus': _$SyncStatusEnumMap[instance.syncStatus]!,
      'metadata': instance.metadata,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'category': instance.category,
      'tags': instance.tags,
      'isAvailable': instance.isAvailable,
      'stockQuantity': instance.stockQuantity,
      'variants': instance.variants,
      'addons': instance.addons,
    };

const _$SyncStatusEnumMap = {
  SyncStatus.pending: 'pending',
  SyncStatus.syncing: 'syncing',
  SyncStatus.synced: 'synced',
  SyncStatus.failed: 'failed',
  SyncStatus.conflicted: 'conflicted',
};
