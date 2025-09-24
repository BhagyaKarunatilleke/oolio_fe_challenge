import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/order_repository.dart';
import '../../../cart/domain/repositories/cart_repository.dart';
import '../../../cart/domain/models/cart_model.dart';
import '../../../printing/domain/services/print_service.dart';
import '../../../../core/di/service_locator.dart';
import 'order_state.dart';

@injectable
class CheckoutCubit extends Cubit<CheckoutState> {
  final OrderRepository _orderRepository;
  final CartRepository _cartRepository;
  final PrintService _printService;

  // Constructor now fetches its own dependencies using get_it
  CheckoutCubit()
    : _orderRepository = get<OrderRepository>(),
      _cartRepository = get<CartRepository>(),
      _printService = get<PrintService>(),
      super(const CheckoutState.initial());

  Future<void> startCheckout() async {
    emit(const CheckoutState.loading());
    try {
      final cart = await _cartRepository.getCurrentCart();
      if (cart.isEmpty) {
        emit(const CheckoutState.error('Cart is empty'));
        return;
      }
      // Start with customer details collection
      emit(
        const CheckoutState.customerDetails(
          customerName: '',
          customerPhone: '',
        ),
      );
    } catch (e) {
      emit(CheckoutState.error('Failed to start checkout: ${e.toString()}'));
    }
  }

  void updateCustomerDetails({
    required String customerName,
    required String customerPhone,
    String? specialInstructions,
  }) {
    emit(
      CheckoutState.customerDetails(
        customerName: customerName,
        customerPhone: customerPhone,
        specialInstructions: specialInstructions,
      ),
    );
  }

  void proceedToPaymentSelection() {
    state.maybeWhen(
      customerDetails: (customerName, customerPhone, specialInstructions) {
        if (customerName.trim().isEmpty || customerPhone.trim().isEmpty) {
          emit(
            const CheckoutState.error('Customer name and phone are required'),
          );
          return;
        }
        emit(
          CheckoutState.paymentSelection(
            customerName: customerName,
            customerPhone: customerPhone,
            specialInstructions: specialInstructions,
          ),
        );
      },
      orElse: () => emit(
        const CheckoutState.error('Invalid state for payment selection'),
      ),
    );
  }

  Future<void> processOrder() async {
    state.maybeWhen(
      paymentSelection:
          (customerName, customerPhone, specialInstructions) async {
            emit(const CheckoutState.processing());
            try {
              // Get current cart
              final cart = await _cartRepository.getCurrentCart();

              // Create order from cart
              final order = await _orderRepository.createOrderFromCart(
                cart.id,
                customerName,
                customerPhone,
                specialInstructions,
              );

              // Clear the cart after successful order creation
              await _cartRepository.clearCart();

              // Create print job for the order
              try {
                await _printService.printOrderReceipt(order: order);
                // Optionally create kitchen receipt
                await _printService.printKitchenReceipt(order: order);
              } catch (e) {
                // Log print error but don't fail the order
                print('Failed to create print job: $e');
              }

              emit(CheckoutState.completed(order: order));
            } catch (e) {
              emit(
                CheckoutState.error('Failed to process order: ${e.toString()}'),
              );
            }
          },
      orElse: () =>
          emit(const CheckoutState.error('Invalid state for order processing')),
    );
  }

  void resetCheckout() {
    emit(const CheckoutState.initial());
  }
}
