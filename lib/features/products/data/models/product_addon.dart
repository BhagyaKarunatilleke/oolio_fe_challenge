import 'package:hive/hive.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_addon.g.dart';
part 'product_addon.freezed.dart';

@freezed
@HiveType(typeId: 2)
class ProductAddon with _$ProductAddon {
  const factory ProductAddon({
    @HiveField(0) required String name,
    @HiveField(1) required double price,
    @HiveField(2) @Default(false) bool isRequired,
  }) = _ProductAddon;

  factory ProductAddon.fromJson(Map<String, dynamic> json) => _$ProductAddonFromJson(json);
}
