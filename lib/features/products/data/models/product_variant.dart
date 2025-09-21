import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_variant.g.dart';
part 'product_variant.freezed.dart';

@freezed
@HiveType(typeId: 1)
class ProductVariant with _$ProductVariant {
  const factory ProductVariant({
    @HiveField(0) required String name,
    @HiveField(1) required double priceModifier,
    @HiveField(2) @Default(false) bool isDefault,
  }) = _ProductVariant;

  factory ProductVariant.fromJson(Map<String, dynamic> json) => _$ProductVariantFromJson(json);
}
