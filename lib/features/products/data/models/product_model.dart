import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../shared/models/sync_status.dart';
import 'product_variant.dart';
import 'product_addon.dart';

part 'product_model.g.dart';
part 'product_model.freezed.dart';

@freezed
@HiveType(typeId: 3)
class ProductModel with _$ProductModel {
  const factory ProductModel({
    @HiveField(0) required String id,
    @HiveField(1) required DateTime createdAt,
    @HiveField(2) required DateTime updatedAt,
    @HiveField(3) @Default(1) int version,
    @HiveField(4) @Default(SyncStatus.pending) SyncStatus syncStatus,
    @HiveField(5) Map<String, dynamic>? metadata,
    @HiveField(6) required String name,
    @HiveField(7) required String description,
    @HiveField(8) required double price,
    @HiveField(9) required String category,
    @HiveField(10) @Default([]) List<String> tags,
    @HiveField(11) @Default(true) bool isAvailable,
    @HiveField(12) @Default(0) int stockQuantity,
    @HiveField(13) @Default([]) List<ProductVariant> variants,
    @HiveField(14) @Default([]) List<ProductAddon> addons,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  factory ProductModel.create({
    String? id,
    required String name,
    required String description,
    required double price,
    required String category,
    List<String> tags = const [],
    bool isAvailable = true,
    int stockQuantity = 0,
    List<ProductVariant> variants = const [],
    List<ProductAddon> addons = const [],
    Map<String, dynamic>? metadata,
  }) {
    final now = DateTime.now();
    return ProductModel(
      id: id ?? const Uuid().v4(),
      createdAt: now,
      updatedAt: now,
      name: name,
      description: description,
      price: price,
      category: category,
      tags: tags,
      isAvailable: isAvailable,
      stockQuantity: stockQuantity,
      variants: variants,
      addons: addons,
      metadata: metadata,
    );
  }
}

// Extension methods for ProductModel operations
extension ProductModelExtension on ProductModel {
  ProductModel updateStock(int quantity) {
    return copyWith(
      stockQuantity: quantity,
    ).updateVersion().markAsPending();
  }

  ProductModel toggleAvailability() {
    return copyWith(
      isAvailable: !isAvailable,
    ).updateVersion().markAsPending();
  }

  ProductModel updateVersion() {
    return copyWith(
      version: version + 1,
      updatedAt: DateTime.now(),
    );
  }

  ProductModel markAsPending() {
    return copyWith(
      syncStatus: SyncStatus.pending,
    ).updateVersion();
  }
}
