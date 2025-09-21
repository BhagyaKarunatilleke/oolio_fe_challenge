import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';
import '../constants/storage_keys.dart';
import '../../shared/models/sync_status.dart';
import '../../features/sync/data/models/sync_operation.dart';
import '../../features/products/data/models/product_model.dart';
import '../../features/products/data/models/product_variant.dart';
import '../../features/products/data/models/product_addon.dart';
import '../../features/orders/data/models/order_model.dart';
import '../../features/orders/data/models/order_item_model.dart';
import '../../features/orders/data/models/order_status.dart';
import '../../features/orders/data/models/payment_method.dart';
import '../../features/orders/data/models/payment_status.dart';
import '../../features/sync/data/models/sync_queue_item.dart';
import '../../features/sync/data/models/conflict_resolution.dart';
import '../../features/sync/data/models/conflict_type.dart';
import '../../features/sync/data/models/conflict_resolution_strategy.dart';
import '../../features/cart/data/models/cart_model.dart';
import '../../features/cart/data/models/cart_item_model.dart';
import 'storage_service.dart';

@singleton
class LocalStorageService implements StorageService {
  LocalStorageService();

  late Box<dynamic> _productsBox;
  late Box<dynamic> _ordersBox;
  late Box<dynamic> _syncQueueBox;
  late Box<dynamic> _conflictsBox;
  late Box<dynamic> _syncStatusBox;
  late SharedPreferences _prefs;

  bool _isInitialized = false;

  @override
  Future<void> initialize() async {
    if (_isInitialized) return;

    await Hive.initFlutter();

    // Register adapters
    _registerAdapters();

    // Open boxes
    _productsBox = await Hive.openBox(StorageKeys.productsBox);
    _ordersBox = await Hive.openBox(StorageKeys.ordersBox);
    _syncQueueBox = await Hive.openBox(StorageKeys.syncQueueBox);
    _conflictsBox = await Hive.openBox(StorageKeys.conflictsBox);
    _syncStatusBox = await Hive.openBox(StorageKeys.syncStatusBox);

    // Initialize SharedPreferences
    _prefs = await SharedPreferences.getInstance();

    _isInitialized = true;
  }

  void _registerAdapters() {
    // Register all Hive adapters
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(SyncStatusAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ProductVariantAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(ProductAddonAdapter());
    }
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(ProductModelAdapter());
    }
    if (!Hive.isAdapterRegistered(4)) {
      Hive.registerAdapter(OrderStatusAdapter());
    }
    if (!Hive.isAdapterRegistered(5)) {
      Hive.registerAdapter(PaymentMethodAdapter());
    }
    if (!Hive.isAdapterRegistered(6)) {
      Hive.registerAdapter(PaymentStatusAdapter());
    }
    if (!Hive.isAdapterRegistered(7)) {
      Hive.registerAdapter(OrderItemModelAdapter());
    }
    if (!Hive.isAdapterRegistered(8)) {
      Hive.registerAdapter(OrderModelAdapter());
    }
    if (!Hive.isAdapterRegistered(9)) {
      Hive.registerAdapter(SyncOperationAdapter());
    }
    if (!Hive.isAdapterRegistered(10)) {
      Hive.registerAdapter(SyncQueueItemAdapter());
    }
    if (!Hive.isAdapterRegistered(11)) {
      Hive.registerAdapter(ConflictTypeAdapter());
    }
    if (!Hive.isAdapterRegistered(12)) {
      Hive.registerAdapter(ConflictResolutionStrategyAdapter());
    }
    if (!Hive.isAdapterRegistered(13)) {
      Hive.registerAdapter(ConflictResolutionAdapter());
    }
    if (!Hive.isAdapterRegistered(14)) {
      Hive.registerAdapter(CartItemModelAdapter());
    }
    if (!Hive.isAdapterRegistered(15)) {
      Hive.registerAdapter(CartModelAdapter());
    }
  }

  // Generic CRUD operations
  @override
  Future<void> save<T>(String boxName, T entity) async {
    final box = _getBox(boxName);
    // For entities with id field, use it as key
    final id = (entity as dynamic).id;
    await box.put(id, entity);
  }

  @override
  Future<T?> get<T>(String boxName, String id) async {
    final box = _getBox(boxName);
    return box.get(id) as T?;
  }

  @override
  Future<List<T>> getAll<T>(String boxName) async {
    final box = _getBox(boxName);
    return box.values.cast<T>().toList();
  }

  @override
  Future<void> delete(String boxName, String id) async {
    final box = _getBox(boxName);
    await box.delete(id);
  }

  @override
  Future<void> deleteAll(String boxName) async {
    final box = _getBox(boxName);
    await box.clear();
  }

  // Sync-specific operations for entities with syncStatus
  @override
  Future<List<T>> getPendingSync<T>(String boxName) async {
    final box = _getBox(boxName);
    return box.values
        .cast<T>()
        .where((entity) => (entity as dynamic).syncStatus == SyncStatus.pending)
        .toList();
  }

  @override
  Future<List<T>> getFailedSync<T>(String boxName) async {
    final box = _getBox(boxName);
    return box.values
        .cast<T>()
        .where((entity) => (entity as dynamic).syncStatus == SyncStatus.failed)
        .toList();
  }

  @override
  Future<List<T>> getConflictedSync<T>(String boxName) async {
    final box = _getBox(boxName);
    return box.values
        .cast<T>()
        .where(
          (entity) => (entity as dynamic).syncStatus == SyncStatus.conflicted,
        )
        .toList();
  }

  // Transaction support
  @override
  Future<void> executeTransaction(List<TransactionOperation> operations) async {
    // For now, we'll execute operations sequentially
    // In a real implementation, you might want to use a proper transaction system
    try {
      for (final operation in operations) {
        await _executeOperation(operation);
      }
    } catch (e) {
      // In a real implementation, you would rollback here
      rethrow;
    }
  }

  Future<void> _executeOperation(TransactionOperation operation) async {
    final box = _getBox(operation.entityType);

    switch (operation.operation) {
      case SyncOperation.create:
      case SyncOperation.update:
        await box.put(operation.entityId, operation.data);
        break;
      case SyncOperation.delete:
        await box.delete(operation.entityId);
        break;
    }
  }

  // Utility methods
  Box<dynamic> _getBox(String boxName) {
    switch (boxName) {
      case StorageKeys.productsBox:
        return _productsBox;
      case StorageKeys.ordersBox:
        return _ordersBox;
      case StorageKeys.syncQueueBox:
        return _syncQueueBox;
      case StorageKeys.conflictsBox:
        return _conflictsBox;
      case StorageKeys.syncStatusBox:
        return _syncStatusBox;
      default:
        throw ArgumentError('Unknown box name: $boxName');
    }
  }

  // SharedPreferences methods
  @override
  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  @override
  String? getString(String key) {
    return _prefs.getString(key);
  }

  @override
  Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  @override
  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  @override
  Future<void> setInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  @override
  int? getInt(String key) {
    return _prefs.getInt(key);
  }

  @override
  Future<void> setDateTime(String key, DateTime value) async {
    await _prefs.setString(key, value.toIso8601String());
  }

  @override
  DateTime? getDateTime(String key) {
    final value = _prefs.getString(key);
    return value != null ? DateTime.parse(value) : null;
  }

  // Cleanup
  Future<void> dispose() async {
    await _productsBox.close();
    await _ordersBox.close();
    await _syncQueueBox.close();
    await _conflictsBox.close();
    await _syncStatusBox.close();
    _isInitialized = false;
  }
}
