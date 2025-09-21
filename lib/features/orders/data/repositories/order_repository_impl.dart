import 'package:injectable/injectable.dart';
import '../../../../core/storage/storage_service.dart';
import '../../../../core/constants/storage_keys.dart';
import '../../domain/repositories/order_repository.dart';
import '../../domain/models/order_model.dart';
import '../../domain/models/order_status.dart';
import '../../domain/models/order_item_model.dart';
import '../models/payment_method.dart';
import '../models/payment_status.dart';
import '../../../cart/data/models/cart_model.dart';
import '../../../cart/data/models/cart_item_model.dart';

@LazySingleton(as: OrderRepository)
class OrderRepositoryImpl implements OrderRepository {
  final StorageService _storage;
  static const String _boxName = StorageKeys.ordersBox;

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

    // If no orders exist, initialize with sample data
    if (orders.isEmpty) {
      await _initializeSampleOrders();
      return await _storage.getAll<OrderModel>(_boxName);
    }

    // Sort by creation date (newest first)
    orders.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return orders;
  }

  Future<void> _initializeSampleOrders() async {
    // Sample Order 1: Pending
    final order1 = OrderModel.create(
      orderNumber: 'ORD-001',
      status: OrderStatus.pending,
      items: [
        OrderItemModel.create(
          productId: 'product-1',
          productName: 'Classic Burger',
          quantity: 2,
          unitPrice: 12.99,
          selectedVariants: ['Large'],
          selectedAddons: ['Extra Cheese', 'Bacon'],
          specialInstructions: 'No pickles',
        ),
      ],
      customerName: 'John Smith',
      customerPhone: '+1-555-0123',
      paymentMethod: PaymentMethod.card,
      paymentStatus: PaymentStatus.completed,
    );

    // Sample Order 2: Preparing
    final order2 = OrderModel.create(
      orderNumber: 'ORD-002',
      status: OrderStatus.preparing,
      items: [
        OrderItemModel.create(
          productId: 'product-2',
          productName: 'Chicken Wrap',
          quantity: 1,
          unitPrice: 9.99,
          selectedVariants: ['Medium'],
          selectedAddons: ['Extra Sauce'],
        ),
        OrderItemModel.create(
          productId: 'product-3',
          productName: 'Iced Coffee',
          quantity: 1,
          unitPrice: 4.99,
          selectedVariants: ['Large'],
          selectedAddons: ['Extra Shot'],
        ),
      ],
      customerName: 'Sarah Johnson',
      customerPhone: '+1-555-0456',
      paymentMethod: PaymentMethod.cash,
      paymentStatus: PaymentStatus.completed,
    );

    // Sample Order 3: Ready
    final order3 = OrderModel.create(
      orderNumber: 'ORD-003',
      status: OrderStatus.ready,
      items: [
        OrderItemModel.create(
          productId: 'product-4',
          productName: 'Veggie Wrap',
          quantity: 1,
          unitPrice: 8.99,
          selectedVariants: ['Large'],
          selectedAddons: ['Avocado'],
        ),
      ],
      customerName: 'Mike Davis',
      customerPhone: '+1-555-0789',
      paymentMethod: PaymentMethod.digital,
      paymentStatus: PaymentStatus.completed,
    );

    // Sample Order 4: Completed
    final order4 = OrderModel.create(
      orderNumber: 'ORD-004',
      status: OrderStatus.completed,
      items: [
        OrderItemModel.create(
          productId: 'product-5',
          productName: 'Fish Tacos',
          quantity: 3,
          unitPrice: 11.99,
          selectedVariants: ['Medium'],
          selectedAddons: ['Sour Cream'],
          specialInstructions: 'Extra spicy',
        ),
      ],
      customerName: 'Emily Wilson',
      customerPhone: '+1-555-0321',
      paymentMethod: PaymentMethod.card,
      paymentStatus: PaymentStatus.completed,
    );

    // Sample Order 5: Completed (older)
    final order5 = OrderModel.create(
      orderNumber: 'ORD-005',
      status: OrderStatus.completed,
      items: [
        OrderItemModel.create(
          productId: 'product-6',
          productName: 'Caesar Salad',
          quantity: 1,
          unitPrice: 7.99,
          selectedVariants: ['Regular'],
          selectedAddons: ['Grilled Chicken'],
        ),
      ],
      customerName: 'David Brown',
      customerPhone: '+1-555-0654',
      paymentMethod: PaymentMethod.cash,
      paymentStatus: PaymentStatus.completed,
    );

    // Save all sample orders
    await _storage.save(_boxName, order1);
    await _storage.save(_boxName, order2);
    await _storage.save(_boxName, order3);
    await _storage.save(_boxName, order4);
    await _storage.save(_boxName, order5);
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
