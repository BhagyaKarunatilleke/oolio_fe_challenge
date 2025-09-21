import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/models/order_model.dart';

part 'order_tracking_state.freezed.dart';

@freezed
class OrderTrackingState with _$OrderTrackingState {
  const factory OrderTrackingState.initial() = OrderTrackingInitial;
  const factory OrderTrackingState.loading() = OrderTrackingLoading;
  const factory OrderTrackingState.loaded({
    required List<OrderModel> activeOrders,
    required List<OrderModel> completedOrders,
    @Default(OrderTrackingFilter.all) OrderTrackingFilter currentFilter,
    @Default('') String searchQuery,
  }) = OrderTrackingLoaded;
  const factory OrderTrackingState.error(String message) = OrderTrackingError;
}

enum OrderTrackingFilter {
  all,
  pending,
  preparing,
  ready,
  completed,
  cancelled,
}
