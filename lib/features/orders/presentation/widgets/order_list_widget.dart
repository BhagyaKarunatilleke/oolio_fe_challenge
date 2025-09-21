import 'package:flutter/material.dart';
import '../../domain/models/order_model.dart';
import 'order_card_widget.dart';

class OrderListWidget extends StatelessWidget {
  final List<OrderModel> orders;
  final bool isActiveOrders;

  const OrderListWidget({
    super.key,
    required this.orders,
    required this.isActiveOrders,
  });

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      return const Center(child: Text('No orders found'));
    }

    return RefreshIndicator(
      onRefresh: () async {
        // This will be handled by the parent widget
        // The refresh is triggered by the floating action button
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: OrderCardWidget(order: order, isActiveOrder: isActiveOrders),
          );
        },
      ),
    );
  }
}
