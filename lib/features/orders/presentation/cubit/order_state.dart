import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/models/order_model.dart';

part 'order_state.freezed.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.initial() = OrderInitial;
  const factory OrderState.loading() = OrderLoading;
  const factory OrderState.loaded({required List<OrderModel> orders}) =
      OrderLoaded;
  const factory OrderState.orderCreated({required OrderModel order}) =
      OrderCreated;
  const factory OrderState.orderUpdated({required OrderModel order}) =
      OrderUpdated;
  const factory OrderState.error(String message) = OrderError;
}

// Checkout specific states
@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState.initial() = CheckoutInitial;
  const factory CheckoutState.loading() = CheckoutLoading;
  const factory CheckoutState.customerDetails({
    required String customerName,
    required String customerPhone,
    String? specialInstructions,
  }) = CheckoutCustomerDetails;
  const factory CheckoutState.paymentSelection({
    required String customerName,
    required String customerPhone,
    String? specialInstructions,
  }) = CheckoutPaymentSelection;
  const factory CheckoutState.processing() = CheckoutProcessing;
  const factory CheckoutState.completed({required OrderModel order}) =
      CheckoutCompleted;
  const factory CheckoutState.error(String message) = CheckoutError;
}
