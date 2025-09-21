import 'package:injectable/injectable.dart';
import '../../../../core/storage/storage_service.dart';
import '../../../../core/constants/storage_keys.dart';
import '../../domain/repositories/cart_repository.dart';
import '../models/cart_model.dart';
import '../models/cart_item_model.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final StorageService _storage;
  static const String _currentCartKey = 'current_cart_id';

  CartRepositoryImpl(this._storage);

  @override
  Future<CartModel> getCurrentCart() async {
    try {
      final cartId = _storage.getString(_currentCartKey);

      if (cartId != null) {
        final cart = await _storage.get<CartModel>(
          StorageKeys.ordersBox,
          cartId,
        );
        if (cart != null) {
          return cart;
        }
      }

      // Create new cart if none exists
      final newCart = CartModel.create();
      await saveCart(newCart);
      await _storage.setString(_currentCartKey, newCart.id);
      return newCart;
    } catch (e) {
      // Fallback to new cart if error occurs
      final newCart = CartModel.create();
      await saveCart(newCart);
      await _storage.setString(_currentCartKey, newCart.id);
      return newCart;
    }
  }

  @override
  Future<CartModel> addItemToCart(CartItemModel item) async {
    final cart = await getCurrentCart();
    final updatedCart = cart.addItem(item);
    await saveCart(updatedCart);
    return updatedCart;
  }

  @override
  Future<CartModel> removeItemFromCart(String itemId) async {
    final cart = await getCurrentCart();
    final updatedCart = cart.removeItem(itemId);
    await saveCart(updatedCart);
    return updatedCart;
  }

  @override
  Future<CartModel> updateItemQuantity(String itemId, int quantity) async {
    final cart = await getCurrentCart();
    final updatedCart = cart.updateItemQuantity(itemId, quantity);
    await saveCart(updatedCart);
    return updatedCart;
  }

  @override
  Future<CartModel> clearCart() async {
    final cart = await getCurrentCart();
    final updatedCart = cart.clearCart();
    await saveCart(updatedCart);
    return updatedCart;
  }

  @override
  Future<CartModel> updateCustomerInfo({
    String? customerName,
    String? customerPhone,
    String? notes,
  }) async {
    final cart = await getCurrentCart();
    final updatedCart = cart.updateCustomerInfo(
      customerName: customerName,
      customerPhone: customerPhone,
      notes: notes,
    );
    await saveCart(updatedCart);
    return updatedCart;
  }

  @override
  Future<void> saveCart(CartModel cart) async {
    await _storage.save(StorageKeys.ordersBox, cart);
  }
}
