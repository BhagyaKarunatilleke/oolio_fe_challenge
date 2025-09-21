import 'package:injectable/injectable.dart';
import '../../../../core/storage/storage_service.dart';
import '../../domain/repositories/order_repository.dart';
import '../../domain/models/order_model.dart';
import '../../domain/models/order_status.dart';
import '../../domain/models/order_item_model.dart';
import '../../../cart/data/models/cart_model.dart';
import '../../../cart/data/models/cart_item_model.dart';

@LazySingleton(as: OrderRepository)
class OrderRepositoryImpl implements OrderRepository {
  final StorageService _storage;
  static const String _boxName = 'orders';

  OrderRepositoryImpl(this._storage);

  @override
  Future<OrderModel> createOrder(OrderModel order) async {
    await _storage.save(_boxName, order);
    return order;
  }

  @override
  Future<OrderModel?> getOrderById(String orderId) async {
    return await _storage.get<OrderModel>(_boxName, orderId);
  }

  @override
  Future<List<OrderModel>> getAllOrders() async {
    final orders = await _storage.getAll<OrderModel>(_boxName);
    // Sort by creation date (newest first)
    orders.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return orders;
  }

  @override
  Future<List<OrderModel>> getOrdersByStatus(OrderStatus status) async {
    final orders = await _storage.getAll<OrderModel>(_boxName);
    return orders.where((order) => order.status == status).toList();
  }

  @override
  Future<OrderModel> updateOrder(OrderModel order) async {
    final updatedOrder = order.updateVersion();
    await _storage.save(_boxName, updatedOrder);
    return updatedOrder;
  }

  @override
  Future<void> deleteOrder(String orderId) async {
    await _storage.delete(_boxName, orderId);
  }

  @override
  Future<OrderModel> updateOrderStatus(
    String orderId,
    OrderStatus newStatus,
  ) async {
    final order = await getOrderById(orderId);
    if (order == null) {
      throw Exception('Order not found: $orderId');
    }
    final updatedOrder = order.updateStatus(newStatus);
    return await updateOrder(updatedOrder);
  }

  @override
  Future<List<OrderModel>> getTodayOrders() async {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

    final orders = await _storage.getAll<OrderModel>(_boxName);
    return orders
        .where(
          (order) =>
              order.createdAt.isAfter(startOfDay) &&
              order.createdAt.isBefore(endOfDay),
        )
        .toList();
  }

  @override
  Future<List<OrderModel>> getOrdersByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final orders = await _storage.getAll<OrderModel>(_boxName);
    return orders
        .where(
          (order) =>
              order.createdAt.isAfter(startDate) &&
              order.createdAt.isBefore(endDate),
        )
        .toList();
  }

  @override
  Future<OrderModel> createOrderFromCart(
    String cartId,
    String? customerName,
    String? customerPhone,
    String? specialInstructions,
  ) async {
    // Get cart data
    final cart = await _storage.get<CartModel>('cart', cartId);
    if (cart == null) {
      throw Exception('Cart not found: $cartId');
    }

    if (cart.isEmpty) {
      throw Exception('Cannot create order from empty cart');
    }

    // Convert cart items to order items
    final orderItems = cart.items
        .map((cartItem) => _convertCartItemToOrderItem(cartItem))
        .toList();

    // Create order
    final order = OrderModel.create(
      status: OrderStatus.pending,
      items: orderItems,
      customerName: customerName,
      customerPhone: customerPhone,
      specialInstructions: specialInstructions,
    );

    // Save order
    return await createOrder(order);
  }

  OrderItemModel _convertCartItemToOrderItem(CartItemModel cartItem) {
    return OrderItemModel.create(
      productId: cartItem.productId,
      productName: cartItem.productName,
      quantity: cartItem.quantity,
      unitPrice: cartItem.unitPrice,
      selectedVariants: cartItem.selectedVariants,
      selectedAddons: cartItem.selectedAddons,
      specialInstructions: cartItem.specialInstructions,
    );
  }
}
