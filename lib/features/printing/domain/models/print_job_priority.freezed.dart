// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'print_job_priority.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrintJobPriority _$PrintJobPriorityFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'low':
      return _Low.fromJson(json);
    case 'normal':
      return _Normal.fromJson(json);
    case 'high':
      return _High.fromJson(json);
    case 'urgent':
      return _Urgent.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'PrintJobPriority',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$PrintJobPriority {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() low,
    required TResult Function() normal,
    required TResult Function() high,
    required TResult Function() urgent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? low,
    TResult? Function()? normal,
    TResult? Function()? high,
    TResult? Function()? urgent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? low,
    TResult Function()? normal,
    TResult Function()? high,
    TResult Function()? urgent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Low value) low,
    required TResult Function(_Normal value) normal,
    required TResult Function(_High value) high,
    required TResult Function(_Urgent value) urgent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Low value)? low,
    TResult? Function(_Normal value)? normal,
    TResult? Function(_High value)? high,
    TResult? Function(_Urgent value)? urgent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Low value)? low,
    TResult Function(_Normal value)? normal,
    TResult Function(_High value)? high,
    TResult Function(_Urgent value)? urgent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this PrintJobPriority to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrintJobPriorityCopyWith<$Res> {
  factory $PrintJobPriorityCopyWith(
          PrintJobPriority value, $Res Function(PrintJobPriority) then) =
      _$PrintJobPriorityCopyWithImpl<$Res, PrintJobPriority>;
}

/// @nodoc
class _$PrintJobPriorityCopyWithImpl<$Res, $Val extends PrintJobPriority>
    implements $PrintJobPriorityCopyWith<$Res> {
  _$PrintJobPriorityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrintJobPriority
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LowImplCopyWith<$Res> {
  factory _$$LowImplCopyWith(_$LowImpl value, $Res Function(_$LowImpl) then) =
      __$$LowImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LowImplCopyWithImpl<$Res>
    extends _$PrintJobPriorityCopyWithImpl<$Res, _$LowImpl>
    implements _$$LowImplCopyWith<$Res> {
  __$$LowImplCopyWithImpl(_$LowImpl _value, $Res Function(_$LowImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrintJobPriority
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$LowImpl implements _Low {
  const _$LowImpl({final String? $type}) : $type = $type ?? 'low';

  factory _$LowImpl.fromJson(Map<String, dynamic> json) =>
      _$$LowImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PrintJobPriority.low()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LowImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() low,
    required TResult Function() normal,
    required TResult Function() high,
    required TResult Function() urgent,
  }) {
    return low();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? low,
    TResult? Function()? normal,
    TResult? Function()? high,
    TResult? Function()? urgent,
  }) {
    return low?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? low,
    TResult Function()? normal,
    TResult Function()? high,
    TResult Function()? urgent,
    required TResult orElse(),
  }) {
    if (low != null) {
      return low();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Low value) low,
    required TResult Function(_Normal value) normal,
    required TResult Function(_High value) high,
    required TResult Function(_Urgent value) urgent,
  }) {
    return low(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Low value)? low,
    TResult? Function(_Normal value)? normal,
    TResult? Function(_High value)? high,
    TResult? Function(_Urgent value)? urgent,
  }) {
    return low?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Low value)? low,
    TResult Function(_Normal value)? normal,
    TResult Function(_High value)? high,
    TResult Function(_Urgent value)? urgent,
    required TResult orElse(),
  }) {
    if (low != null) {
      return low(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LowImplToJson(
      this,
    );
  }
}

abstract class _Low implements PrintJobPriority {
  const factory _Low() = _$LowImpl;

  factory _Low.fromJson(Map<String, dynamic> json) = _$LowImpl.fromJson;
}

/// @nodoc
abstract class _$$NormalImplCopyWith<$Res> {
  factory _$$NormalImplCopyWith(
          _$NormalImpl value, $Res Function(_$NormalImpl) then) =
      __$$NormalImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NormalImplCopyWithImpl<$Res>
    extends _$PrintJobPriorityCopyWithImpl<$Res, _$NormalImpl>
    implements _$$NormalImplCopyWith<$Res> {
  __$$NormalImplCopyWithImpl(
      _$NormalImpl _value, $Res Function(_$NormalImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrintJobPriority
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$NormalImpl implements _Normal {
  const _$NormalImpl({final String? $type}) : $type = $type ?? 'normal';

  factory _$NormalImpl.fromJson(Map<String, dynamic> json) =>
      _$$NormalImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PrintJobPriority.normal()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NormalImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() low,
    required TResult Function() normal,
    required TResult Function() high,
    required TResult Function() urgent,
  }) {
    return normal();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? low,
    TResult? Function()? normal,
    TResult? Function()? high,
    TResult? Function()? urgent,
  }) {
    return normal?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? low,
    TResult Function()? normal,
    TResult Function()? high,
    TResult Function()? urgent,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Low value) low,
    required TResult Function(_Normal value) normal,
    required TResult Function(_High value) high,
    required TResult Function(_Urgent value) urgent,
  }) {
    return normal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Low value)? low,
    TResult? Function(_Normal value)? normal,
    TResult? Function(_High value)? high,
    TResult? Function(_Urgent value)? urgent,
  }) {
    return normal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Low value)? low,
    TResult Function(_Normal value)? normal,
    TResult Function(_High value)? high,
    TResult Function(_Urgent value)? urgent,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NormalImplToJson(
      this,
    );
  }
}

abstract class _Normal implements PrintJobPriority {
  const factory _Normal() = _$NormalImpl;

  factory _Normal.fromJson(Map<String, dynamic> json) = _$NormalImpl.fromJson;
}

/// @nodoc
abstract class _$$HighImplCopyWith<$Res> {
  factory _$$HighImplCopyWith(
          _$HighImpl value, $Res Function(_$HighImpl) then) =
      __$$HighImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HighImplCopyWithImpl<$Res>
    extends _$PrintJobPriorityCopyWithImpl<$Res, _$HighImpl>
    implements _$$HighImplCopyWith<$Res> {
  __$$HighImplCopyWithImpl(_$HighImpl _value, $Res Function(_$HighImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrintJobPriority
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$HighImpl implements _High {
  const _$HighImpl({final String? $type}) : $type = $type ?? 'high';

  factory _$HighImpl.fromJson(Map<String, dynamic> json) =>
      _$$HighImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PrintJobPriority.high()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HighImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() low,
    required TResult Function() normal,
    required TResult Function() high,
    required TResult Function() urgent,
  }) {
    return high();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? low,
    TResult? Function()? normal,
    TResult? Function()? high,
    TResult? Function()? urgent,
  }) {
    return high?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? low,
    TResult Function()? normal,
    TResult Function()? high,
    TResult Function()? urgent,
    required TResult orElse(),
  }) {
    if (high != null) {
      return high();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Low value) low,
    required TResult Function(_Normal value) normal,
    required TResult Function(_High value) high,
    required TResult Function(_Urgent value) urgent,
  }) {
    return high(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Low value)? low,
    TResult? Function(_Normal value)? normal,
    TResult? Function(_High value)? high,
    TResult? Function(_Urgent value)? urgent,
  }) {
    return high?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Low value)? low,
    TResult Function(_Normal value)? normal,
    TResult Function(_High value)? high,
    TResult Function(_Urgent value)? urgent,
    required TResult orElse(),
  }) {
    if (high != null) {
      return high(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$HighImplToJson(
      this,
    );
  }
}

abstract class _High implements PrintJobPriority {
  const factory _High() = _$HighImpl;

  factory _High.fromJson(Map<String, dynamic> json) = _$HighImpl.fromJson;
}

/// @nodoc
abstract class _$$UrgentImplCopyWith<$Res> {
  factory _$$UrgentImplCopyWith(
          _$UrgentImpl value, $Res Function(_$UrgentImpl) then) =
      __$$UrgentImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UrgentImplCopyWithImpl<$Res>
    extends _$PrintJobPriorityCopyWithImpl<$Res, _$UrgentImpl>
    implements _$$UrgentImplCopyWith<$Res> {
  __$$UrgentImplCopyWithImpl(
      _$UrgentImpl _value, $Res Function(_$UrgentImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrintJobPriority
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$UrgentImpl implements _Urgent {
  const _$UrgentImpl({final String? $type}) : $type = $type ?? 'urgent';

  factory _$UrgentImpl.fromJson(Map<String, dynamic> json) =>
      _$$UrgentImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PrintJobPriority.urgent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UrgentImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() low,
    required TResult Function() normal,
    required TResult Function() high,
    required TResult Function() urgent,
  }) {
    return urgent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? low,
    TResult? Function()? normal,
    TResult? Function()? high,
    TResult? Function()? urgent,
  }) {
    return urgent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? low,
    TResult Function()? normal,
    TResult Function()? high,
    TResult Function()? urgent,
    required TResult orElse(),
  }) {
    if (urgent != null) {
      return urgent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Low value) low,
    required TResult Function(_Normal value) normal,
    required TResult Function(_High value) high,
    required TResult Function(_Urgent value) urgent,
  }) {
    return urgent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Low value)? low,
    TResult? Function(_Normal value)? normal,
    TResult? Function(_High value)? high,
    TResult? Function(_Urgent value)? urgent,
  }) {
    return urgent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Low value)? low,
    TResult Function(_Normal value)? normal,
    TResult Function(_High value)? high,
    TResult Function(_Urgent value)? urgent,
    required TResult orElse(),
  }) {
    if (urgent != null) {
      return urgent(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UrgentImplToJson(
      this,
    );
  }
}

abstract class _Urgent implements PrintJobPriority {
  const factory _Urgent() = _$UrgentImpl;

  factory _Urgent.fromJson(Map<String, dynamic> json) = _$UrgentImpl.fromJson;
}
