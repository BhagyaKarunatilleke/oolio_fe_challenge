import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import '../../domain/models/print_job.dart';
import '../../domain/models/print_queue.dart';
import '../../domain/repositories/print_queue_repository.dart';

@Singleton(as: PrintQueueRepository)
class PrintQueueRepositoryImpl implements PrintQueueRepository {
  static const String _boxName = 'print_queue';
  late Box<String> _box;

  /// Initialize the repository
  Future<void> init() async {
    _box = await Hive.openBox<String>(_boxName);
  }

  @override
  Future<PrintQueue> getQueue() async {
    final queueJson = _box.get('queue');
    if (queueJson == null) {
      return const PrintQueue();
    }

    try {
      final queueData = jsonDecode(queueJson) as Map<String, dynamic>;
      return PrintQueue.fromJson(queueData);
    } catch (e) {
      // If parsing fails, return empty queue
      return const PrintQueue();
    }
  }

  @override
  Future<void> addJob(PrintJob job) async {
    final queue = await getQueue();
    final updatedQueue = queue.addJob(job);
    await _saveQueue(updatedQueue);
  }

  @override
  Future<void> removeJob(String jobId) async {
    final queue = await getQueue();
    final updatedQueue = queue.removeJob(jobId);
    await _saveQueue(updatedQueue);
  }

  @override
  Future<void> updateJob(PrintJob job) async {
    final queue = await getQueue();
    final updatedQueue = queue.updateJob(job);
    await _saveQueue(updatedQueue);
  }

  @override
  Future<PrintJob?> getJob(String jobId) async {
    final queue = await getQueue();
    try {
      return queue.jobs.firstWhere((job) => job.id == jobId);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<PrintJob>> getAllJobs() async {
    final queue = await getQueue();
    return queue.jobs;
  }

  @override
  Future<void> clearOldCompletedJobs({
    Duration maxAge = const Duration(hours: 24),
  }) async {
    final queue = await getQueue();
    final updatedQueue = queue.clearOldCompletedJobs(maxAge: maxAge);
    await _saveQueue(updatedQueue);
  }

  @override
  Future<void> clearStaleJobs() async {
    final queue = await getQueue();
    final updatedQueue = queue.clearStaleJobs();
    await _saveQueue(updatedQueue);
  }

  @override
  Future<void> clearAllJobs() async {
    await _saveQueue(const PrintQueue());
  }

  /// Save queue to storage
  Future<void> _saveQueue(PrintQueue queue) async {
    final queueJson = jsonEncode(queue.toJson());
    await _box.put('queue', queueJson);
  }

  /// Close the repository
  Future<void> close() async {
    await _box.close();
  }
}
