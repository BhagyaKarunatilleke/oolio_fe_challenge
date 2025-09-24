import '../models/print_job.dart';
import '../models/print_queue.dart';

abstract class PrintQueueRepository {
  /// Get the current print queue
  Future<PrintQueue> getQueue();

  /// Add a job to the queue
  Future<void> addJob(PrintJob job);

  /// Remove a job from the queue
  Future<void> removeJob(String jobId);

  /// Update a job in the queue
  Future<void> updateJob(PrintJob job);

  /// Get a specific job by ID
  Future<PrintJob?> getJob(String jobId);

  /// Get all jobs
  Future<List<PrintJob>> getAllJobs();

  /// Clear completed jobs older than specified duration
  Future<void> clearOldCompletedJobs({
    Duration maxAge = const Duration(hours: 24),
  });

  /// Clear stale jobs
  Future<void> clearStaleJobs();

  /// Clear all jobs
  Future<void> clearAllJobs();
}
