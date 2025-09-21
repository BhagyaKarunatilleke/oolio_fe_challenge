import 'package:hive/hive.dart';

part 'conflict_resolution_strategy.g.dart';

@HiveType(typeId: 12)
enum ConflictResolutionStrategy {
  @HiveField(0)
  lastWriteWins,
  @HiveField(1)
  firstWriteWins,
  @HiveField(2)
  merge,
  @HiveField(3)
  manual,
  @HiveField(4)
  skip,
}
