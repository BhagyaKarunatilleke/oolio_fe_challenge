import 'package:hive/hive.dart';

part 'sync_status.g.dart';

@HiveType(typeId: 0)
enum SyncStatus {
  @HiveField(0)
  pending, // Queued for sync
  @HiveField(1)
  syncing, // Currently syncing
  @HiveField(2)
  synced, // Successfully synced
  @HiveField(3)
  failed, // Sync failed
  @HiveField(4)
  conflicted, // Has conflicts
}
