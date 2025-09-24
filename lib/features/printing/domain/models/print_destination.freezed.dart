// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'print_destination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrintDestination _$PrintDestinationFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'file':
      return _File.fromJson(json);
    case 'usb':
      return _Usb.fromJson(json);
    case 'network':
      return _Network.fromJson(json);
    case 'bluetooth':
      return _Bluetooth.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'PrintDestination',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$PrintDestination {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() file,
    required TResult Function() usb,
    required TResult Function(String ipAddress, int? port) network,
    required TResult Function(String deviceName, String? deviceAddress)
        bluetooth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? file,
    TResult? Function()? usb,
    TResult? Function(String ipAddress, int? port)? network,
    TResult? Function(String deviceName, String? deviceAddress)? bluetooth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? file,
    TResult Function()? usb,
    TResult Function(String ipAddress, int? port)? network,
    TResult Function(String deviceName, String? deviceAddress)? bluetooth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_File value) file,
    required TResult Function(_Usb value) usb,
    required TResult Function(_Network value) network,
    required TResult Function(_Bluetooth value) bluetooth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_File value)? file,
    TResult? Function(_Usb value)? usb,
    TResult? Function(_Network value)? network,
    TResult? Function(_Bluetooth value)? bluetooth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_File value)? file,
    TResult Function(_Usb value)? usb,
    TResult Function(_Network value)? network,
    TResult Function(_Bluetooth value)? bluetooth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this PrintDestination to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrintDestinationCopyWith<$Res> {
  factory $PrintDestinationCopyWith(
          PrintDestination value, $Res Function(PrintDestination) then) =
      _$PrintDestinationCopyWithImpl<$Res, PrintDestination>;
}

/// @nodoc
class _$PrintDestinationCopyWithImpl<$Res, $Val extends PrintDestination>
    implements $PrintDestinationCopyWith<$Res> {
  _$PrintDestinationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrintDestination
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FileImplCopyWith<$Res> {
  factory _$$FileImplCopyWith(
          _$FileImpl value, $Res Function(_$FileImpl) then) =
      __$$FileImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FileImplCopyWithImpl<$Res>
    extends _$PrintDestinationCopyWithImpl<$Res, _$FileImpl>
    implements _$$FileImplCopyWith<$Res> {
  __$$FileImplCopyWithImpl(_$FileImpl _value, $Res Function(_$FileImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrintDestination
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$FileImpl implements _File {
  const _$FileImpl({final String? $type}) : $type = $type ?? 'file';

  factory _$FileImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PrintDestination.file()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FileImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() file,
    required TResult Function() usb,
    required TResult Function(String ipAddress, int? port) network,
    required TResult Function(String deviceName, String? deviceAddress)
        bluetooth,
  }) {
    return file();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? file,
    TResult? Function()? usb,
    TResult? Function(String ipAddress, int? port)? network,
    TResult? Function(String deviceName, String? deviceAddress)? bluetooth,
  }) {
    return file?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? file,
    TResult Function()? usb,
    TResult Function(String ipAddress, int? port)? network,
    TResult Function(String deviceName, String? deviceAddress)? bluetooth,
    required TResult orElse(),
  }) {
    if (file != null) {
      return file();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_File value) file,
    required TResult Function(_Usb value) usb,
    required TResult Function(_Network value) network,
    required TResult Function(_Bluetooth value) bluetooth,
  }) {
    return file(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_File value)? file,
    TResult? Function(_Usb value)? usb,
    TResult? Function(_Network value)? network,
    TResult? Function(_Bluetooth value)? bluetooth,
  }) {
    return file?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_File value)? file,
    TResult Function(_Usb value)? usb,
    TResult Function(_Network value)? network,
    TResult Function(_Bluetooth value)? bluetooth,
    required TResult orElse(),
  }) {
    if (file != null) {
      return file(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FileImplToJson(
      this,
    );
  }
}

abstract class _File implements PrintDestination {
  const factory _File() = _$FileImpl;

  factory _File.fromJson(Map<String, dynamic> json) = _$FileImpl.fromJson;
}

/// @nodoc
abstract class _$$UsbImplCopyWith<$Res> {
  factory _$$UsbImplCopyWith(_$UsbImpl value, $Res Function(_$UsbImpl) then) =
      __$$UsbImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UsbImplCopyWithImpl<$Res>
    extends _$PrintDestinationCopyWithImpl<$Res, _$UsbImpl>
    implements _$$UsbImplCopyWith<$Res> {
  __$$UsbImplCopyWithImpl(_$UsbImpl _value, $Res Function(_$UsbImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrintDestination
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$UsbImpl implements _Usb {
  const _$UsbImpl({final String? $type}) : $type = $type ?? 'usb';

  factory _$UsbImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsbImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PrintDestination.usb()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UsbImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() file,
    required TResult Function() usb,
    required TResult Function(String ipAddress, int? port) network,
    required TResult Function(String deviceName, String? deviceAddress)
        bluetooth,
  }) {
    return usb();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? file,
    TResult? Function()? usb,
    TResult? Function(String ipAddress, int? port)? network,
    TResult? Function(String deviceName, String? deviceAddress)? bluetooth,
  }) {
    return usb?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? file,
    TResult Function()? usb,
    TResult Function(String ipAddress, int? port)? network,
    TResult Function(String deviceName, String? deviceAddress)? bluetooth,
    required TResult orElse(),
  }) {
    if (usb != null) {
      return usb();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_File value) file,
    required TResult Function(_Usb value) usb,
    required TResult Function(_Network value) network,
    required TResult Function(_Bluetooth value) bluetooth,
  }) {
    return usb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_File value)? file,
    TResult? Function(_Usb value)? usb,
    TResult? Function(_Network value)? network,
    TResult? Function(_Bluetooth value)? bluetooth,
  }) {
    return usb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_File value)? file,
    TResult Function(_Usb value)? usb,
    TResult Function(_Network value)? network,
    TResult Function(_Bluetooth value)? bluetooth,
    required TResult orElse(),
  }) {
    if (usb != null) {
      return usb(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UsbImplToJson(
      this,
    );
  }
}

abstract class _Usb implements PrintDestination {
  const factory _Usb() = _$UsbImpl;

  factory _Usb.fromJson(Map<String, dynamic> json) = _$UsbImpl.fromJson;
}

/// @nodoc
abstract class _$$NetworkImplCopyWith<$Res> {
  factory _$$NetworkImplCopyWith(
          _$NetworkImpl value, $Res Function(_$NetworkImpl) then) =
      __$$NetworkImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String ipAddress, int? port});
}

/// @nodoc
class __$$NetworkImplCopyWithImpl<$Res>
    extends _$PrintDestinationCopyWithImpl<$Res, _$NetworkImpl>
    implements _$$NetworkImplCopyWith<$Res> {
  __$$NetworkImplCopyWithImpl(
      _$NetworkImpl _value, $Res Function(_$NetworkImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrintDestination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ipAddress = null,
    Object? port = freezed,
  }) {
    return _then(_$NetworkImpl(
      ipAddress: null == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      port: freezed == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NetworkImpl implements _Network {
  const _$NetworkImpl({required this.ipAddress, this.port, final String? $type})
      : $type = $type ?? 'network';

  factory _$NetworkImpl.fromJson(Map<String, dynamic> json) =>
      _$$NetworkImplFromJson(json);

  @override
  final String ipAddress;
  @override
  final int? port;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PrintDestination.network(ipAddress: $ipAddress, port: $port)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkImpl &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.port, port) || other.port == port));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ipAddress, port);

  /// Create a copy of PrintDestination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkImplCopyWith<_$NetworkImpl> get copyWith =>
      __$$NetworkImplCopyWithImpl<_$NetworkImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() file,
    required TResult Function() usb,
    required TResult Function(String ipAddress, int? port) network,
    required TResult Function(String deviceName, String? deviceAddress)
        bluetooth,
  }) {
    return network(ipAddress, port);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? file,
    TResult? Function()? usb,
    TResult? Function(String ipAddress, int? port)? network,
    TResult? Function(String deviceName, String? deviceAddress)? bluetooth,
  }) {
    return network?.call(ipAddress, port);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? file,
    TResult Function()? usb,
    TResult Function(String ipAddress, int? port)? network,
    TResult Function(String deviceName, String? deviceAddress)? bluetooth,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(ipAddress, port);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_File value) file,
    required TResult Function(_Usb value) usb,
    required TResult Function(_Network value) network,
    required TResult Function(_Bluetooth value) bluetooth,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_File value)? file,
    TResult? Function(_Usb value)? usb,
    TResult? Function(_Network value)? network,
    TResult? Function(_Bluetooth value)? bluetooth,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_File value)? file,
    TResult Function(_Usb value)? usb,
    TResult Function(_Network value)? network,
    TResult Function(_Bluetooth value)? bluetooth,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NetworkImplToJson(
      this,
    );
  }
}

abstract class _Network implements PrintDestination {
  const factory _Network({required final String ipAddress, final int? port}) =
      _$NetworkImpl;

  factory _Network.fromJson(Map<String, dynamic> json) = _$NetworkImpl.fromJson;

  String get ipAddress;
  int? get port;

  /// Create a copy of PrintDestination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkImplCopyWith<_$NetworkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BluetoothImplCopyWith<$Res> {
  factory _$$BluetoothImplCopyWith(
          _$BluetoothImpl value, $Res Function(_$BluetoothImpl) then) =
      __$$BluetoothImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String deviceName, String? deviceAddress});
}

/// @nodoc
class __$$BluetoothImplCopyWithImpl<$Res>
    extends _$PrintDestinationCopyWithImpl<$Res, _$BluetoothImpl>
    implements _$$BluetoothImplCopyWith<$Res> {
  __$$BluetoothImplCopyWithImpl(
      _$BluetoothImpl _value, $Res Function(_$BluetoothImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrintDestination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceName = null,
    Object? deviceAddress = freezed,
  }) {
    return _then(_$BluetoothImpl(
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      deviceAddress: freezed == deviceAddress
          ? _value.deviceAddress
          : deviceAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BluetoothImpl implements _Bluetooth {
  const _$BluetoothImpl(
      {required this.deviceName, this.deviceAddress, final String? $type})
      : $type = $type ?? 'bluetooth';

  factory _$BluetoothImpl.fromJson(Map<String, dynamic> json) =>
      _$$BluetoothImplFromJson(json);

  @override
  final String deviceName;
  @override
  final String? deviceAddress;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PrintDestination.bluetooth(deviceName: $deviceName, deviceAddress: $deviceAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BluetoothImpl &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.deviceAddress, deviceAddress) ||
                other.deviceAddress == deviceAddress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, deviceName, deviceAddress);

  /// Create a copy of PrintDestination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BluetoothImplCopyWith<_$BluetoothImpl> get copyWith =>
      __$$BluetoothImplCopyWithImpl<_$BluetoothImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() file,
    required TResult Function() usb,
    required TResult Function(String ipAddress, int? port) network,
    required TResult Function(String deviceName, String? deviceAddress)
        bluetooth,
  }) {
    return bluetooth(deviceName, deviceAddress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? file,
    TResult? Function()? usb,
    TResult? Function(String ipAddress, int? port)? network,
    TResult? Function(String deviceName, String? deviceAddress)? bluetooth,
  }) {
    return bluetooth?.call(deviceName, deviceAddress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? file,
    TResult Function()? usb,
    TResult Function(String ipAddress, int? port)? network,
    TResult Function(String deviceName, String? deviceAddress)? bluetooth,
    required TResult orElse(),
  }) {
    if (bluetooth != null) {
      return bluetooth(deviceName, deviceAddress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_File value) file,
    required TResult Function(_Usb value) usb,
    required TResult Function(_Network value) network,
    required TResult Function(_Bluetooth value) bluetooth,
  }) {
    return bluetooth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_File value)? file,
    TResult? Function(_Usb value)? usb,
    TResult? Function(_Network value)? network,
    TResult? Function(_Bluetooth value)? bluetooth,
  }) {
    return bluetooth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_File value)? file,
    TResult Function(_Usb value)? usb,
    TResult Function(_Network value)? network,
    TResult Function(_Bluetooth value)? bluetooth,
    required TResult orElse(),
  }) {
    if (bluetooth != null) {
      return bluetooth(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BluetoothImplToJson(
      this,
    );
  }
}

abstract class _Bluetooth implements PrintDestination {
  const factory _Bluetooth(
      {required final String deviceName,
      final String? deviceAddress}) = _$BluetoothImpl;

  factory _Bluetooth.fromJson(Map<String, dynamic> json) =
      _$BluetoothImpl.fromJson;

  String get deviceName;
  String? get deviceAddress;

  /// Create a copy of PrintDestination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BluetoothImplCopyWith<_$BluetoothImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
