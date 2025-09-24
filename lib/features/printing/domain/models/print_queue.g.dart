// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'print_queue.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrintQueueAdapter extends TypeAdapter<PrintQueue> {
  @override
  final int typeId = 15;

  @override
  PrintQueue read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrintQueue(
      jobs: (fields[0] as List).cast<PrintJob>(),
    );
  }

  @override
  void write(BinaryWriter writer, PrintQueue obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.jobs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrintQueueAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrintQueueImpl _$$PrintQueueImplFromJson(Map<String, dynamic> json) =>
    _$PrintQueueImpl(
      jobs: (json['jobs'] as List<dynamic>?)
              ?.map((e) => PrintJob.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PrintQueueImplToJson(_$PrintQueueImpl instance) =>
    <String, dynamic>{
      'jobs': instance.jobs,
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
