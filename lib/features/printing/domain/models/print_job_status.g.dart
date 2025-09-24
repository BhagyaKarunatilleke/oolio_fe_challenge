// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'print_job_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PendingImpl _$$PendingImplFromJson(Map<String, dynamic> json) =>
    _$PendingImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PendingImplToJson(_$PendingImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ProcessingImpl _$$ProcessingImplFromJson(Map<String, dynamic> json) =>
    _$ProcessingImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ProcessingImplToJson(_$ProcessingImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$CompletedImpl _$$CompletedImplFromJson(Map<String, dynamic> json) =>
    _$CompletedImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CompletedImplToJson(_$CompletedImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$FailedImpl _$$FailedImplFromJson(Map<String, dynamic> json) => _$FailedImpl(
      errorMessage: json['errorMessage'] as String,
      failedAt: json['failedAt'] == null
          ? null
          : DateTime.parse(json['failedAt'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FailedImplToJson(_$FailedImpl instance) =>
    <String, dynamic>{
      'errorMessage': instance.errorMessage,
      'failedAt': instance.failedAt?.toIso8601String(),
      'runtimeType': instance.$type,
    };

_$CancelledImpl _$$CancelledImplFromJson(Map<String, dynamic> json) =>
    _$CancelledImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CancelledImplToJson(_$CancelledImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
