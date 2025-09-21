import '../models/cart_model.dart';
import '../models/cart_item_model.dart';

abstract class CartRepository {
  Future<CartModel> getCurrentCart();
  Future<CartModel> addItemToCart(CartItemModel item);
  Future<CartModel> removeItemFromCart(String itemId);
  Future<CartModel> updateItemQuantity(String itemId, int quantity);
  Future<CartModel> clearCart();
  Future<CartModel> updateCustomerInfo({
    String? customerName,
    String? customerPhone,
    String? notes,
  });
  Future<void> saveCart(CartModel cart);
}
