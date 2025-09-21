import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../shared/models/sync_status.dart';

part 'order_item_model.g.dart';
part 'order_item_model.freezed.dart';

@freezed
@HiveType(typeId: 7)
class OrderItemModel with _$OrderItemModel {
  const factory OrderItemModel({
    @HiveField(0) required String id,
    @HiveField(1) required DateTime createdAt,
    @HiveField(2) required DateTime updatedAt,
    @HiveField(3) @Default(1) int version,
    @HiveField(4) @Default(SyncStatus.pending) SyncStatus syncStatus,
    @HiveField(5) Map<String, dynamic>? metadata,
    @HiveField(6) required String productId,
    @HiveField(7) required String productName,
    @HiveField(8) required int quantity,
    @HiveField(9) required double unitPrice,
    @HiveField(10) @Default([]) List<String> selectedVariants,
    @HiveField(11) @Default([]) List<String> selectedAddons,
    @HiveField(12) String? specialInstructions,
  }) = _OrderItemModel;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => _$OrderItemModelFromJson(json);

  factory OrderItemModel.create({
    String? id,
    required String productId,
    required String productName,
    required int quantity,
    required double unitPrice,
    List<String> selectedVariants = const [],
    List<String> selectedAddons = const [],
    String? specialInstructions,
    Map<String, dynamic>? metadata,
  }) {
    final now = DateTime.now();
    return OrderItemModel(
      id: id ?? const Uuid().v4(),
      createdAt: now,
      updatedAt: now,
      productId: productId,
      productName: productName,
      quantity: quantity,
      unitPrice: unitPrice,
      selectedVariants: selectedVariants,
      selectedAddons: selectedAddons,
      specialInstructions: specialInstructions,
      metadata: metadata,
    );
  }
}

// Extension methods for OrderItemModel operations
extension OrderItemModelExtension on OrderItemModel {
  double get totalPrice => quantity * unitPrice;

  OrderItemModel updateQuantity(int newQuantity) {
    return copyWith(
      quantity: newQuantity,
    ).updateVersion().markAsPending();
  }

  OrderItemModel updateVersion() {
    return copyWith(
      version: version + 1,
      updatedAt: DateTime.now(),
    );
  }

  OrderItemModel markAsPending() {
    return copyWith(
      syncStatus: SyncStatus.pending,
    ).updateVersion();
  }
}
