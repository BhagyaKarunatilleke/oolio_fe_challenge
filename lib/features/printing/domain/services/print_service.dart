import 'package:injectable/injectable.dart';
import '../models/print_destination.dart';
import '../models/print_job_priority.dart';
import '../models/print_job.dart';
import '../repositories/print_queue_repository.dart';
import '../../../orders/domain/models/order_model.dart';

@singleton
class PrintService {
  final PrintQueueRepository _repository;

  PrintService(this._repository);

  /// Create print job for order completion
  Future<void> printOrderReceipt({
    required OrderModel order,
    PrintDestination destination = const PrintDestination.file(),
    PrintJobPriority priority = const PrintJobPriority.normal(),
  }) async {
    try {
      // Convert order to receipt data format
      final receiptData = _createReceiptDataFromOrder(order);

      // Create print job
      final job = PrintJobExtension.fromOrderData(
        orderData: receiptData,
        destination: destination,
        priority: priority,
      );

      // Add to queue
      await _repository.addJob(job);
    } catch (e) {
      throw PrintServiceException('Failed to create print job: $e');
    }
  }

  /// Create print job for kitchen receipt (if needed)
  Future<void> printKitchenReceipt({
    required OrderModel order,
    PrintDestination destination = const PrintDestination.file(),
    PrintJobPriority priority = const PrintJobPriority.high(),
  }) async {
    try {
      // Create kitchen-specific receipt data
      final receiptData = _createKitchenReceiptDataFromOrder(order);

      final job = PrintJobExtension.fromOrderData(
        orderData: receiptData,
        destination: destination,
        priority: priority,
      );

      await _repository.addJob(job);
    } catch (e) {
      throw PrintServiceException('Failed to create kitchen print job: $e');
    }
  }

  /// Create receipt data from order model
  Map<String, dynamic> _createReceiptDataFromOrder(OrderModel order) {
    return {
      'header': {
        'restaurantName': 'Food Truck POS',
        'address': '123 Main Street',
        'phone': '(555) 123-4567',
      },
      'order': {
        'orderNumber': order.orderNumber,
        'date': _formatDate(order.createdAt),
        'time': _formatTime(order.createdAt),
        'customerName': order.customerName,
        'customerPhone': order.customerPhone,
      },
      'items': order.items
          .map(
            (item) => {
              'name': item.productName,
              'quantity': item.quantity,
              'price': item.unitPrice * item.quantity,
              'variants': item.selectedVariants.join(', '),
              'addons': item.selectedAddons.join(', '),
              'specialInstructions': item.specialInstructions,
            },
          )
          .toList(),
      'totals': {
        'subtotal': order.subtotal,
        'tax': order.tax,
        'total': order.total,
      },
      'payment': {
        'method': order.paymentMethod.toString().split('.').last.toUpperCase(),
        'amount': order.total,
        'change': 0.0, // TODO: Calculate change based on payment method
      },
    };
  }

  /// Create kitchen receipt data from order model
  Map<String, dynamic> _createKitchenReceiptDataFromOrder(OrderModel order) {
    return {
      'header': {
        'restaurantName': 'KITCHEN ORDER',
        'address': 'Food Truck POS',
      },
      'order': {
        'orderNumber': order.orderNumber,
        'date': _formatDate(order.createdAt),
        'time': _formatTime(order.createdAt),
        'status': order.status.toString().split('.').last.toUpperCase(),
      },
      'items': order.items
          .map(
            (item) => {
              'name': item.productName,
              'quantity': item.quantity,
              'variants': item.selectedVariants.join(', '),
              'addons': item.selectedAddons.join(', '),
              'specialInstructions': item.specialInstructions,
            },
          )
          .toList(),
      'customer': {
        'name': order.customerName ?? 'Walk-in Customer',
        'phone': order.customerPhone,
      },
    };
  }

  String _formatDate(DateTime dateTime) {
    return '${dateTime.month}/${dateTime.day}/${dateTime.year}';
  }

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = dateTime.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }
}

class PrintServiceException implements Exception {
  final String message;
  PrintServiceException(this.message);

  @override
  String toString() => 'PrintServiceException: $message';
}
