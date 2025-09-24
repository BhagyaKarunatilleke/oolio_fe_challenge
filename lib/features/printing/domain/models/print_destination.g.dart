// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'print_destination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FileImpl _$$FileImplFromJson(Map<String, dynamic> json) => _$FileImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FileImplToJson(_$FileImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$UsbImpl _$$UsbImplFromJson(Map<String, dynamic> json) => _$UsbImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UsbImplToJson(_$UsbImpl instance) => <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$NetworkImpl _$$NetworkImplFromJson(Map<String, dynamic> json) =>
    _$NetworkImpl(
      ipAddress: json['ipAddress'] as String,
      port: (json['port'] as num?)?.toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NetworkImplToJson(_$NetworkImpl instance) =>
    <String, dynamic>{
      'ipAddress': instance.ipAddress,
      'port': instance.port,
      'runtimeType': instance.$type,
    };

_$BluetoothImpl _$$BluetoothImplFromJson(Map<String, dynamic> json) =>
    _$BluetoothImpl(
      deviceName: json['deviceName'] as String,
      deviceAddress: json['deviceAddress'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$BluetoothImplToJson(_$BluetoothImpl instance) =>
    <String, dynamic>{
      'deviceName': instance.deviceName,
      'deviceAddress': instance.deviceAddress,
      'runtimeType': instance.$type,
    };
