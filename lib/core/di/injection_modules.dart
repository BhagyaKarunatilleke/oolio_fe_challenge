import 'package:injectable/injectable.dart';
import '../storage/storage_service.dart';
import '../storage/local_storage_service.dart';

@module
abstract class StorageModule {
  @singleton
  @Injectable(as: StorageService)
  StorageService get storageService => LocalStorageService();
}
