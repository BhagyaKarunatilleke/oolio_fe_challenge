// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReceiptDataImpl _$$ReceiptDataImplFromJson(Map<String, dynamic> json) =>
    _$ReceiptDataImpl(
      data: json['data'] as Map<String, dynamic>,
      templateId: json['templateId'] as String?,
      generatedAt: json['generatedAt'] == null
          ? null
          : DateTime.parse(json['generatedAt'] as String),
    );

Map<String, dynamic> _$$ReceiptDataImplToJson(_$ReceiptDataImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'templateId': instance.templateId,
      'generatedAt': instance.generatedAt?.toIso8601String(),
    };
