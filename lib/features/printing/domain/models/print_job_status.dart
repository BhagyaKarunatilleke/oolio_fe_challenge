import 'package:freezed_annotation/freezed_annotation.dart';

part 'print_job_status.freezed.dart';
part 'print_job_status.g.dart';

@freezed
class PrintJobStatus with _$PrintJobStatus {
  const factory PrintJobStatus.pending() = _Pending;
  const factory PrintJobStatus.processing() = _Processing;
  const factory PrintJobStatus.completed() = _Completed;
  const factory PrintJobStatus.failed({
    required String errorMessage,
    DateTime? failedAt,
  }) = _Failed;
  const factory PrintJobStatus.cancelled() = _Cancelled;

  factory PrintJobStatus.fromJson(Map<String, dynamic> json) =>
      _$PrintJobStatusFromJson(json);
}

extension PrintJobStatusExtension on PrintJobStatus {
  String get displayName {
    return when(
      pending: () => 'Pending',
      processing: () => 'Processing',
      completed: () => 'Completed',
      failed: (errorMessage, failedAt) => 'Failed',
      cancelled: () => 'Cancelled',
    );
  }

  bool get isActive {
    return when(
      pending: () => true,
      processing: () => true,
      completed: () => false,
      failed: (errorMessage, failedAt) => false,
      cancelled: () => false,
    );
  }

  bool get canRetry {
    return when(
      pending: () => false,
      processing: () => false,
      completed: () => false,
      failed: (errorMessage, failedAt) => true,
      cancelled: () => false,
    );
  }
}
