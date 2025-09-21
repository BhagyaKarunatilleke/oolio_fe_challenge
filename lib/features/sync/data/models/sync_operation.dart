import 'package:hive/hive.dart';

part 'sync_operation.g.dart';

@HiveType(typeId: 9)
enum SyncOperation {
  @HiveField(0)
  create,
  @HiveField(1)
  update,
  @HiveField(2)
  delete,
}
