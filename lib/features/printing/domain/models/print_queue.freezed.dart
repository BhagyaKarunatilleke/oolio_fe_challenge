// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'print_queue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrintQueue _$PrintQueueFromJson(Map<String, dynamic> json) {
  return _PrintQueue.fromJson(json);
}

/// @nodoc
mixin _$PrintQueue {
  @HiveField(0)
  List<PrintJob> get jobs => throw _privateConstructorUsedError;

  /// Serializes this PrintQueue to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrintQueue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrintQueueCopyWith<PrintQueue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrintQueueCopyWith<$Res> {
  factory $PrintQueueCopyWith(
          PrintQueue value, $Res Function(PrintQueue) then) =
      _$PrintQueueCopyWithImpl<$Res, PrintQueue>;
  @useResult
  $Res call({@HiveField(0) List<PrintJob> jobs});
}

/// @nodoc
class _$PrintQueueCopyWithImpl<$Res, $Val extends PrintQueue>
    implements $PrintQueueCopyWith<$Res> {
  _$PrintQueueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrintQueue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobs = null,
  }) {
    return _then(_value.copyWith(
      jobs: null == jobs
          ? _value.jobs
          : jobs // ignore: cast_nullable_to_non_nullable
              as List<PrintJob>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrintQueueImplCopyWith<$Res>
    implements $PrintQueueCopyWith<$Res> {
  factory _$$PrintQueueImplCopyWith(
          _$PrintQueueImpl value, $Res Function(_$PrintQueueImpl) then) =
      __$$PrintQueueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) List<PrintJob> jobs});
}

/// @nodoc
class __$$PrintQueueImplCopyWithImpl<$Res>
    extends _$PrintQueueCopyWithImpl<$Res, _$PrintQueueImpl>
    implements _$$PrintQueueImplCopyWith<$Res> {
  __$$PrintQueueImplCopyWithImpl(
      _$PrintQueueImpl _value, $Res Function(_$PrintQueueImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrintQueue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobs = null,
  }) {
    return _then(_$PrintQueueImpl(
      jobs: null == jobs
          ? _value._jobs
          : jobs // ignore: cast_nullable_to_non_nullable
              as List<PrintJob>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrintQueueImpl extends _PrintQueue {
  const _$PrintQueueImpl({@HiveField(0) final List<PrintJob> jobs = const []})
      : _jobs = jobs,
        super._();

  factory _$PrintQueueImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrintQueueImplFromJson(json);

  final List<PrintJob> _jobs;
  @override
  @JsonKey()
  @HiveField(0)
  List<PrintJob> get jobs {
    if (_jobs is EqualUnmodifiableListView) return _jobs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_jobs);
  }

  @override
  String toString() {
    return 'PrintQueue(jobs: $jobs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrintQueueImpl &&
            const DeepCollectionEquality().equals(other._jobs, _jobs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_jobs));

  /// Create a copy of PrintQueue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrintQueueImplCopyWith<_$PrintQueueImpl> get copyWith =>
      __$$PrintQueueImplCopyWithImpl<_$PrintQueueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrintQueueImplToJson(
      this,
    );
  }
}

abstract class _PrintQueue extends PrintQueue {
  const factory _PrintQueue({@HiveField(0) final List<PrintJob> jobs}) =
      _$PrintQueueImpl;
  const _PrintQueue._() : super._();

  factory _PrintQueue.fromJson(Map<String, dynamic> json) =
      _$PrintQueueImpl.fromJson;

  @override
  @HiveField(0)
  List<PrintJob> get jobs;

  /// Create a copy of PrintQueue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrintQueueImplCopyWith<_$PrintQueueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PrintQueueStats _$PrintQueueStatsFromJson(Map<String, dynamic> json) {
  return _PrintQueueStats.fromJson(json);
}

/// @nodoc
mixin _$PrintQueueStats {
  int get totalJobs => throw _privateConstructorUsedError;
  int get pendingJobs => throw _privateConstructorUsedError;
  int get processingJobs => throw _privateConstructorUsedError;
  int get completedJobs => throw _privateConstructorUsedError;
  int get failedJobs => throw _privateConstructorUsedError;
  int get cancelledJobs => throw _privateConstructorUsedError;

  /// Serializes this PrintQueueStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrintQueueStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrintQueueStatsCopyWith<PrintQueueStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrintQueueStatsCopyWith<$Res> {
  factory $PrintQueueStatsCopyWith(
          PrintQueueStats value, $Res Function(PrintQueueStats) then) =
      _$PrintQueueStatsCopyWithImpl<$Res, PrintQueueStats>;
  @useResult
  $Res call(
      {int totalJobs,
      int pendingJobs,
      int processingJobs,
      int completedJobs,
      int failedJobs,
      int cancelledJobs});
}

/// @nodoc
class _$PrintQueueStatsCopyWithImpl<$Res, $Val extends PrintQueueStats>
    implements $PrintQueueStatsCopyWith<$Res> {
  _$PrintQueueStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrintQueueStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalJobs = null,
    Object? pendingJobs = null,
    Object? processingJobs = null,
    Object? completedJobs = null,
    Object? failedJobs = null,
    Object? cancelledJobs = null,
  }) {
    return _then(_value.copyWith(
      totalJobs: null == totalJobs
          ? _value.totalJobs
          : totalJobs // ignore: cast_nullable_to_non_nullable
              as int,
      pendingJobs: null == pendingJobs
          ? _value.pendingJobs
          : pendingJobs // ignore: cast_nullable_to_non_nullable
              as int,
      processingJobs: null == processingJobs
          ? _value.processingJobs
          : processingJobs // ignore: cast_nullable_to_non_nullable
              as int,
      completedJobs: null == completedJobs
          ? _value.completedJobs
          : completedJobs // ignore: cast_nullable_to_non_nullable
              as int,
      failedJobs: null == failedJobs
          ? _value.failedJobs
          : failedJobs // ignore: cast_nullable_to_non_nullable
              as int,
      cancelledJobs: null == cancelledJobs
          ? _value.cancelledJobs
          : cancelledJobs // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrintQueueStatsImplCopyWith<$Res>
    implements $PrintQueueStatsCopyWith<$Res> {
  factory _$$PrintQueueStatsImplCopyWith(_$PrintQueueStatsImpl value,
          $Res Function(_$PrintQueueStatsImpl) then) =
      __$$PrintQueueStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalJobs,
      int pendingJobs,
      int processingJobs,
      int completedJobs,
      int failedJobs,
      int cancelledJobs});
}

/// @nodoc
class __$$PrintQueueStatsImplCopyWithImpl<$Res>
    extends _$PrintQueueStatsCopyWithImpl<$Res, _$PrintQueueStatsImpl>
    implements _$$PrintQueueStatsImplCopyWith<$Res> {
  __$$PrintQueueStatsImplCopyWithImpl(
      _$PrintQueueStatsImpl _value, $Res Function(_$PrintQueueStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrintQueueStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalJobs = null,
    Object? pendingJobs = null,
    Object? processingJobs = null,
    Object? completedJobs = null,
    Object? failedJobs = null,
    Object? cancelledJobs = null,
  }) {
    return _then(_$PrintQueueStatsImpl(
      totalJobs: null == totalJobs
          ? _value.totalJobs
          : totalJobs // ignore: cast_nullable_to_non_nullable
              as int,
      pendingJobs: null == pendingJobs
          ? _value.pendingJobs
          : pendingJobs // ignore: cast_nullable_to_non_nullable
              as int,
      processingJobs: null == processingJobs
          ? _value.processingJobs
          : processingJobs // ignore: cast_nullable_to_non_nullable
              as int,
      completedJobs: null == completedJobs
          ? _value.completedJobs
          : completedJobs // ignore: cast_nullable_to_non_nullable
              as int,
      failedJobs: null == failedJobs
          ? _value.failedJobs
          : failedJobs // ignore: cast_nullable_to_non_nullable
              as int,
      cancelledJobs: null == cancelledJobs
          ? _value.cancelledJobs
          : cancelledJobs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrintQueueStatsImpl implements _PrintQueueStats {
  const _$PrintQueueStatsImpl(
      {this.totalJobs = 0,
      this.pendingJobs = 0,
      this.processingJobs = 0,
      this.completedJobs = 0,
      this.failedJobs = 0,
      this.cancelledJobs = 0});

  factory _$PrintQueueStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrintQueueStatsImplFromJson(json);

  @override
  @JsonKey()
  final int totalJobs;
  @override
  @JsonKey()
  final int pendingJobs;
  @override
  @JsonKey()
  final int processingJobs;
  @override
  @JsonKey()
  final int completedJobs;
  @override
  @JsonKey()
  final int failedJobs;
  @override
  @JsonKey()
  final int cancelledJobs;

  @override
  String toString() {
    return 'PrintQueueStats(totalJobs: $totalJobs, pendingJobs: $pendingJobs, processingJobs: $processingJobs, completedJobs: $completedJobs, failedJobs: $failedJobs, cancelledJobs: $cancelledJobs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrintQueueStatsImpl &&
            (identical(other.totalJobs, totalJobs) ||
                other.totalJobs == totalJobs) &&
            (identical(other.pendingJobs, pendingJobs) ||
                other.pendingJobs == pendingJobs) &&
            (identical(other.processingJobs, processingJobs) ||
                other.processingJobs == processingJobs) &&
            (identical(other.completedJobs, completedJobs) ||
                other.completedJobs == completedJobs) &&
            (identical(other.failedJobs, failedJobs) ||
                other.failedJobs == failedJobs) &&
            (identical(other.cancelledJobs, cancelledJobs) ||
                other.cancelledJobs == cancelledJobs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalJobs, pendingJobs,
      processingJobs, completedJobs, failedJobs, cancelledJobs);

  /// Create a copy of PrintQueueStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrintQueueStatsImplCopyWith<_$PrintQueueStatsImpl> get copyWith =>
      __$$PrintQueueStatsImplCopyWithImpl<_$PrintQueueStatsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrintQueueStatsImplToJson(
      this,
    );
  }
}

abstract class _PrintQueueStats implements PrintQueueStats {
  const factory _PrintQueueStats(
      {final int totalJobs,
      final int pendingJobs,
      final int processingJobs,
      final int completedJobs,
      final int failedJobs,
      final int cancelledJobs}) = _$PrintQueueStatsImpl;

  factory _PrintQueueStats.fromJson(Map<String, dynamic> json) =
      _$PrintQueueStatsImpl.fromJson;

  @override
  int get totalJobs;
  @override
  int get pendingJobs;
  @override
  int get processingJobs;
  @override
  int get completedJobs;
  @override
  int get failedJobs;
  @override
  int get cancelledJobs;

  /// Create a copy of PrintQueueStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrintQueueStatsImplCopyWith<_$PrintQueueStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
