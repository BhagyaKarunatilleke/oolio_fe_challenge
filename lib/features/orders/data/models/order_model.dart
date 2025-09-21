import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../shared/models/sync_status.dart';
import 'order_status.dart';
import 'payment_method.dart';
import 'payment_status.dart';
import 'order_item_model.dart';

part 'order_model.g.dart';
part 'order_model.freezed.dart';

@freezed
@HiveType(typeId: 8)
class OrderModel with _$OrderModel {
  const factory OrderModel({
    @HiveField(0) required String id,
    @HiveField(1) required DateTime createdAt,
    @HiveField(2) required DateTime updatedAt,
    @HiveField(3) @Default(1) int version,
    @HiveField(4) @Default(SyncStatus.pending) SyncStatus syncStatus,
    @HiveField(5) Map<String, dynamic>? metadata,
    @HiveField(6) required String orderNumber,
    @HiveField(7) required OrderStatus status,
    @HiveField(8) @Default([]) List<OrderItemModel> items,
    @HiveField(9) @Default(PaymentMethod.cash) PaymentMethod paymentMethod,
    @HiveField(10) @Default(PaymentStatus.pending) PaymentStatus paymentStatus,
    @HiveField(11) String? customerName,
    @HiveField(12) String? customerPhone,
    @HiveField(13) String? specialInstructions,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  factory OrderModel.create({
    String? id,
    String? orderNumber,
    required OrderStatus status,
    List<OrderItemModel> items = const [],
    PaymentMethod paymentMethod = PaymentMethod.cash,
    PaymentStatus paymentStatus = PaymentStatus.pending,
    String? customerName,
    String? customerPhone,
    String? specialInstructions,
    Map<String, dynamic>? metadata,
  }) {
    final now = DateTime.now();
    return OrderModel(
      id: id ?? const Uuid().v4(),
      createdAt: now,
      updatedAt: now,
      orderNumber: orderNumber ?? _generateOrderNumber(),
      status: status,
      items: items,
      paymentMethod: paymentMethod,
      paymentStatus: paymentStatus,
      customerName: customerName,
      customerPhone: customerPhone,
      specialInstructions: specialInstructions,
      metadata: metadata,
    );
  }

  static String _generateOrderNumber() {
    final now = DateTime.now();
    return 'ORD-${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}-${now.millisecondsSinceEpoch.toString().substring(8)}';
  }
}

// Extension methods for OrderModel operations
extension OrderModelExtension on OrderModel {
  double get subtotal => items.fold(0.0, (sum, item) => sum + item.totalPrice);

  double get tax => subtotal * 0.1; // 10% tax

  double get total => subtotal + tax;

  OrderModel addItem(OrderItemModel item) {
    final newItems = [...items, item];
    return copyWith(items: newItems).updateVersion().markAsPending();
  }

  OrderModel removeItem(String itemId) {
    final newItems = items.where((item) => item.id != itemId).toList();
    return copyWith(items: newItems).updateVersion().markAsPending();
  }

  OrderModel updateItemQuantity(String itemId, int newQuantity) {
    final newItems = items.map((item) {
      if (item.id == itemId) {
        return item.updateQuantity(newQuantity);
      }
      return item;
    }).toList();
    return copyWith(items: newItems).updateVersion().markAsPending();
  }

  OrderModel updateStatus(OrderStatus newStatus) {
    return copyWith(status: newStatus).updateVersion().markAsPending();
  }

  OrderModel updatePaymentStatus(PaymentStatus newStatus) {
    return copyWith(paymentStatus: newStatus).updateVersion().markAsPending();
  }

  OrderModel updateVersion() {
    return copyWith(version: version + 1, updatedAt: DateTime.now());
  }

  OrderModel markAsPending() {
    return copyWith(syncStatus: SyncStatus.pending).updateVersion();
  }
}
