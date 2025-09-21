import 'package:flutter/material.dart';
import '../cubit/order_tracking_state.dart';

class OrderFilterWidget extends StatefulWidget {
  final Function(OrderTrackingFilter) onFilterChanged;

  const OrderFilterWidget({super.key, required this.onFilterChanged});

  @override
  State<OrderFilterWidget> createState() => _OrderFilterWidgetState();
}

class _OrderFilterWidgetState extends State<OrderFilterWidget> {
  OrderTrackingFilter _selectedFilter = OrderTrackingFilter.all;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: OrderTrackingFilter.values.map((filter) {
          final isSelected = _selectedFilter == filter;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              label: Text(_getFilterLabel(filter)),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  _selectedFilter = filter;
                });
                widget.onFilterChanged(filter);
              },
              backgroundColor: Colors.grey[100],
              selectedColor: Theme.of(
                context,
              ).colorScheme.primary.withOpacity(0.2),
              checkmarkColor: Theme.of(context).colorScheme.primary,
              labelStyle: TextStyle(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey[700],
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _getFilterLabel(OrderTrackingFilter filter) {
    switch (filter) {
      case OrderTrackingFilter.all:
        return 'All Orders';
      case OrderTrackingFilter.pending:
        return 'Pending';
      case OrderTrackingFilter.preparing:
        return 'Preparing';
      case OrderTrackingFilter.ready:
        return 'Ready';
      case OrderTrackingFilter.completed:
        return 'Completed';
      case OrderTrackingFilter.cancelled:
        return 'Cancelled';
    }
  }
}
