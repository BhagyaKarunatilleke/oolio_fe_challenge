// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variant.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductVariantAdapter extends TypeAdapter<ProductVariant> {
  @override
  final int typeId = 1;

  @override
  ProductVariant read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductVariant(
      name: fields[0] as String,
      priceModifier: fields[1] as double,
      isDefault: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ProductVariant obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.priceModifier)
      ..writeByte(2)
      ..write(obj.isDefault);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductVariantAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductVariantImpl _$$ProductVariantImplFromJson(Map<String, dynamic> json) =>
    _$ProductVariantImpl(
      name: json['name'] as String,
      priceModifier: (json['priceModifier'] as num).toDouble(),
      isDefault: json['isDefault'] as bool? ?? false,
    );

Map<String, dynamic> _$$ProductVariantImplToJson(
        _$ProductVariantImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'priceModifier': instance.priceModifier,
      'isDefault': instance.isDefault,
    };
