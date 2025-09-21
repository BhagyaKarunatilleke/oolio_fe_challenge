// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderModelAdapter extends TypeAdapter<OrderModel> {
  @override
  final int typeId = 8;

  @override
  OrderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderModel(
      id: fields[0] as String,
      createdAt: fields[1] as DateTime,
      updatedAt: fields[2] as DateTime,
      version: fields[3] as int,
      syncStatus: fields[4] as SyncStatus,
      metadata: (fields[5] as Map?)?.cast<String, dynamic>(),
      orderNumber: fields[6] as String,
      status: fields[7] as OrderStatus,
      items: (fields[8] as List).cast<OrderItemModel>(),
      paymentMethod: fields[9] as PaymentMethod,
      paymentStatus: fields[10] as PaymentStatus,
      customerName: fields[11] as String?,
      customerPhone: fields[12] as String?,
      specialInstructions: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OrderModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.updatedAt)
      ..writeByte(3)
      ..write(obj.version)
      ..writeByte(4)
      ..write(obj.syncStatus)
      ..writeByte(5)
      ..write(obj.metadata)
      ..writeByte(6)
      ..write(obj.orderNumber)
      ..writeByte(7)
      ..write(obj.status)
      ..writeByte(8)
      ..write(obj.items)
      ..writeByte(9)
      ..write(obj.paymentMethod)
      ..writeByte(10)
      ..write(obj.paymentStatus)
      ..writeByte(11)
      ..write(obj.customerName)
      ..writeByte(12)
      ..write(obj.customerPhone)
      ..writeByte(13)
      ..write(obj.specialInstructions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      syncStatus:
          $enumDecodeNullable(_$SyncStatusEnumMap, json['syncStatus']) ??
              SyncStatus.pending,
      metadata: json['metadata'] as Map<String, dynamic>?,
      orderNumber: json['orderNumber'] as String,
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      paymentMethod:
          $enumDecodeNullable(_$PaymentMethodEnumMap, json['paymentMethod']) ??
              PaymentMethod.cash,
      paymentStatus:
          $enumDecodeNullable(_$PaymentStatusEnumMap, json['paymentStatus']) ??
              PaymentStatus.pending,
      customerName: json['customerName'] as String?,
      customerPhone: json['customerPhone'] as String?,
      specialInstructions: json['specialInstructions'] as String?,
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'version': instance.version,
      'syncStatus': _$SyncStatusEnumMap[instance.syncStatus]!,
      'metadata': instance.metadata,
      'orderNumber': instance.orderNumber,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'items': instance.items,
      'paymentMethod': _$PaymentMethodEnumMap[instance.paymentMethod]!,
      'paymentStatus': _$PaymentStatusEnumMap[instance.paymentStatus]!,
      'customerName': instance.customerName,
      'customerPhone': instance.customerPhone,
      'specialInstructions': instance.specialInstructions,
    };

const _$SyncStatusEnumMap = {
  SyncStatus.pending: 'pending',
  SyncStatus.syncing: 'syncing',
  SyncStatus.synced: 'synced',
  SyncStatus.failed: 'failed',
  SyncStatus.conflicted: 'conflicted',
};

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'pending',
  OrderStatus.preparing: 'preparing',
  OrderStatus.ready: 'ready',
  OrderStatus.completed: 'completed',
  OrderStatus.cancelled: 'cancelled',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.cash: 'cash',
  PaymentMethod.card: 'card',
  PaymentMethod.digital: 'digital',
};

const _$PaymentStatusEnumMap = {
  PaymentStatus.pending: 'pending',
  PaymentStatus.processing: 'processing',
  PaymentStatus.completed: 'completed',
  PaymentStatus.failed: 'failed',
  PaymentStatus.refunded: 'refunded',
};
