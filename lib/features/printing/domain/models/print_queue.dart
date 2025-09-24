import 'package:freezed_annotation/freezed_annotation.dart';
import 'print_job.dart';
import 'print_job_status.dart';
import 'print_job_priority.dart';

part 'print_queue.freezed.dart';
part 'print_queue.g.dart';

@freezed
class PrintQueue with _$PrintQueue {
  const factory PrintQueue({
    @Default([]) List<PrintJob> jobs,
    @Default(false) bool isProcessing,
    DateTime? lastProcessedAt,
  }) = _PrintQueue;

  factory PrintQueue.fromJson(Map<String, dynamic> json) =>
      _$PrintQueueFromJson(json);
}

extension PrintQueueExtension on PrintQueue {
  /// Add a new job to the queue
  PrintQueue addJob(PrintJob job) {
    final updatedJobs = List<PrintJob>.from(jobs)..add(job);
    return copyWith(jobs: _sortJobsByPriority(updatedJobs));
  }

  /// Remove a job from the queue
  PrintQueue removeJob(String jobId) {
    final updatedJobs = jobs.where((job) => job.id != jobId).toList();
    return copyWith(jobs: updatedJobs);
  }

  /// Update a job in the queue
  PrintQueue updateJob(PrintJob updatedJob) {
    final updatedJobs = jobs
        .map((job) => job.id == updatedJob.id ? updatedJob : job)
        .toList();
    return copyWith(jobs: _sortJobsByPriority(updatedJobs));
  }

  /// Get the next job to process
  PrintJob? get nextJob {
    return jobs.where((job) => job.status.isActive).firstOrNull;
  }

  /// Get pending jobs
  List<PrintJob> get pendingJobs {
    return jobs
        .where(
          (job) => job.status.when(
            pending: () => true,
            processing: () => false,
            completed: () => false,
            failed: (errorMessage, failedAt) => false,
            cancelled: () => false,
          ),
        )
        .toList();
  }

  /// Get failed jobs that can be retried
  List<PrintJob> get failedJobs {
    return jobs.where((job) => job.canRetry).toList();
  }

  /// Get completed jobs
  List<PrintJob> get completedJobs {
    return jobs
        .where(
          (job) => job.status.when(
            pending: () => false,
            processing: () => false,
            completed: () => true,
            failed: (errorMessage, failedAt) => false,
            cancelled: () => false,
          ),
        )
        .toList();
  }

  /// Get jobs by status
  List<PrintJob> getJobsByStatus(PrintJobStatus status) {
    return jobs.where((job) => job.status == status).toList();
  }

  /// Get total count of jobs
  int get totalJobs => jobs.length;

  /// Get count of active jobs (pending + processing)
  int get activeJobs {
    return jobs.where((job) => job.status.isActive).length;
  }

  /// Get count of failed jobs
  int get failedJobsCount {
    return jobs
        .where(
          (job) => job.status.when(
            pending: () => false,
            processing: () => false,
            completed: () => false,
            failed: (errorMessage, failedAt) => true,
            cancelled: () => false,
          ),
        )
        .length;
  }

  /// Check if queue has any pending jobs
  bool get hasPendingJobs => pendingJobs.isNotEmpty;

  /// Check if queue has any failed jobs that can be retried
  bool get hasFailedJobs => failedJobs.isNotEmpty;

  /// Clear completed jobs older than specified duration
  PrintQueue clearOldCompletedJobs({
    Duration maxAge = const Duration(hours: 24),
  }) {
    final cutoffTime = DateTime.now().subtract(maxAge);
    final filteredJobs = jobs.where((job) {
      return job.status.when(
        pending: () => true,
        processing: () => true,
        completed: () => job.completedAt?.isAfter(cutoffTime) ?? false,
        failed: (errorMessage, failedAt) => true,
        cancelled: () => true,
      );
    }).toList();

    return copyWith(jobs: filteredJobs);
  }

  /// Clear stale jobs (older than 1 hour and not active)
  PrintQueue clearStaleJobs() {
    final filteredJobs = jobs.where((job) {
      if (job.status.isActive) return true; // Keep active jobs
      return !job.isStale; // Remove stale non-active jobs
    }).toList();

    return copyWith(jobs: filteredJobs);
  }

  /// Sort jobs by priority (urgent first, then by creation time)
  List<PrintJob> _sortJobsByPriority(List<PrintJob> jobsList) {
    jobsList.sort((a, b) {
      // First sort by priority (higher priority first)
      final priorityComparison = b.priority.numericValue.compareTo(
        a.priority.numericValue,
      );
      if (priorityComparison != 0) return priorityComparison;

      // Then sort by creation time (older first)
      return a.createdAt.compareTo(b.createdAt);
    });

    return jobsList;
  }

  /// Get queue statistics
  PrintQueueStats get stats {
    return PrintQueueStats(
      totalJobs: totalJobs,
      pendingJobs: pendingJobs.length,
      processingJobs: jobs
          .where(
            (job) => job.status.when(
              pending: () => false,
              processing: () => true,
              completed: () => false,
              failed: (errorMessage, failedAt) => false,
              cancelled: () => false,
            ),
          )
          .length,
      completedJobs: completedJobs.length,
      failedJobs: failedJobsCount,
      cancelledJobs: jobs
          .where(
            (job) => job.status.when(
              pending: () => false,
              processing: () => false,
              completed: () => false,
              failed: (errorMessage, failedAt) => false,
              cancelled: () => true,
            ),
          )
          .length,
    );
  }
}

@freezed
class PrintQueueStats with _$PrintQueueStats {
  const factory PrintQueueStats({
    @Default(0) int totalJobs,
    @Default(0) int pendingJobs,
    @Default(0) int processingJobs,
    @Default(0) int completedJobs,
    @Default(0) int failedJobs,
    @Default(0) int cancelledJobs,
  }) = _PrintQueueStats;

  factory PrintQueueStats.fromJson(Map<String, dynamic> json) =>
      _$PrintQueueStatsFromJson(json);
}
