import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/models/print_job.dart';
import '../../domain/models/print_destination.dart';
import '../../domain/models/print_job_priority.dart';
import '../../domain/models/print_queue.dart';
import '../../domain/repositories/print_queue_repository.dart';
import '../../domain/models/print_job_manager.dart';
import 'print_queue_state.dart';

@injectable
class PrintQueueCubit extends Cubit<PrintQueueState> {
  final PrintQueueRepository _repository;
  final PrintJobManager _jobManager;
  Timer? _processingTimer;

  PrintQueueCubit(this._repository, this._jobManager)
    : super(const PrintQueueState.initial()) {
    _startProcessingTimer();
  }

  /// Load the current print queue
  Future<void> loadQueue() async {
    emit(const PrintQueueState.loading());

    try {
      final queue = await _repository.getQueue();
      emit(
        PrintQueueState.loaded(
          queue: queue,
          isProcessing: _jobManager.isProcessing,
        ),
      );
    } catch (e) {
      emit(PrintQueueState.error(message: 'Failed to load print queue: $e'));
    }
  }

  /// Add a new print job
  Future<void> addPrintJob({
    required Map<String, dynamic> orderData,
    PrintDestination destination = const PrintDestination.file(),
    PrintJobPriority priority = const PrintJobPriority.normal(),
  }) async {
    try {
      final job = PrintJobExtension.fromOrderData(
        orderData: orderData,
        destination: destination,
        priority: priority,
      );

      await _repository.addJob(job);
      await loadQueue(); // Refresh the queue
    } catch (e) {
      emit(
        PrintQueueState.error(
          message: 'Failed to add print job: $e',
          queue: state.queue,
        ),
      );
    }
  }

  /// Retry a failed job
  Future<void> retryJob(String jobId) async {
    try {
      await _jobManager.retryJob(jobId);
      await loadQueue(); // Refresh the queue
    } catch (e) {
      emit(
        PrintQueueState.error(
          message: 'Failed to retry job: $e',
          queue: state.queue,
        ),
      );
    }
  }

  /// Cancel a job
  Future<void> cancelJob(String jobId) async {
    try {
      await _jobManager.cancelJob(jobId);
      await loadQueue(); // Refresh the queue
    } catch (e) {
      emit(
        PrintQueueState.error(
          message: 'Failed to cancel job: $e',
          queue: state.queue,
        ),
      );
    }
  }

  /// Remove a job from the queue
  Future<void> removeJob(String jobId) async {
    try {
      await _repository.removeJob(jobId);
      await loadQueue(); // Refresh the queue
    } catch (e) {
      emit(
        PrintQueueState.error(
          message: 'Failed to remove job: $e',
          queue: state.queue,
        ),
      );
    }
  }

  /// Process the next job manually
  Future<void> processNextJob() async {
    try {
      await _jobManager.processNextJob();
      await loadQueue(); // Refresh the queue
    } catch (e) {
      emit(
        PrintQueueState.error(
          message: 'Failed to process job: $e',
          queue: state.queue,
        ),
      );
    }
  }

  /// Clear old completed jobs
  Future<void> clearOldCompletedJobs({
    Duration maxAge = const Duration(hours: 24),
  }) async {
    try {
      await _repository.clearOldCompletedJobs(maxAge: maxAge);
      await loadQueue(); // Refresh the queue
    } catch (e) {
      emit(
        PrintQueueState.error(
          message: 'Failed to clear old jobs: $e',
          queue: state.queue,
        ),
      );
    }
  }

  /// Clear stale jobs
  Future<void> clearStaleJobs() async {
    try {
      await _repository.clearStaleJobs();
      await loadQueue(); // Refresh the queue
    } catch (e) {
      emit(
        PrintQueueState.error(
          message: 'Failed to clear stale jobs: $e',
          queue: state.queue,
        ),
      );
    }
  }

  /// Clear all jobs
  Future<void> clearAllJobs() async {
    try {
      await _repository.clearAllJobs();
      await loadQueue(); // Refresh the queue
    } catch (e) {
      emit(
        PrintQueueState.error(
          message: 'Failed to clear all jobs: $e',
          queue: state.queue,
        ),
      );
    }
  }

  /// Start automatic processing timer
  void _startProcessingTimer() {
    _processingTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _autoProcessJobs();
    });
  }

  /// Automatically process pending jobs
  Future<void> _autoProcessJobs() async {
    final currentState = state;
    if (currentState.queue != null &&
        !currentState.isProcessing &&
        currentState.queue!.hasPendingJobs) {
      await processNextJob();
    }
  }

  @override
  Future<void> close() {
    _processingTimer?.cancel();
    return super.close();
  }
}
