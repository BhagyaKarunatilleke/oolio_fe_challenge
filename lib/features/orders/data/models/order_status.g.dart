// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderStatusAdapter extends TypeAdapter<OrderStatus> {
  @override
  final int typeId = 4;

  @override
  OrderStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return OrderStatus.pending;
      case 1:
        return OrderStatus.preparing;
      case 2:
        return OrderStatus.ready;
      case 3:
        return OrderStatus.completed;
      case 4:
        return OrderStatus.cancelled;
      default:
        return OrderStatus.pending;
    }
  }

  @override
  void write(BinaryWriter writer, OrderStatus obj) {
    switch (obj) {
      case OrderStatus.pending:
        writer.writeByte(0);
        break;
      case OrderStatus.preparing:
        writer.writeByte(1);
        break;
      case OrderStatus.ready:
        writer.writeByte(2);
        break;
      case OrderStatus.completed:
        writer.writeByte(3);
        break;
      case OrderStatus.cancelled:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
