// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'print_job_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrintJobStatus _$PrintJobStatusFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'pending':
      return _Pending.fromJson(json);
    case 'processing':
      return _Processing.fromJson(json);
    case 'completed':
      return _Completed.fromJson(json);
    case 'failed':
      return _Failed.fromJson(json);
    case 'cancelled':
      return _Cancelled.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'PrintJobStatus',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$PrintJobStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() processing,
    required TResult Function() completed,
    required TResult Function(String errorMessage, DateTime? failedAt) failed,
    required TResult Function() cancelled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? processing,
    TResult? Function()? completed,
    TResult? Function(String errorMessage, DateTime? failedAt)? failed,
    TResult? Function()? cancelled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? processing,
    TResult Function()? completed,
    TResult Function(String errorMessage, DateTime? failedAt)? failed,
    TResult Function()? cancelled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Pending value) pending,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Cancelled value) cancelled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Cancelled value)? cancelled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Pending value)? pending,
    TResult Function(_Processing value)? processing,
    TResult Function(_Completed value)? completed,
    TResult Function(_Failed value)? failed,
    TResult Function(_Cancelled value)? cancelled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this PrintJobStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrintJobStatusCopyWith<$Res> {
  factory $PrintJobStatusCopyWith(
          PrintJobStatus value, $Res Function(PrintJobStatus) then) =
      _$PrintJobStatusCopyWithImpl<$Res, PrintJobStatus>;
}

/// @nodoc
class _$PrintJobStatusCopyWithImpl<$Res, $Val extends PrintJobStatus>
    implements $PrintJobStatusCopyWith<$Res> {
  _$PrintJobStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrintJobStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PendingImplCopyWith<$Res> {
  factory _$$PendingImplCopyWith(
          _$PendingImpl value, $Res Function(_$PendingImpl) then) =
      __$$PendingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PendingImplCopyWithImpl<$Res>
    extends _$PrintJobStatusCopyWithImpl<$Res, _$PendingImpl>
    implements _$$PendingImplCopyWith<$Res> {
  __$$PendingImplCopyWithImpl(
      _$PendingImpl _value, $Res Function(_$PendingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrintJobStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$PendingImpl implements _Pending {
  const _$PendingImpl({final String? $type}) : $type = $type ?? 'pending';

  factory _$PendingImpl.fromJson(Map<String, dynamic> json) =>
      _$$PendingImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PrintJobStatus.pending()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PendingImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() processing,
    required TResult Function() completed,
    required TResult Function(String errorMessage, DateTime? failedAt) failed,
    required TResult Function() cancelled,
  }) {
    return pending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? processing,
    TResult? Function()? completed,
    TResult? Function(String errorMessage, DateTime? failedAt)? failed,
    TResult? Function()? cancelled,
  }) {
    return pending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? processing,
    TResult Function()? completed,
    TResult Function(String errorMessage, DateTime? failedAt)? failed,
    TResult Function()? cancelled,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Pending value) pending,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Cancelled value) cancelled,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Cancelled value)? cancelled,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Pending value)? pending,
    TResult Function(_Processing value)? processing,
    TResult Function(_Completed value)? completed,
    TResult Function(_Failed value)? failed,
    TResult Function(_Cancelled value)? cancelled,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PendingImplToJson(
      this,
    );
  }
}

abstract class _Pending implements PrintJobStatus {
  const factory _Pending() = _$PendingImpl;

  factory _Pending.fromJson(Map<String, dynamic> json) = _$PendingImpl.fromJson;
}

/// @nodoc
abstract class _$$ProcessingImplCopyWith<$Res> {
  factory _$$ProcessingImplCopyWith(
          _$ProcessingImpl value, $Res Function(_$ProcessingImpl) then) =
      __$$ProcessingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcessingImplCopyWithImpl<$Res>
    extends _$PrintJobStatusCopyWithImpl<$Res, _$ProcessingImpl>
    implements _$$ProcessingImplCopyWith<$Res> {
  __$$ProcessingImplCopyWithImpl(
      _$ProcessingImpl _value, $Res Function(_$ProcessingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrintJobStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ProcessingImpl implements _Processing {
  const _$ProcessingImpl({final String? $type}) : $type = $type ?? 'processing';

  factory _$ProcessingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProcessingImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PrintJobStatus.processing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProcessingImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() processing,
    required TResult Function() completed,
    required TResult Function(String errorMessage, DateTime? failedAt) failed,
    required TResult Function() cancelled,
  }) {
    return processing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? processing,
    TResult? Function()? completed,
    TResult? Function(String errorMessage, DateTime? failedAt)? failed,
    TResult? Function()? cancelled,
  }) {
    return processing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? processing,
    TResult Function()? completed,
    TResult Function(String errorMessage, DateTime? failedAt)? failed,
    TResult Function()? cancelled,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Pending value) pending,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Cancelled value) cancelled,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Cancelled value)? cancelled,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Pending value)? pending,
    TResult Function(_Processing value)? processing,
    TResult Function(_Completed value)? completed,
    TResult Function(_Failed value)? failed,
    TResult Function(_Cancelled value)? cancelled,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessingImplToJson(
      this,
    );
  }
}

abstract class _Processing implements PrintJobStatus {
  const factory _Processing() = _$ProcessingImpl;

  factory _Processing.fromJson(Map<String, dynamic> json) =
      _$ProcessingImpl.fromJson;
}

/// @nodoc
abstract class _$$CompletedImplCopyWith<$Res> {
  factory _$$CompletedImplCopyWith(
          _$CompletedImpl value, $Res Function(_$CompletedImpl) then) =
      __$$CompletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CompletedImplCopyWithImpl<$Res>
    extends _$PrintJobStatusCopyWithImpl<$Res, _$CompletedImpl>
    implements _$$CompletedImplCopyWith<$Res> {
  __$$CompletedImplCopyWithImpl(
      _$CompletedImpl _value, $Res Function(_$CompletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrintJobStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$CompletedImpl implements _Completed {
  const _$CompletedImpl({final String? $type}) : $type = $type ?? 'completed';

  factory _$CompletedImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompletedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PrintJobStatus.completed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CompletedImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() processing,
    required TResult Function() completed,
    required TResult Function(String errorMessage, DateTime? failedAt) failed,
    required TResult Function() cancelled,
  }) {
    return completed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? processing,
    TResult? Function()? completed,
    TResult? Function(String errorMessage, DateTime? failedAt)? failed,
    TResult? Function()? cancelled,
  }) {
    return completed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? processing,
    TResult Function()? completed,
    TResult Function(String errorMessage, DateTime? failedAt)? failed,
    TResult Function()? cancelled,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Pending value) pending,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Cancelled value) cancelled,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Cancelled value)? cancelled,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Pending value)? pending,
    TResult Function(_Processing value)? processing,
    TResult Function(_Completed value)? completed,
    TResult Function(_Failed value)? failed,
    TResult Function(_Cancelled value)? cancelled,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CompletedImplToJson(
      this,
    );
  }
}

abstract class _Completed implements PrintJobStatus {
  const factory _Completed() = _$CompletedImpl;

  factory _Completed.fromJson(Map<String, dynamic> json) =
      _$CompletedImpl.fromJson;
}

/// @nodoc
abstract class _$$FailedImplCopyWith<$Res> {
  factory _$$FailedImplCopyWith(
          _$FailedImpl value, $Res Function(_$FailedImpl) then) =
      __$$FailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage, DateTime? failedAt});
}

/// @nodoc
class __$$FailedImplCopyWithImpl<$Res>
    extends _$PrintJobStatusCopyWithImpl<$Res, _$FailedImpl>
    implements _$$FailedImplCopyWith<$Res> {
  __$$FailedImplCopyWithImpl(
      _$FailedImpl _value, $Res Function(_$FailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrintJobStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
    Object? failedAt = freezed,
  }) {
    return _then(_$FailedImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      failedAt: freezed == failedAt
          ? _value.failedAt
          : failedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FailedImpl implements _Failed {
  const _$FailedImpl(
      {required this.errorMessage, this.failedAt, final String? $type})
      : $type = $type ?? 'failed';

  factory _$FailedImpl.fromJson(Map<String, dynamic> json) =>
      _$$FailedImplFromJson(json);

  @override
  final String errorMessage;
  @override
  final DateTime? failedAt;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PrintJobStatus.failed(errorMessage: $errorMessage, failedAt: $failedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.failedAt, failedAt) ||
                other.failedAt == failedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, errorMessage, failedAt);

  /// Create a copy of PrintJobStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      __$$FailedImplCopyWithImpl<_$FailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() processing,
    required TResult Function() completed,
    required TResult Function(String errorMessage, DateTime? failedAt) failed,
    required TResult Function() cancelled,
  }) {
    return failed(errorMessage, failedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? processing,
    TResult? Function()? completed,
    TResult? Function(String errorMessage, DateTime? failedAt)? failed,
    TResult? Function()? cancelled,
  }) {
    return failed?.call(errorMessage, failedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? processing,
    TResult Function()? completed,
    TResult Function(String errorMessage, DateTime? failedAt)? failed,
    TResult Function()? cancelled,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(errorMessage, failedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Pending value) pending,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Cancelled value) cancelled,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Cancelled value)? cancelled,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Pending value)? pending,
    TResult Function(_Processing value)? processing,
    TResult Function(_Completed value)? completed,
    TResult Function(_Failed value)? failed,
    TResult Function(_Cancelled value)? cancelled,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FailedImplToJson(
      this,
    );
  }
}

abstract class _Failed implements PrintJobStatus {
  const factory _Failed(
      {required final String errorMessage,
      final DateTime? failedAt}) = _$FailedImpl;

  factory _Failed.fromJson(Map<String, dynamic> json) = _$FailedImpl.fromJson;

  String get errorMessage;
  DateTime? get failedAt;

  /// Create a copy of PrintJobStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelledImplCopyWith<$Res> {
  factory _$$CancelledImplCopyWith(
          _$CancelledImpl value, $Res Function(_$CancelledImpl) then) =
      __$$CancelledImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CancelledImplCopyWithImpl<$Res>
    extends _$PrintJobStatusCopyWithImpl<$Res, _$CancelledImpl>
    implements _$$CancelledImplCopyWith<$Res> {
  __$$CancelledImplCopyWithImpl(
      _$CancelledImpl _value, $Res Function(_$CancelledImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrintJobStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$CancelledImpl implements _Cancelled {
  const _$CancelledImpl({final String? $type}) : $type = $type ?? 'cancelled';

  factory _$CancelledImpl.fromJson(Map<String, dynamic> json) =>
      _$$CancelledImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PrintJobStatus.cancelled()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CancelledImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() processing,
    required TResult Function() completed,
    required TResult Function(String errorMessage, DateTime? failedAt) failed,
    required TResult Function() cancelled,
  }) {
    return cancelled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? processing,
    TResult? Function()? completed,
    TResult? Function(String errorMessage, DateTime? failedAt)? failed,
    TResult? Function()? cancelled,
  }) {
    return cancelled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? processing,
    TResult Function()? completed,
    TResult Function(String errorMessage, DateTime? failedAt)? failed,
    TResult Function()? cancelled,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Pending value) pending,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Failed value) failed,
    required TResult Function(_Cancelled value) cancelled,
  }) {
    return cancelled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Completed value)? completed,
    TResult? Function(_Failed value)? failed,
    TResult? Function(_Cancelled value)? cancelled,
  }) {
    return cancelled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Pending value)? pending,
    TResult Function(_Processing value)? processing,
    TResult Function(_Completed value)? completed,
    TResult Function(_Failed value)? failed,
    TResult Function(_Cancelled value)? cancelled,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CancelledImplToJson(
      this,
    );
  }
}

abstract class _Cancelled implements PrintJobStatus {
  const factory _Cancelled() = _$CancelledImpl;

  factory _Cancelled.fromJson(Map<String, dynamic> json) =
      _$CancelledImpl.fromJson;
}
