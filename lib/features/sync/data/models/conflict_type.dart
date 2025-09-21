import 'package:hive/hive.dart';

part 'conflict_type.g.dart';

@HiveType(typeId: 11)
enum ConflictType {
  @HiveField(0)
  versionMismatch,
  @HiveField(1)
  concurrentModification,
  @HiveField(2)
  dataIntegrity,
  @HiveField(3)
  businessRule,
}
