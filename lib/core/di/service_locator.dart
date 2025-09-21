import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../storage/local_storage_service.dart';
import '../storage/sync_queue_manager.dart';
import 'service_locator.config.dart';

final GetIt sl = GetIt.instance;

@InjectableInit()
Future<void> initializeDependencies() async {
  // Configure get_it with injectable
  sl.init();

  // Initialize services in correct order
  await sl<LocalStorageService>().initialize();
  await sl<SyncQueueManager>().initialize();
}

// Helper methods for easier access
T get<T extends Object>() => sl.get<T>();
T getWithParam<T extends Object, P extends Object>(P param) =>
    sl.get<T>(param1: param);
