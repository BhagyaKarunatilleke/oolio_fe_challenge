// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conflict_resolution_strategy.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConflictResolutionStrategyAdapter
    extends TypeAdapter<ConflictResolutionStrategy> {
  @override
  final int typeId = 12;

  @override
  ConflictResolutionStrategy read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ConflictResolutionStrategy.lastWriteWins;
      case 1:
        return ConflictResolutionStrategy.firstWriteWins;
      case 2:
        return ConflictResolutionStrategy.merge;
      case 3:
        return ConflictResolutionStrategy.manual;
      case 4:
        return ConflictResolutionStrategy.skip;
      default:
        return ConflictResolutionStrategy.lastWriteWins;
    }
  }

  @override
  void write(BinaryWriter writer, ConflictResolutionStrategy obj) {
    switch (obj) {
      case ConflictResolutionStrategy.lastWriteWins:
        writer.writeByte(0);
        break;
      case ConflictResolutionStrategy.firstWriteWins:
        writer.writeByte(1);
        break;
      case ConflictResolutionStrategy.merge:
        writer.writeByte(2);
        break;
      case ConflictResolutionStrategy.manual:
        writer.writeByte(3);
        break;
      case ConflictResolutionStrategy.skip:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConflictResolutionStrategyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
