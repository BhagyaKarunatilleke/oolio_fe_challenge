import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/models/print_queue.dart';

part 'print_queue_state.freezed.dart';

@freezed
class PrintQueueState with _$PrintQueueState {
  const PrintQueueState._(); // Private constructor for custom getters/methods

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

  bool get isLoading => this is _Loading;
  bool get isProcessing {
    return whenOrNull(loaded: (queue, isProcessing) => isProcessing) ?? false;
  }

  String? get errorMessage {
    return whenOrNull(error: (message, queue) => message);
  }

  PrintQueue? get queue {
    return whenOrNull(
      loaded: (queue, isProcessing) => queue,
      error: (message, queue) => queue,
    );
  }
}
