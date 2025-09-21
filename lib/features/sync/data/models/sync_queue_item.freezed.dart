// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_queue_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SyncQueueItem _$SyncQueueItemFromJson(Map<String, dynamic> json) {
  return _SyncQueueItem.fromJson(json);
}

/// @nodoc
mixin _$SyncQueueItem {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @HiveField(3)
  int get version => throw _privateConstructorUsedError;
  @HiveField(4)
  SyncStatus get syncStatus => throw _privateConstructorUsedError;
  @HiveField(5)
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  @HiveField(6)
  String get entityType => throw _privateConstructorUsedError;
  @HiveField(7)
  String get entityId => throw _privateConstructorUsedError;
  @HiveField(8)
  SyncOperation get operation => throw _privateConstructorUsedError;
  @HiveField(9)
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  @HiveField(10)
  int get retryCount => throw _privateConstructorUsedError;
  @HiveField(11)
  DateTime? get lastRetryAt => throw _privateConstructorUsedError;
  @HiveField(12)
  String? get errorMessage => throw _privateConstructorUsedError;
  @HiveField(13)
  int get priority => throw _privateConstructorUsedError;

  /// Serializes this SyncQueueItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SyncQueueItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SyncQueueItemCopyWith<SyncQueueItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncQueueItemCopyWith<$Res> {
  factory $SyncQueueItemCopyWith(
          SyncQueueItem value, $Res Function(SyncQueueItem) then) =
      _$SyncQueueItemCopyWithImpl<$Res, SyncQueueItem>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) DateTime createdAt,
      @HiveField(2) DateTime updatedAt,
      @HiveField(3) int version,
      @HiveField(4) SyncStatus syncStatus,
      @HiveField(5) Map<String, dynamic>? metadata,
      @HiveField(6) String entityType,
      @HiveField(7) String entityId,
      @HiveField(8) SyncOperation operation,
      @HiveField(9) Map<String, dynamic> data,
      @HiveField(10) int retryCount,
      @HiveField(11) DateTime? lastRetryAt,
      @HiveField(12) String? errorMessage,
      @HiveField(13) int priority});
}

/// @nodoc
class _$SyncQueueItemCopyWithImpl<$Res, $Val extends SyncQueueItem>
    implements $SyncQueueItemCopyWith<$Res> {
  _$SyncQueueItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SyncQueueItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? version = null,
    Object? syncStatus = null,
    Object? metadata = freezed,
    Object? entityType = null,
    Object? entityId = null,
    Object? operation = null,
    Object? data = null,
    Object? retryCount = null,
    Object? lastRetryAt = freezed,
    Object? errorMessage = freezed,
    Object? priority = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      syncStatus: null == syncStatus
          ? _value.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as SyncStatus,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String,
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as SyncOperation,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      retryCount: null == retryCount
          ? _value.retryCount
          : retryCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastRetryAt: freezed == lastRetryAt
          ? _value.lastRetryAt
          : lastRetryAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncQueueItemImplCopyWith<$Res>
    implements $SyncQueueItemCopyWith<$Res> {
  factory _$$SyncQueueItemImplCopyWith(
          _$SyncQueueItemImpl value, $Res Function(_$SyncQueueItemImpl) then) =
      __$$SyncQueueItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) DateTime createdAt,
      @HiveField(2) DateTime updatedAt,
      @HiveField(3) int version,
      @HiveField(4) SyncStatus syncStatus,
      @HiveField(5) Map<String, dynamic>? metadata,
      @HiveField(6) String entityType,
      @HiveField(7) String entityId,
      @HiveField(8) SyncOperation operation,
      @HiveField(9) Map<String, dynamic> data,
      @HiveField(10) int retryCount,
      @HiveField(11) DateTime? lastRetryAt,
      @HiveField(12) String? errorMessage,
      @HiveField(13) int priority});
}

/// @nodoc
class __$$SyncQueueItemImplCopyWithImpl<$Res>
    extends _$SyncQueueItemCopyWithImpl<$Res, _$SyncQueueItemImpl>
    implements _$$SyncQueueItemImplCopyWith<$Res> {
  __$$SyncQueueItemImplCopyWithImpl(
      _$SyncQueueItemImpl _value, $Res Function(_$SyncQueueItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of SyncQueueItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? version = null,
    Object? syncStatus = null,
    Object? metadata = freezed,
    Object? entityType = null,
    Object? entityId = null,
    Object? operation = null,
    Object? data = null,
    Object? retryCount = null,
    Object? lastRetryAt = freezed,
    Object? errorMessage = freezed,
    Object? priority = null,
  }) {
    return _then(_$SyncQueueItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      syncStatus: null == syncStatus
          ? _value.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as SyncStatus,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String,
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as SyncOperation,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      retryCount: null == retryCount
          ? _value.retryCount
          : retryCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastRetryAt: freezed == lastRetryAt
          ? _value.lastRetryAt
          : lastRetryAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncQueueItemImpl implements _SyncQueueItem {
  const _$SyncQueueItemImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.createdAt,
      @HiveField(2) required this.updatedAt,
      @HiveField(3) this.version = 1,
      @HiveField(4) this.syncStatus = SyncStatus.pending,
      @HiveField(5) final Map<String, dynamic>? metadata,
      @HiveField(6) required this.entityType,
      @HiveField(7) required this.entityId,
      @HiveField(8) required this.operation,
      @HiveField(9) required final Map<String, dynamic> data,
      @HiveField(10) this.retryCount = 0,
      @HiveField(11) this.lastRetryAt,
      @HiveField(12) this.errorMessage,
      @HiveField(13) this.priority = 0})
      : _metadata = metadata,
        _data = data;

  factory _$SyncQueueItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncQueueItemImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final DateTime createdAt;
  @override
  @HiveField(2)
  final DateTime updatedAt;
  @override
  @JsonKey()
  @HiveField(3)
  final int version;
  @override
  @JsonKey()
  @HiveField(4)
  final SyncStatus syncStatus;
  final Map<String, dynamic>? _metadata;
  @override
  @HiveField(5)
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @HiveField(6)
  final String entityType;
  @override
  @HiveField(7)
  final String entityId;
  @override
  @HiveField(8)
  final SyncOperation operation;
  final Map<String, dynamic> _data;
  @override
  @HiveField(9)
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  @JsonKey()
  @HiveField(10)
  final int retryCount;
  @override
  @HiveField(11)
  final DateTime? lastRetryAt;
  @override
  @HiveField(12)
  final String? errorMessage;
  @override
  @JsonKey()
  @HiveField(13)
  final int priority;

  @override
  String toString() {
    return 'SyncQueueItem(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, syncStatus: $syncStatus, metadata: $metadata, entityType: $entityType, entityId: $entityId, operation: $operation, data: $data, retryCount: $retryCount, lastRetryAt: $lastRetryAt, errorMessage: $errorMessage, priority: $priority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncQueueItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.retryCount, retryCount) ||
                other.retryCount == retryCount) &&
            (identical(other.lastRetryAt, lastRetryAt) ||
                other.lastRetryAt == lastRetryAt) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      version,
      syncStatus,
      const DeepCollectionEquality().hash(_metadata),
      entityType,
      entityId,
      operation,
      const DeepCollectionEquality().hash(_data),
      retryCount,
      lastRetryAt,
      errorMessage,
      priority);

  /// Create a copy of SyncQueueItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncQueueItemImplCopyWith<_$SyncQueueItemImpl> get copyWith =>
      __$$SyncQueueItemImplCopyWithImpl<_$SyncQueueItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncQueueItemImplToJson(
      this,
    );
  }
}

abstract class _SyncQueueItem implements SyncQueueItem {
  const factory _SyncQueueItem(
      {@HiveField(0) required final String id,
      @HiveField(1) required final DateTime createdAt,
      @HiveField(2) required final DateTime updatedAt,
      @HiveField(3) final int version,
      @HiveField(4) final SyncStatus syncStatus,
      @HiveField(5) final Map<String, dynamic>? metadata,
      @HiveField(6) required final String entityType,
      @HiveField(7) required final String entityId,
      @HiveField(8) required final SyncOperation operation,
      @HiveField(9) required final Map<String, dynamic> data,
      @HiveField(10) final int retryCount,
      @HiveField(11) final DateTime? lastRetryAt,
      @HiveField(12) final String? errorMessage,
      @HiveField(13) final int priority}) = _$SyncQueueItemImpl;

  factory _SyncQueueItem.fromJson(Map<String, dynamic> json) =
      _$SyncQueueItemImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  DateTime get createdAt;
  @override
  @HiveField(2)
  DateTime get updatedAt;
  @override
  @HiveField(3)
  int get version;
  @override
  @HiveField(4)
  SyncStatus get syncStatus;
  @override
  @HiveField(5)
  Map<String, dynamic>? get metadata;
  @override
  @HiveField(6)
  String get entityType;
  @override
  @HiveField(7)
  String get entityId;
  @override
  @HiveField(8)
  SyncOperation get operation;
  @override
  @HiveField(9)
  Map<String, dynamic> get data;
  @override
  @HiveField(10)
  int get retryCount;
  @override
  @HiveField(11)
  DateTime? get lastRetryAt;
  @override
  @HiveField(12)
  String? get errorMessage;
  @override
  @HiveField(13)
  int get priority;

  /// Create a copy of SyncQueueItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncQueueItemImplCopyWith<_$SyncQueueItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
