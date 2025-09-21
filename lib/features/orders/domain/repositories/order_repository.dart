import '../models/order_model.dart';
import '../models/order_status.dart';

abstract class OrderRepository {
  // Order CRUD operations
  Future<OrderModel> createOrder(OrderModel order);
  Future<OrderModel?> getOrderById(String orderId);
  Future<List<OrderModel>> getAllOrders();
  Future<List<OrderModel>> getOrdersByStatus(OrderStatus status);
  Future<OrderModel> updateOrder(OrderModel order);
  Future<void> deleteOrder(String orderId);

  // Order management
  Future<OrderModel> updateOrderStatus(String orderId, OrderStatus newStatus);
  Future<List<OrderModel>> getTodayOrders();
  Future<List<OrderModel>> getOrdersByDateRange(
    DateTime startDate,
    DateTime endDate,
  );

  // Order conversion from cart
  Future<OrderModel> createOrderFromCart(
    String cartId,
    String? customerName,
    String? customerPhone,
    String? specialInstructions,
  );
}
