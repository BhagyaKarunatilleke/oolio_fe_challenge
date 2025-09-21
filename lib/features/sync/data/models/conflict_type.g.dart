// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conflict_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConflictTypeAdapter extends TypeAdapter<ConflictType> {
  @override
  final int typeId = 11;

  @override
  ConflictType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ConflictType.versionMismatch;
      case 1:
        return ConflictType.concurrentModification;
      case 2:
        return ConflictType.dataIntegrity;
      case 3:
        return ConflictType.businessRule;
      default:
        return ConflictType.versionMismatch;
    }
  }

  @override
  void write(BinaryWriter writer, ConflictType obj) {
    switch (obj) {
      case ConflictType.versionMismatch:
        writer.writeByte(0);
        break;
      case ConflictType.concurrentModification:
        writer.writeByte(1);
        break;
      case ConflictType.dataIntegrity:
        writer.writeByte(2);
        break;
      case ConflictType.businessRule:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConflictTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
