import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../storage/local_storage_service.dart';
import '../storage/sync_queue_manager.dart';
import '../services/connectivity_service.dart';
import '../../features/printing/data/repositories/print_queue_repository_impl.dart';
import '../../features/printing/domain/repositories/print_queue_repository.dart';
import 'service_locator.config.dart';

final GetIt sl = GetIt.instance;

@InjectableInit()
Future<void> initializeDependencies() async {
  // Register SharedPreferences manually BEFORE sl.init()
  final prefs = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(prefs);

  // Configure get_it with injectable
  sl.init();

  // Initialize services in correct order
  await sl<LocalStorageService>().initialize();
  await sl<ConnectivityService>().initialize();
  await sl<SyncQueueManager>().initialize();

  // Initialize print queue repository
  await (sl<PrintQueueRepository>() as PrintQueueRepositoryImpl).init();
}

// Helper methods for easier access
T get<T extends Object>() => sl.get<T>();
T getWithParam<T extends Object, P extends Object>(P param) =>
    sl.get<T>(param1: param);
