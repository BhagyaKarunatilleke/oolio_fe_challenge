// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_addon.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAddonAdapter extends TypeAdapter<ProductAddon> {
  @override
  final int typeId = 2;

  @override
  ProductAddon read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductAddon(
      name: fields[0] as String,
      price: fields[1] as double,
      isRequired: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ProductAddon obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.isRequired);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAddonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductAddonImpl _$$ProductAddonImplFromJson(Map<String, dynamic> json) =>
    _$ProductAddonImpl(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      isRequired: json['isRequired'] as bool? ?? false,
    );

Map<String, dynamic> _$$ProductAddonImplToJson(_$ProductAddonImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'isRequired': instance.isRequired,
    };
