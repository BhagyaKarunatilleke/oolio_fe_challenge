import 'package:freezed_annotation/freezed_annotation.dart';

part 'print_job_priority.freezed.dart';
part 'print_job_priority.g.dart';

@freezed
class PrintJobPriority with _$PrintJobPriority {
  const factory PrintJobPriority.low() = _Low;
  const factory PrintJobPriority.normal() = _Normal;
  const factory PrintJobPriority.high() = _High;
  const factory PrintJobPriority.urgent() = _Urgent;

  factory PrintJobPriority.fromJson(Map<String, dynamic> json) =>
      _$PrintJobPriorityFromJson(json);
}

extension PrintJobPriorityExtension on PrintJobPriority {
  String get displayName {
    return when(
      low: () => 'Low',
      normal: () => 'Normal',
      high: () => 'High',
      urgent: () => 'Urgent',
    );
  }

  int get numericValue {
    return when(low: () => 1, normal: () => 2, high: () => 3, urgent: () => 4);
  }

  bool operator >(PrintJobPriority other) {
    return numericValue > other.numericValue;
  }

  bool operator <(PrintJobPriority other) {
    return numericValue < other.numericValue;
  }

  bool operator >=(PrintJobPriority other) {
    return numericValue >= other.numericValue;
  }

  bool operator <=(PrintJobPriority other) {
    return numericValue <= other.numericValue;
  }
}
