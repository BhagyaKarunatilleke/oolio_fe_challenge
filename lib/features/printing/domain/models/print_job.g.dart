// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'print_job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrintJobImpl _$$PrintJobImplFromJson(Map<String, dynamic> json) =>
    _$PrintJobImpl(
      id: json['id'] as String,
      destination: PrintDestination.fromJson(
          json['destination'] as Map<String, dynamic>),
      priority:
          PrintJobPriority.fromJson(json['priority'] as Map<String, dynamic>),
      status: PrintJobStatus.fromJson(json['status'] as Map<String, dynamic>),
      receiptData: json['receiptData'] as String,
      retryCount: (json['retryCount'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      escPosBytes: (json['escPosBytes'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$PrintJobImplToJson(_$PrintJobImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'destination': instance.destination,
      'priority': instance.priority,
      'status': instance.status,
      'receiptData': instance.receiptData,
      'retryCount': instance.retryCount,
      'createdAt': instance.createdAt.toIso8601String(),
      'startedAt': instance.startedAt?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'escPosBytes': instance.escPosBytes,
    };
