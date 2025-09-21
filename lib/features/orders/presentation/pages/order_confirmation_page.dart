import 'package:flutter/material.dart';
import '../../domain/models/order_model.dart';
import '../widgets/order_confirmation_widget.dart';

class OrderConfirmationPage extends StatelessWidget {
  final OrderModel order;

  const OrderConfirmationPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Confirmation'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        automaticallyImplyLeading: false, // Remove back button
      ),
      body: SingleChildScrollView(child: OrderConfirmationWidget(order: order)),
    );
  }
}
