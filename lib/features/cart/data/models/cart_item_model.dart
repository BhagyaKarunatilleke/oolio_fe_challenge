import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../shared/models/sync_status.dart';

part 'cart_item_model.g.dart';
part 'cart_item_model.freezed.dart';

@freezed
@HiveType(typeId: 14)
class CartItemModel with _$CartItemModel {
  const factory CartItemModel({
    @HiveField(0) required String id,
    @HiveField(1) required DateTime createdAt,
    @HiveField(2) required DateTime updatedAt,
    @HiveField(3) @Default(1) int version,
    @HiveField(4) @Default(SyncStatus.pending) SyncStatus syncStatus,
    @HiveField(5) Map<String, dynamic>? metadata,
    @HiveField(6) required String productId,
    @HiveField(7) required String productName,
    @HiveField(8) required String productDescription,
    @HiveField(9) required double unitPrice,
    @HiveField(10) required int quantity,
    @HiveField(11) @Default([]) List<String> selectedVariants,
    @HiveField(12) @Default([]) List<String> selectedAddons,
    @HiveField(13) String? specialInstructions,
    @HiveField(14) String? imageUrl,
  }) = _CartItemModel;

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  factory CartItemModel.create({
    String? id,
    required String productId,
    required String productName,
    required String productDescription,
    required double unitPrice,
    required int quantity,
    List<String> selectedVariants = const [],
    List<String> selectedAddons = const [],
    String? specialInstructions,
    String? imageUrl,
    Map<String, dynamic>? metadata,
  }) {
    final now = DateTime.now();
    return CartItemModel(
      id: id ?? const Uuid().v4(),
      createdAt: now,
      updatedAt: now,
      productId: productId,
      productName: productName,
      productDescription: productDescription,
      unitPrice: unitPrice,
      quantity: quantity,
      selectedVariants: selectedVariants,
      selectedAddons: selectedAddons,
      specialInstructions: specialInstructions,
      imageUrl: imageUrl,
      metadata: metadata,
    );
  }
}

extension CartItemModelExtension on CartItemModel {
  double get totalPrice => quantity * unitPrice;

  CartItemModel updateQuantity(int newQuantity) {
    return copyWith(quantity: newQuantity).updateVersion().markAsPending();
  }

  CartItemModel incrementQuantity() {
    return updateQuantity(quantity + 1);
  }

  CartItemModel decrementQuantity() {
    return updateQuantity((quantity - 1).clamp(0, quantity));
  }

  CartItemModel updateSpecialInstructions(String? instructions) {
    return copyWith(
      specialInstructions: instructions,
    ).updateVersion().markAsPending();
  }

  CartItemModel updateVersion() {
    return copyWith(version: version + 1, updatedAt: DateTime.now());
  }

  CartItemModel markAsPending() {
    return copyWith(syncStatus: SyncStatus.pending).updateVersion();
  }

  // Check if this cart item matches another product with same variants/addons
  bool matchesProduct(
    String productId,
    List<String> variants,
    List<String> addons,
  ) {
    return productId == productId &&
        _listEquals(selectedVariants, variants) &&
        _listEquals(selectedAddons, addons);
  }

  bool _listEquals<T>(List<T> a, List<T> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
