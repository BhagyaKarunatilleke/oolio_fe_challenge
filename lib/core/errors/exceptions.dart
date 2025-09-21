abstract class StorageException implements Exception {
  final String message;
  final String? code;

  const StorageException(this.message, [this.code]);

  @override
  String toString() => 'StorageException: $message';
}

class HiveException extends StorageException {
  const HiveException(super.message, [super.code]);

  @override
  String toString() => 'HiveException: $message';
}

class SyncException extends StorageException {
  const SyncException(super.message, [super.code]);

  @override
  String toString() => 'SyncException: $message';
}

class ConflictException extends StorageException {
  final String entityType;
  final String entityId;

  const ConflictException(
    super.message,
    this.entityType,
    this.entityId, [
    super.code,
  ]);

  @override
  String toString() => 'ConflictException: $message (Entity: $entityType:$entityId)';
}
