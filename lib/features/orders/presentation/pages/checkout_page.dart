import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../cubit/checkout_cubit.dart';
import '../cubit/order_state.dart';
import '../widgets/customer_details_form.dart';
import '../widgets/payment_selection_widget.dart';
import '../widgets/order_confirmation_widget.dart';
import '../../../../core/navigation/app_router.dart';
import '../../../../core/di/service_locator.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<CheckoutCubit>()..startCheckout(),
      child: const CheckoutView(),
    );
  }
}

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<CheckoutCubit, CheckoutState>(
          listener: (context, state) {
            state.whenOrNull(
              completed: (order) {
                // Navigate to order confirmation page
                context.go(AppRoutes.orderConfirmation, extra: order);
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message), backgroundColor: Colors.red),
                );
              },
            );
          },
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              customerDetails:
                  (customerName, customerPhone, specialInstructions) =>
                      CustomerDetailsForm(
                        initialName: customerName,
                        initialPhone: customerPhone,
                        initialInstructions: specialInstructions,
                        onProceed: (name, phone, instructions) {
                          context.read<CheckoutCubit>().updateCustomerDetails(
                            customerName: name,
                            customerPhone: phone,
                            specialInstructions: instructions,
                          );
                          context
                              .read<CheckoutCubit>()
                              .proceedToPaymentSelection();
                        },
                      ),
              paymentSelection:
                  (customerName, customerPhone, specialInstructions) =>
                      PaymentSelectionWidget(
                        customerName: customerName,
                        customerPhone: customerPhone,
                        specialInstructions: specialInstructions,
                        onProcessOrder: () {
                          context.read<CheckoutCubit>().processOrder();
                        },
                        onBack: () {
                          context.read<CheckoutCubit>().updateCustomerDetails(
                            customerName: customerName,
                            customerPhone: customerPhone,
                            specialInstructions: specialInstructions,
                          );
                        },
                      ),
              processing: () => const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Processing your order...'),
                  ],
                ),
              ),
              completed: (order) => OrderConfirmationWidget(order: order),
              error: (message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
                    const SizedBox(height: 16),
                    Text(
                      'Error',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      message,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<CheckoutCubit>().startCheckout(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
