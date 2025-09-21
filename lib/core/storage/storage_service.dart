abstract class StorageService {
  Future<void> initialize();
  Future<void> save<T>(String boxName, T entity);
  Future<T?> get<T>(String boxName, String id);
  Future<List<T>> getAll<T>(String boxName);
  Future<void> delete(String boxName, String id);
  Future<void> deleteAll(String boxName);
  Future<List<T>> getPendingSync<T>(String boxName);
  Future<List<T>> getFailedSync<T>(String boxName);
  Future<List<T>> getConflictedSync<T>(String boxName);
  Future<void> executeTransaction(List<TransactionOperation> operations);

  // SharedPreferences methods
  Future<void> setString(String key, String value);
  String? getString(String key);
  Future<void> setBool(String key, bool value);
  bool? getBool(String key);
  Future<void> setInt(String key, int value);
  int? getInt(String key);
  Future<void> setDateTime(String key, DateTime value);
  DateTime? getDateTime(String key);
}

class TransactionOperation {
  final String entityType;
  final String entityId;
  final dynamic operation;
  final Map<String, dynamic> data;

  TransactionOperation({
    required this.entityType,
    required this.entityId,
    required this.operation,
    required this.data,
  });
}
