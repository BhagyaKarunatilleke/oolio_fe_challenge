import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../shared/models/sync_status.dart';
import 'cart_item_model.dart';

part 'cart_model.g.dart';
part 'cart_model.freezed.dart';

@freezed
@HiveType(typeId: 15)
class CartModel with _$CartModel {
  const factory CartModel({
    @HiveField(0) required String id,
    @HiveField(1) required DateTime createdAt,
    @HiveField(2) required DateTime updatedAt,
    @HiveField(3) @Default(1) int version,
    @HiveField(4) @Default(SyncStatus.pending) SyncStatus syncStatus,
    @HiveField(5) Map<String, dynamic>? metadata,
    @HiveField(6) @Default([]) List<CartItemModel> items,
    @HiveField(7) @Default(0.0) double taxRate,
    @HiveField(8) String? customerName,
    @HiveField(9) String? customerPhone,
    @HiveField(10) String? notes,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  factory CartModel.create({
    String? id,
    List<CartItemModel> items = const [],
    double taxRate = 0.1, // 10% default tax
    String? customerName,
    String? customerPhone,
    String? notes,
    Map<String, dynamic>? metadata,
  }) {
    final now = DateTime.now();
    return CartModel(
      id: id ?? const Uuid().v4(),
      createdAt: now,
      updatedAt: now,
      items: items,
      taxRate: taxRate,
      customerName: customerName,
      customerPhone: customerPhone,
      notes: notes,
      metadata: metadata,
    );
  }
}

extension CartModelExtension on CartModel {
  double get subtotal => items.fold(0.0, (sum, item) => sum + item.totalPrice);

  double get taxAmount => subtotal * taxRate;

  double get total => subtotal + taxAmount;

  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);

  bool get isEmpty => items.isEmpty;

  CartModel addItem(CartItemModel item) {
    final existingItemIndex = items.indexWhere(
      (existingItem) => existingItem.matchesProduct(
        item.productId,
        item.selectedVariants,
        item.selectedAddons,
      ),
    );

    List<CartItemModel> newItems;
    if (existingItemIndex != -1) {
      // Update existing item quantity
      final existingItem = items[existingItemIndex];
      final updatedItem = existingItem.updateQuantity(
        existingItem.quantity + item.quantity,
      );
      newItems = List.from(items);
      newItems[existingItemIndex] = updatedItem;
    } else {
      // Add new item
      newItems = [...items, item];
    }

    return copyWith(items: newItems).updateVersion().markAsPending();
  }

  CartModel removeItem(String itemId) {
    final newItems = items.where((item) => item.id != itemId).toList();
    return copyWith(items: newItems).updateVersion().markAsPending();
  }

  CartModel updateItemQuantity(String itemId, int quantity) {
    final newItems = items.map((item) {
      if (item.id == itemId) {
        return item.updateQuantity(quantity);
      }
      return item;
    }).toList();
    return copyWith(items: newItems).updateVersion().markAsPending();
  }

  CartModel clearCart() {
    return copyWith(items: []).updateVersion().markAsPending();
  }

  CartModel updateCustomerInfo({
    String? customerName,
    String? customerPhone,
    String? notes,
  }) {
    return copyWith(
      customerName: customerName ?? this.customerName,
      customerPhone: customerPhone ?? this.customerPhone,
      notes: notes ?? this.notes,
    ).updateVersion().markAsPending();
  }

  CartModel updateVersion() {
    return copyWith(version: version + 1, updatedAt: DateTime.now());
  }

  CartModel markAsPending() {
    return copyWith(syncStatus: SyncStatus.pending).updateVersion();
  }
}
