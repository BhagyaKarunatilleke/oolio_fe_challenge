// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'print_queue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrintQueueImpl _$$PrintQueueImplFromJson(Map<String, dynamic> json) =>
    _$PrintQueueImpl(
      jobs: (json['jobs'] as List<dynamic>?)
              ?.map((e) => PrintJob.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isProcessing: json['isProcessing'] as bool? ?? false,
      lastProcessedAt: json['lastProcessedAt'] == null
          ? null
          : DateTime.parse(json['lastProcessedAt'] as String),
    );

Map<String, dynamic> _$$PrintQueueImplToJson(_$PrintQueueImpl instance) =>
    <String, dynamic>{
      'jobs': instance.jobs,
      'isProcessing': instance.isProcessing,
      'lastProcessedAt': instance.lastProcessedAt?.toIso8601String(),
    };

_$PrintQueueStatsImpl _$$PrintQueueStatsImplFromJson(
        Map<String, dynamic> json) =>
    _$PrintQueueStatsImpl(
      totalJobs: (json['totalJobs'] as num?)?.toInt() ?? 0,
      pendingJobs: (json['pendingJobs'] as num?)?.toInt() ?? 0,
      processingJobs: (json['processingJobs'] as num?)?.toInt() ?? 0,
      completedJobs: (json['completedJobs'] as num?)?.toInt() ?? 0,
      failedJobs: (json['failedJobs'] as num?)?.toInt() ?? 0,
      cancelledJobs: (json['cancelledJobs'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PrintQueueStatsImplToJson(
        _$PrintQueueStatsImpl instance) =>
    <String, dynamic>{
      'totalJobs': instance.totalJobs,
      'pendingJobs': instance.pendingJobs,
      'processingJobs': instance.processingJobs,
      'completedJobs': instance.completedJobs,
      'failedJobs': instance.failedJobs,
      'cancelledJobs': instance.cancelledJobs,
    };
