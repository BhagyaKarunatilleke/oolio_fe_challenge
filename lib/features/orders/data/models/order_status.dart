import 'package:hive/hive.dart';

part 'order_status.g.dart';

@HiveType(typeId: 4)
enum OrderStatus {
  @HiveField(0)
  pending,
  @HiveField(1)
  preparing,
  @HiveField(2)
  ready,
  @HiveField(3)
  completed,
  @HiveField(4)
  cancelled,
}
