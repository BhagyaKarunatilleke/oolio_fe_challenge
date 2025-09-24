import 'package:freezed_annotation/freezed_annotation.dart';

part 'print_destination.freezed.dart';
part 'print_destination.g.dart';

@freezed
class PrintDestination with _$PrintDestination {
  const factory PrintDestination.file() = _File;
  const factory PrintDestination.usb() = _Usb;
  const factory PrintDestination.network({
    required String ipAddress,
    int? port,
  }) = _Network;
  const factory PrintDestination.bluetooth({
    required String deviceName,
    String? deviceAddress,
  }) = _Bluetooth;

  factory PrintDestination.fromJson(Map<String, dynamic> json) =>
      _$PrintDestinationFromJson(json);
}

extension PrintDestinationExtension on PrintDestination {
  String get displayName {
    return when(
      file: () => 'File (Demo)',
      usb: () => 'USB Printer',
      network: (ipAddress, port) =>
          'Network ($ipAddress${port != null ? ':$port' : ''})',
      bluetooth: (deviceName, deviceAddress) => 'Bluetooth ($deviceName)',
    );
  }

  String get identifier {
    return when(
      file: () => 'file',
      usb: () => 'usb',
      network: (ipAddress, port) => 'network_${ipAddress}_${port ?? 9100}',
      bluetooth: (deviceName, deviceAddress) =>
          'bluetooth_${deviceAddress ?? deviceName}',
    );
  }
}
