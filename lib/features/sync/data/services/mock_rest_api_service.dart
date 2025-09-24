import 'dart:math';
import 'package:injectable/injectable.dart';
import '../models/sync_operation.dart';

/// Mock REST API service for demo purposes
/// Simulates real API calls with proper responses and error handling
@singleton
class MockRestApiService {
  final Random _random = Random();

  // Simulated server state
  final Map<String, Map<String, dynamic>> _serverData = {};
  final Map<String, DateTime> _lastSyncTimestamps = {};

  /// Simulate API call for sync operations
  Future<Map<String, dynamic>> performSyncOperation({
    required String entityType,
    required String entityId,
    required SyncOperation operation,
    required Map<String, dynamic> data,
  }) async {
    // Simulate network delay (100ms - 2s)
    await Future.delayed(Duration(milliseconds: 100 + _random.nextInt(1900)));

    // Simulate network failures (5% chance)
    if (_random.nextDouble() < 0.05) {
      throw SyncApiException('Network timeout', 408);
    }

    // Simulate server errors (2% chance)
    if (_random.nextDouble() < 0.02) {
      throw SyncApiException('Internal server error', 500);
    }

    // Simulate conflicts (3% chance for updates)
    if (operation == SyncOperation.update && _random.nextDouble() < 0.03) {
      throw SyncConflictException(
        'Conflict detected: Entity was modified by another user',
        _getServerVersion(entityType, entityId),
      );
    }

    return _processOperation(entityType, entityId, operation, data);
  }

  Map<String, dynamic> _processOperation(
    String entityType,
    String entityId,
    SyncOperation operation,
    Map<String, dynamic> data,
  ) {
    final key = '$entityType:$entityId';

    switch (operation) {
      case SyncOperation.create:
        if (_serverData.containsKey(key)) {
          throw SyncApiException('Entity already exists', 409);
        }
        _serverData[key] = {
          ...data,
          'serverId': entityId,
          'createdAt': DateTime.now().toIso8601String(),
          'updatedAt': DateTime.now().toIso8601String(),
          'version': 1,
        };
        break;

      case SyncOperation.update:
        if (!_serverData.containsKey(key)) {
          throw SyncApiException('Entity not found', 404);
        }
        final existing = _serverData[key]!;
        _serverData[key] = {
          ...existing,
          ...data,
          'updatedAt': DateTime.now().toIso8601String(),
          'version': (existing['version'] as int) + 1,
        };
        break;

      case SyncOperation.delete:
        if (!_serverData.containsKey(key)) {
          throw SyncApiException('Entity not found', 404);
        }
        _serverData.remove(key);
        break;
    }

    _lastSyncTimestamps[entityType] = DateTime.now();

    return {
      'success': true,
      'data': _serverData[key],
      'timestamp': DateTime.now().toIso8601String(),
      'version': _serverData[key]?['version'] ?? 1,
    };
  }

  /// Get server version for conflict detection
  int _getServerVersion(String entityType, String entityId) {
    final key = '$entityType:$entityId';
    return _serverData[key]?['version'] ?? 0;
  }

  /// Simulate fetching changes since last sync
  Future<List<Map<String, dynamic>>> fetchChangesSince({
    required String entityType,
    required DateTime since,
  }) async {
    await Future.delayed(Duration(milliseconds: 200 + _random.nextInt(800)));

    final changes = <Map<String, dynamic>>[];
    final cutoff = since.toIso8601String();

    for (final entry in _serverData.entries) {
      if (entry.key.startsWith('$entityType:')) {
        final data = entry.value;
        final updatedAt = data['updatedAt'] as String?;
        final createdAt = data['createdAt'] as String?;

        if (updatedAt != null && updatedAt.compareTo(cutoff) > 0) {
          changes.add({
            'operation': updatedAt == createdAt ? 'create' : 'update',
            'entityType': entityType,
            'entityId': entry.key.split(':')[1],
            'data': data,
            'timestamp': updatedAt,
          });
        }
      }
    }

    return changes;
  }

  /// Simulate bulk sync for large datasets
  Future<Map<String, dynamic>> performBulkSync({
    required String entityType,
    required List<Map<String, dynamic>> operations,
  }) async {
    await Future.delayed(Duration(milliseconds: 500 + _random.nextInt(1500)));

    final results = <Map<String, dynamic>>[];
    int successCount = 0;
    int failureCount = 0;

    for (final operation in operations) {
      try {
        final result = await performSyncOperation(
          entityType: entityType,
          entityId: operation['entityId'],
          operation: SyncOperation.values.firstWhere(
            (op) => op.name == operation['operation'],
          ),
          data: operation['data'],
        );
        results.add({'success': true, 'result': result});
        successCount++;
      } catch (e) {
        results.add({'success': false, 'error': e.toString()});
        failureCount++;
      }
    }

    return {
      'success': failureCount == 0,
      'totalProcessed': operations.length,
      'successCount': successCount,
      'failureCount': failureCount,
      'results': results,
    };
  }

  /// Get sync statistics
  Map<String, dynamic> getSyncStats() {
    final stats = <String, int>{};
    for (final key in _serverData.keys) {
      final entityType = key.split(':')[0];
      stats[entityType] = (stats[entityType] ?? 0) + 1;
    }
    return stats;
  }

  /// Simulate server health check
  Future<bool> healthCheck() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _random.nextDouble() > 0.01; // 99% uptime
  }
}

/// Custom exceptions for sync operations
class SyncApiException implements Exception {
  final String message;
  final int statusCode;

  SyncApiException(this.message, this.statusCode);

  @override
  String toString() => 'SyncApiException($statusCode): $message';
}

class SyncConflictException implements Exception {
  final String message;
  final int serverVersion;

  SyncConflictException(this.message, this.serverVersion);

  @override
  String toString() =>
      'SyncConflictException: $message (server version: $serverVersion)';
}
