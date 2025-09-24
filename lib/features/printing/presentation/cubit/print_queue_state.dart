import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/models/print_job.dart';
import '../../domain/models/print_queue.dart';

part 'print_queue_state.freezed.dart';

@freezed
class PrintQueueState with _$PrintQueueState {
  const factory PrintQueueState.initial() = _Initial;
  const factory PrintQueueState.loading() = _Loading;
  const factory PrintQueueState.loaded({
    required PrintQueue queue,
    @Default(false) bool isProcessing,
  }) = _Loaded;
  const factory PrintQueueState.error({
    required String message,
    PrintQueue? queue,
  }) = _Error;
}

extension PrintQueueStateExtension on PrintQueueState {
  PrintQueue? get queue {
    return whenOrNull(
      loaded: (queue, isProcessing) => queue,
      error: (message, queue) => queue,
    );
  }

  bool get isLoading {
    return when(
      initial: () => false,
      loading: () => true,
      loaded: (queue, isProcessing) => false,
      error: (message, queue) => false,
    );
  }

  bool get isProcessing {
    return whenOrNull(loaded: (queue, isProcessing) => isProcessing) ?? false;
  }

  String? get errorMessage {
    return whenOrNull(error: (message, queue) => message);
  }

  List<PrintJob> get jobs {
    return queue?.jobs ?? [];
  }

  List<PrintJob> get pendingJobs {
    return queue?.pendingJobs ?? [];
  }

  List<PrintJob> get failedJobs {
    return queue?.failedJobs ?? [];
  }

  List<PrintJob> get completedJobs {
    return queue?.completedJobs ?? [];
  }

  int get totalJobs {
    return queue?.totalJobs ?? 0;
  }

  int get activeJobs {
    return queue?.activeJobs ?? 0;
  }

  bool get hasPendingJobs {
    return queue?.hasPendingJobs ?? false;
  }

  bool get hasFailedJobs {
    return queue?.hasFailedJobs ?? false;
  }
}
