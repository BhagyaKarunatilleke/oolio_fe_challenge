import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../domain/models/cart_model.dart';
import '../../domain/models/cart_item_model.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  final CartRepository _repository;

  CartCubit(this._repository) : super(CartInitial());

  Future<void> loadCart() async {
    emit(CartLoading());
    try {
      final cart = await _repository.getCurrentCart();
      emit(CartLoaded(cart: cart));
    } catch (e) {
      emit(CartError('Failed to load cart: ${e.toString()}'));
    }
  }

  Future<void> addItemToCart(CartItemModel item) async {
    final currentState = state;
    if (currentState is CartLoaded) {
      emit(CartLoading());
      try {
        final updatedCart = await _repository.addItemToCart(item);
        emit(CartLoaded(cart: updatedCart));
      } catch (e) {
        emit(CartError('Failed to add item to cart: ${e.toString()}'));
      }
    } else {
      // Load cart first, then add item
      emit(CartLoading());
      try {
        final cart = await _repository.getCurrentCart();
        final updatedCart = cart.addItem(item);
        await _repository.saveCart(updatedCart);
        emit(CartLoaded(cart: updatedCart));
      } catch (e) {
        emit(CartError('Failed to add item to cart: ${e.toString()}'));
      }
    }
  }

  Future<void> removeItemFromCart(String itemId) async {
    final currentState = state;
    if (currentState is CartLoaded) {
      emit(CartLoading());
      try {
        final updatedCart = await _repository.removeItemFromCart(itemId);
        emit(CartLoaded(cart: updatedCart));
      } catch (e) {
        emit(CartError('Failed to remove item from cart: ${e.toString()}'));
      }
    } else {
      // Load cart first, then remove item
      emit(CartLoading());
      try {
        final cart = await _repository.getCurrentCart();
        final updatedCart = cart.removeItem(itemId);
        await _repository.saveCart(updatedCart);
        emit(CartLoaded(cart: updatedCart));
      } catch (e) {
        emit(CartError('Failed to remove item from cart: ${e.toString()}'));
      }
    }
  }

  Future<void> updateItemQuantity(String itemId, int quantity) async {
    final currentState = state;
    if (currentState is CartLoaded) {
      emit(CartLoading());
      try {
        final updatedCart = await _repository.updateItemQuantity(
          itemId,
          quantity,
        );
        emit(CartLoaded(cart: updatedCart));
      } catch (e) {
        emit(CartError('Failed to update item quantity: ${e.toString()}'));
      }
    } else {
      // Load cart first, then update quantity
      emit(CartLoading());
      try {
        final cart = await _repository.getCurrentCart();
        final updatedCart = cart.updateItemQuantity(itemId, quantity);
        await _repository.saveCart(updatedCart);
        emit(CartLoaded(cart: updatedCart));
      } catch (e) {
        emit(CartError('Failed to update item quantity: ${e.toString()}'));
      }
    }
  }

  Future<void> incrementItemQuantity(String itemId) async {
    final currentState = state;
    if (currentState is CartLoaded) {
      final item = currentState.cart.items.firstWhere(
        (item) => item.id == itemId,
        orElse: () => throw Exception('Item not found'),
      );
      await updateItemQuantity(itemId, item.quantity + 1);
    }
  }

  Future<void> decrementItemQuantity(String itemId) async {
    final currentState = state;
    if (currentState is CartLoaded) {
      final item = currentState.cart.items.firstWhere(
        (item) => item.id == itemId,
        orElse: () => throw Exception('Item not found'),
      );
      final newQuantity = (item.quantity - 1).clamp(0, item.quantity);
      if (newQuantity == 0) {
        await removeItemFromCart(itemId);
      } else {
        await updateItemQuantity(itemId, newQuantity);
      }
    }
  }

  Future<void> clearCart() async {
    final currentState = state;
    if (currentState is CartLoaded) {
      emit(CartLoading());
      try {
        final updatedCart = await _repository.clearCart();
        emit(CartLoaded(cart: updatedCart));
      } catch (e) {
        emit(CartError('Failed to clear cart: ${e.toString()}'));
      }
    } else {
      // Load cart first, then clear it
      emit(CartLoading());
      try {
        final cart = await _repository.getCurrentCart();
        final updatedCart = cart.clearCart();
        await _repository.saveCart(updatedCart);
        emit(CartLoaded(cart: updatedCart));
      } catch (e) {
        emit(CartError('Failed to clear cart: ${e.toString()}'));
      }
    }
  }

  Future<void> updateCustomerInfo({
    String? customerName,
    String? customerPhone,
    String? notes,
  }) async {
    final currentState = state;
    if (currentState is CartLoaded) {
      emit(CartLoading());
      try {
        final updatedCart = await _repository.updateCustomerInfo(
          customerName: customerName,
          customerPhone: customerPhone,
          notes: notes,
        );
        emit(CartLoaded(cart: updatedCart));
      } catch (e) {
        emit(CartError('Failed to update customer info: ${e.toString()}'));
      }
    }
  }

  // Helper methods
  int getItemCount() {
    final currentState = state;
    if (currentState is CartLoaded) {
      return currentState.cart.itemCount;
    }
    return 0;
  }

  double getTotal() {
    final currentState = state;
    if (currentState is CartLoaded) {
      return currentState.cart.total;
    }
    return 0.0;
  }

  bool isEmpty() {
    final currentState = state;
    if (currentState is CartLoaded) {
      return currentState.cart.isEmpty;
    }
    return true;
  }
}
