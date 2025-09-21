import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/order_repository.dart';
import '../../domain/models/order_model.dart';
import '../../domain/models/order_status.dart';
import 'order_state.dart';

@injectable
class OrderCubit extends Cubit<OrderState> {
  final OrderRepository _repository;

  OrderCubit(this._repository) : super(const OrderState.initial());

  Future<void> loadOrders() async {
    emit(const OrderState.loading());
    try {
      final orders = await _repository.getAllOrders();
      emit(OrderState.loaded(orders: orders));
    } catch (e) {
      emit(OrderState.error('Failed to load orders: ${e.toString()}'));
    }
  }

  Future<void> loadTodayOrders() async {
    emit(const OrderState.loading());
    try {
      final orders = await _repository.getTodayOrders();
      emit(OrderState.loaded(orders: orders));
    } catch (e) {
      emit(OrderState.error('Failed to load today\'s orders: ${e.toString()}'));
    }
  }

  Future<void> loadOrdersByStatus(OrderStatus status) async {
    emit(const OrderState.loading());
    try {
      final orders = await _repository.getOrdersByStatus(status);
      emit(OrderState.loaded(orders: orders));
    } catch (e) {
      emit(
        OrderState.error('Failed to load orders by status: ${e.toString()}'),
      );
    }
  }

  Future<void> createOrder(OrderModel order) async {
    try {
      final createdOrder = await _repository.createOrder(order);
      emit(OrderState.orderCreated(order: createdOrder));
    } catch (e) {
      emit(OrderState.error('Failed to create order: ${e.toString()}'));
    }
  }

  Future<void> updateOrder(OrderModel order) async {
    try {
      final updatedOrder = await _repository.updateOrder(order);
      emit(OrderState.orderUpdated(order: updatedOrder));
    } catch (e) {
      emit(OrderState.error('Failed to update order: ${e.toString()}'));
    }
  }

  Future<void> updateOrderStatus(String orderId, OrderStatus newStatus) async {
    try {
      final updatedOrder = await _repository.updateOrderStatus(
        orderId,
        newStatus,
      );
      emit(OrderState.orderUpdated(order: updatedOrder));
    } catch (e) {
      emit(OrderState.error('Failed to update order status: ${e.toString()}'));
    }
  }

  Future<void> deleteOrder(String orderId) async {
    try {
      await _repository.deleteOrder(orderId);
      // Reload orders after deletion
      await loadOrders();
    } catch (e) {
      emit(OrderState.error('Failed to delete order: ${e.toString()}'));
    }
  }
}
