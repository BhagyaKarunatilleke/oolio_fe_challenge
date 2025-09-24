// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'print_job.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrintJob _$PrintJobFromJson(Map<String, dynamic> json) {
  return _PrintJob.fromJson(json);
}

/// @nodoc
mixin _$PrintJob {
  String get id => throw _privateConstructorUsedError;
  PrintDestination get destination => throw _privateConstructorUsedError;
  PrintJobPriority get priority => throw _privateConstructorUsedError;
  PrintJobStatus get status => throw _privateConstructorUsedError;
  String get receiptData => throw _privateConstructorUsedError; // JSON string
  int get retryCount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  List<int>? get escPosBytes => throw _privateConstructorUsedError;

  /// Serializes this PrintJob to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrintJob
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrintJobCopyWith<PrintJob> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrintJobCopyWith<$Res> {
  factory $PrintJobCopyWith(PrintJob value, $Res Function(PrintJob) then) =
      _$PrintJobCopyWithImpl<$Res, PrintJob>;
  @useResult
  $Res call(
      {String id,
      PrintDestination destination,
      PrintJobPriority priority,
      PrintJobStatus status,
      String receiptData,
      int retryCount,
      DateTime createdAt,
      DateTime? startedAt,
      DateTime? completedAt,
      List<int>? escPosBytes});

  $PrintDestinationCopyWith<$Res> get destination;
  $PrintJobPriorityCopyWith<$Res> get priority;
  $PrintJobStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$PrintJobCopyWithImpl<$Res, $Val extends PrintJob>
    implements $PrintJobCopyWith<$Res> {
  _$PrintJobCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrintJob
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? destination = null,
    Object? priority = null,
    Object? status = null,
    Object? receiptData = null,
    Object? retryCount = null,
    Object? createdAt = null,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? escPosBytes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as PrintDestination,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as PrintJobPriority,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PrintJobStatus,
      receiptData: null == receiptData
          ? _value.receiptData
          : receiptData // ignore: cast_nullable_to_non_nullable
              as String,
      retryCount: null == retryCount
          ? _value.retryCount
          : retryCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      escPosBytes: freezed == escPosBytes
          ? _value.escPosBytes
          : escPosBytes // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }

  /// Create a copy of PrintJob
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrintDestinationCopyWith<$Res> get destination {
    return $PrintDestinationCopyWith<$Res>(_value.destination, (value) {
      return _then(_value.copyWith(destination: value) as $Val);
    });
  }

  /// Create a copy of PrintJob
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrintJobPriorityCopyWith<$Res> get priority {
    return $PrintJobPriorityCopyWith<$Res>(_value.priority, (value) {
      return _then(_value.copyWith(priority: value) as $Val);
    });
  }

  /// Create a copy of PrintJob
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrintJobStatusCopyWith<$Res> get status {
    return $PrintJobStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PrintJobImplCopyWith<$Res>
    implements $PrintJobCopyWith<$Res> {
  factory _$$PrintJobImplCopyWith(
          _$PrintJobImpl value, $Res Function(_$PrintJobImpl) then) =
      __$$PrintJobImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      PrintDestination destination,
      PrintJobPriority priority,
      PrintJobStatus status,
      String receiptData,
      int retryCount,
      DateTime createdAt,
      DateTime? startedAt,
      DateTime? completedAt,
      List<int>? escPosBytes});

  @override
  $PrintDestinationCopyWith<$Res> get destination;
  @override
  $PrintJobPriorityCopyWith<$Res> get priority;
  @override
  $PrintJobStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$PrintJobImplCopyWithImpl<$Res>
    extends _$PrintJobCopyWithImpl<$Res, _$PrintJobImpl>
    implements _$$PrintJobImplCopyWith<$Res> {
  __$$PrintJobImplCopyWithImpl(
      _$PrintJobImpl _value, $Res Function(_$PrintJobImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrintJob
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? destination = null,
    Object? priority = null,
    Object? status = null,
    Object? receiptData = null,
    Object? retryCount = null,
    Object? createdAt = null,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? escPosBytes = freezed,
  }) {
    return _then(_$PrintJobImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as PrintDestination,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as PrintJobPriority,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PrintJobStatus,
      receiptData: null == receiptData
          ? _value.receiptData
          : receiptData // ignore: cast_nullable_to_non_nullable
              as String,
      retryCount: null == retryCount
          ? _value.retryCount
          : retryCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      escPosBytes: freezed == escPosBytes
          ? _value._escPosBytes
          : escPosBytes // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrintJobImpl implements _PrintJob {
  const _$PrintJobImpl(
      {required this.id,
      required this.destination,
      required this.priority,
      required this.status,
      required this.receiptData,
      this.retryCount = 0,
      required this.createdAt,
      this.startedAt,
      this.completedAt,
      final List<int>? escPosBytes})
      : _escPosBytes = escPosBytes;

  factory _$PrintJobImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrintJobImplFromJson(json);

  @override
  final String id;
  @override
  final PrintDestination destination;
  @override
  final PrintJobPriority priority;
  @override
  final PrintJobStatus status;
  @override
  final String receiptData;
// JSON string
  @override
  @JsonKey()
  final int retryCount;
  @override
  final DateTime createdAt;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? completedAt;
  final List<int>? _escPosBytes;
  @override
  List<int>? get escPosBytes {
    final value = _escPosBytes;
    if (value == null) return null;
    if (_escPosBytes is EqualUnmodifiableListView) return _escPosBytes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PrintJob(id: $id, destination: $destination, priority: $priority, status: $status, receiptData: $receiptData, retryCount: $retryCount, createdAt: $createdAt, startedAt: $startedAt, completedAt: $completedAt, escPosBytes: $escPosBytes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrintJobImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.receiptData, receiptData) ||
                other.receiptData == receiptData) &&
            (identical(other.retryCount, retryCount) ||
                other.retryCount == retryCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            const DeepCollectionEquality()
                .equals(other._escPosBytes, _escPosBytes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      destination,
      priority,
      status,
      receiptData,
      retryCount,
      createdAt,
      startedAt,
      completedAt,
      const DeepCollectionEquality().hash(_escPosBytes));

  /// Create a copy of PrintJob
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrintJobImplCopyWith<_$PrintJobImpl> get copyWith =>
      __$$PrintJobImplCopyWithImpl<_$PrintJobImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrintJobImplToJson(
      this,
    );
  }
}

abstract class _PrintJob implements PrintJob {
  const factory _PrintJob(
      {required final String id,
      required final PrintDestination destination,
      required final PrintJobPriority priority,
      required final PrintJobStatus status,
      required final String receiptData,
      final int retryCount,
      required final DateTime createdAt,
      final DateTime? startedAt,
      final DateTime? completedAt,
      final List<int>? escPosBytes}) = _$PrintJobImpl;

  factory _PrintJob.fromJson(Map<String, dynamic> json) =
      _$PrintJobImpl.fromJson;

  @override
  String get id;
  @override
  PrintDestination get destination;
  @override
  PrintJobPriority get priority;
  @override
  PrintJobStatus get status;
  @override
  String get receiptData; // JSON string
  @override
  int get retryCount;
  @override
  DateTime get createdAt;
  @override
  DateTime? get startedAt;
  @override
  DateTime? get completedAt;
  @override
  List<int>? get escPosBytes;

  /// Create a copy of PrintJob
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrintJobImplCopyWith<_$PrintJobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
