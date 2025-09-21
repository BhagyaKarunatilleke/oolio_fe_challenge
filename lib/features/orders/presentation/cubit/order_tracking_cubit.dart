import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/order_repository.dart';
import '../../domain/models/order_model.dart';
import '../../domain/models/order_status.dart';
import 'order_tracking_state.dart';

@injectable
class OrderTrackingCubit extends Cubit<OrderTrackingState> {
  final OrderRepository _repository;

  OrderTrackingCubit(this._repository)
    : super(const OrderTrackingState.initial());

  Future<void> loadOrders() async {
    emit(const OrderTrackingState.loading());
    try {
      final allOrders = await _repository.getAllOrders();

      // Separate active and completed orders
      final activeOrders = allOrders
          .where(
            (order) =>
                order.status != OrderStatus.completed &&
                order.status != OrderStatus.cancelled,
          )
          .toList();

      final completedOrders = allOrders
          .where(
            (order) =>
                order.status == OrderStatus.completed ||
                order.status == OrderStatus.cancelled,
          )
          .toList();

      // Sort active orders by creation date (newest first)
      activeOrders.sort((a, b) => b.createdAt.compareTo(a.createdAt));

      // Sort completed orders by creation date (newest first)
      completedOrders.sort((a, b) => b.createdAt.compareTo(a.createdAt));

      emit(
        OrderTrackingState.loaded(
          activeOrders: activeOrders,
          completedOrders: completedOrders,
        ),
      );
    } catch (e) {
      emit(OrderTrackingState.error('Failed to load orders: ${e.toString()}'));
    }
  }

  Future<void> updateOrderStatus(String orderId, OrderStatus newStatus) async {
    try {
      // Update the order status in the repository
      final updatedOrder = await _repository.updateOrderStatus(
        orderId,
        newStatus,
      );

      // Update the state immediately without reloading all orders
      state.maybeWhen(
        loaded: (activeOrders, completedOrders, currentFilter, searchQuery) {
          // Create new lists with the updated order
          final newActiveOrders = activeOrders.map((order) {
            return order.id == orderId ? updatedOrder : order;
          }).toList();

          final newCompletedOrders = completedOrders.map((order) {
            return order.id == orderId ? updatedOrder : order;
          }).toList();

          // Re-categorize the updated order if its status changed significantly
          final updatedActiveOrders = <OrderModel>[];
          final updatedCompletedOrders = <OrderModel>[];

          // Add all orders to their appropriate lists
          for (final order in newActiveOrders) {
            if (order.id == orderId) {
              // This is the updated order - categorize based on new status
              if (updatedOrder.status == OrderStatus.completed ||
                  updatedOrder.status == OrderStatus.cancelled) {
                updatedCompletedOrders.add(updatedOrder);
              } else {
                updatedActiveOrders.add(updatedOrder);
              }
            } else {
              // Keep existing categorization
              if (order.status == OrderStatus.completed ||
                  order.status == OrderStatus.cancelled) {
                updatedCompletedOrders.add(order);
              } else {
                updatedActiveOrders.add(order);
              }
            }
          }

          // Add remaining completed orders
          for (final order in newCompletedOrders) {
            if (order.id != orderId) {
              // Don't add the updated order twice
              updatedCompletedOrders.add(order);
            }
          }

          // Sort the lists
          updatedActiveOrders.sort(
            (a, b) => b.createdAt.compareTo(a.createdAt),
          );
          updatedCompletedOrders.sort(
            (a, b) => b.createdAt.compareTo(a.createdAt),
          );

          emit(
            OrderTrackingState.loaded(
              activeOrders: updatedActiveOrders,
              completedOrders: updatedCompletedOrders,
              currentFilter: currentFilter,
              searchQuery: searchQuery,
            ),
          );
        },
        orElse: () {
          // If not in loaded state, just reload all orders
          loadOrders();
        },
      );
    } catch (e) {
      emit(
        OrderTrackingState.error(
          'Failed to update order status: ${e.toString()}',
        ),
      );
    }
  }

  void setFilter(OrderTrackingFilter filter) {
    state.maybeWhen(
      loaded: (activeOrders, completedOrders, _, searchQuery) {
        emit(
          OrderTrackingState.loaded(
            activeOrders: activeOrders,
            completedOrders: completedOrders,
            currentFilter: filter,
            searchQuery: searchQuery,
          ),
        );
      },
      orElse: () {},
    );
  }

  void setSearchQuery(String query) {
    state.maybeWhen(
      loaded: (activeOrders, completedOrders, currentFilter, _) {
        emit(
          OrderTrackingState.loaded(
            activeOrders: activeOrders,
            completedOrders: completedOrders,
            currentFilter: currentFilter,
            searchQuery: query,
          ),
        );
      },
      orElse: () {},
    );
  }

  List<OrderModel> getFilteredOrders() {
    return state.maybeWhen(
      loaded: (activeOrders, completedOrders, currentFilter, searchQuery) {
        List<OrderModel> ordersToFilter = [];

        // Determine which orders to filter based on current filter
        switch (currentFilter) {
          case OrderTrackingFilter.all:
            ordersToFilter = [...activeOrders, ...completedOrders];
            break;
          case OrderTrackingFilter.completed:
            ordersToFilter = completedOrders;
            break;
          case OrderTrackingFilter.cancelled:
            ordersToFilter = completedOrders
                .where((o) => o.status == OrderStatus.cancelled)
                .toList();
            break;
          default:
            // For status-specific filters, only show active orders
            final targetStatus = _getOrderStatusFromFilter(currentFilter);
            ordersToFilter = activeOrders
                .where((o) => o.status == targetStatus)
                .toList();
        }

        // Apply search filter if query is provided
        if (searchQuery.isNotEmpty) {
          ordersToFilter = ordersToFilter.where((order) {
            final query = searchQuery.toLowerCase();
            return order.orderNumber.toLowerCase().contains(query) ||
                (order.customerName?.toLowerCase().contains(query) ?? false) ||
                (order.customerPhone?.contains(query) ?? false);
          }).toList();
        }

        return ordersToFilter;
      },
      orElse: () => [],
    );
  }

  OrderStatus? _getOrderStatusFromFilter(OrderTrackingFilter filter) {
    switch (filter) {
      case OrderTrackingFilter.pending:
        return OrderStatus.pending;
      case OrderTrackingFilter.preparing:
        return OrderStatus.preparing;
      case OrderTrackingFilter.ready:
        return OrderStatus.ready;
      default:
        return null;
    }
  }
}
