import 'package:hive/hive.dart';

part 'payment_method.g.dart';

@HiveType(typeId: 5)
enum PaymentMethod {
  @HiveField(0)
  cash,
  @HiveField(1)
  card,
  @HiveField(2)
  digital,
}
