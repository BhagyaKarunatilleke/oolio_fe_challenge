// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conflict_resolution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConflictResolution _$ConflictResolutionFromJson(Map<String, dynamic> json) {
  return _ConflictResolution.fromJson(json);
}

/// @nodoc
mixin _$ConflictResolution {
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
  Map<String, dynamic> get localData => throw _privateConstructorUsedError;
  @HiveField(9)
  Map<String, dynamic> get remoteData => throw _privateConstructorUsedError;
  @HiveField(10)
  ConflictType get conflictType => throw _privateConstructorUsedError;
  @HiveField(11)
  ConflictResolutionStrategy get strategy => throw _privateConstructorUsedError;
  @HiveField(12)
  Map<String, dynamic>? get resolvedData => throw _privateConstructorUsedError;
  @HiveField(13)
  bool get isResolved => throw _privateConstructorUsedError;

  /// Serializes this ConflictResolution to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConflictResolution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConflictResolutionCopyWith<ConflictResolution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConflictResolutionCopyWith<$Res> {
  factory $ConflictResolutionCopyWith(
          ConflictResolution value, $Res Function(ConflictResolution) then) =
      _$ConflictResolutionCopyWithImpl<$Res, ConflictResolution>;
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
      @HiveField(8) Map<String, dynamic> localData,
      @HiveField(9) Map<String, dynamic> remoteData,
      @HiveField(10) ConflictType conflictType,
      @HiveField(11) ConflictResolutionStrategy strategy,
      @HiveField(12) Map<String, dynamic>? resolvedData,
      @HiveField(13) bool isResolved});
}

/// @nodoc
class _$ConflictResolutionCopyWithImpl<$Res, $Val extends ConflictResolution>
    implements $ConflictResolutionCopyWith<$Res> {
  _$ConflictResolutionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConflictResolution
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
    Object? localData = null,
    Object? remoteData = null,
    Object? conflictType = null,
    Object? strategy = null,
    Object? resolvedData = freezed,
    Object? isResolved = null,
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
      localData: null == localData
          ? _value.localData
          : localData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      remoteData: null == remoteData
          ? _value.remoteData
          : remoteData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      conflictType: null == conflictType
          ? _value.conflictType
          : conflictType // ignore: cast_nullable_to_non_nullable
              as ConflictType,
      strategy: null == strategy
          ? _value.strategy
          : strategy // ignore: cast_nullable_to_non_nullable
              as ConflictResolutionStrategy,
      resolvedData: freezed == resolvedData
          ? _value.resolvedData
          : resolvedData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isResolved: null == isResolved
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConflictResolutionImplCopyWith<$Res>
    implements $ConflictResolutionCopyWith<$Res> {
  factory _$$ConflictResolutionImplCopyWith(_$ConflictResolutionImpl value,
          $Res Function(_$ConflictResolutionImpl) then) =
      __$$ConflictResolutionImplCopyWithImpl<$Res>;
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
      @HiveField(8) Map<String, dynamic> localData,
      @HiveField(9) Map<String, dynamic> remoteData,
      @HiveField(10) ConflictType conflictType,
      @HiveField(11) ConflictResolutionStrategy strategy,
      @HiveField(12) Map<String, dynamic>? resolvedData,
      @HiveField(13) bool isResolved});
}

/// @nodoc
class __$$ConflictResolutionImplCopyWithImpl<$Res>
    extends _$ConflictResolutionCopyWithImpl<$Res, _$ConflictResolutionImpl>
    implements _$$ConflictResolutionImplCopyWith<$Res> {
  __$$ConflictResolutionImplCopyWithImpl(_$ConflictResolutionImpl _value,
      $Res Function(_$ConflictResolutionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConflictResolution
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
    Object? localData = null,
    Object? remoteData = null,
    Object? conflictType = null,
    Object? strategy = null,
    Object? resolvedData = freezed,
    Object? isResolved = null,
  }) {
    return _then(_$ConflictResolutionImpl(
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
      localData: null == localData
          ? _value._localData
          : localData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      remoteData: null == remoteData
          ? _value._remoteData
          : remoteData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      conflictType: null == conflictType
          ? _value.conflictType
          : conflictType // ignore: cast_nullable_to_non_nullable
              as ConflictType,
      strategy: null == strategy
          ? _value.strategy
          : strategy // ignore: cast_nullable_to_non_nullable
              as ConflictResolutionStrategy,
      resolvedData: freezed == resolvedData
          ? _value._resolvedData
          : resolvedData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isResolved: null == isResolved
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConflictResolutionImpl implements _ConflictResolution {
  const _$ConflictResolutionImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.createdAt,
      @HiveField(2) required this.updatedAt,
      @HiveField(3) this.version = 1,
      @HiveField(4) this.syncStatus = SyncStatus.pending,
      @HiveField(5) final Map<String, dynamic>? metadata,
      @HiveField(6) required this.entityType,
      @HiveField(7) required this.entityId,
      @HiveField(8) required final Map<String, dynamic> localData,
      @HiveField(9) required final Map<String, dynamic> remoteData,
      @HiveField(10) required this.conflictType,
      @HiveField(11) required this.strategy,
      @HiveField(12) final Map<String, dynamic>? resolvedData,
      @HiveField(13) this.isResolved = false})
      : _metadata = metadata,
        _localData = localData,
        _remoteData = remoteData,
        _resolvedData = resolvedData;

  factory _$ConflictResolutionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConflictResolutionImplFromJson(json);

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
  final Map<String, dynamic> _localData;
  @override
  @HiveField(8)
  Map<String, dynamic> get localData {
    if (_localData is EqualUnmodifiableMapView) return _localData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_localData);
  }

  final Map<String, dynamic> _remoteData;
  @override
  @HiveField(9)
  Map<String, dynamic> get remoteData {
    if (_remoteData is EqualUnmodifiableMapView) return _remoteData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_remoteData);
  }

  @override
  @HiveField(10)
  final ConflictType conflictType;
  @override
  @HiveField(11)
  final ConflictResolutionStrategy strategy;
  final Map<String, dynamic>? _resolvedData;
  @override
  @HiveField(12)
  Map<String, dynamic>? get resolvedData {
    final value = _resolvedData;
    if (value == null) return null;
    if (_resolvedData is EqualUnmodifiableMapView) return _resolvedData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  @HiveField(13)
  final bool isResolved;

  @override
  String toString() {
    return 'ConflictResolution(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, syncStatus: $syncStatus, metadata: $metadata, entityType: $entityType, entityId: $entityId, localData: $localData, remoteData: $remoteData, conflictType: $conflictType, strategy: $strategy, resolvedData: $resolvedData, isResolved: $isResolved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConflictResolutionImpl &&
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
            const DeepCollectionEquality()
                .equals(other._localData, _localData) &&
            const DeepCollectionEquality()
                .equals(other._remoteData, _remoteData) &&
            (identical(other.conflictType, conflictType) ||
                other.conflictType == conflictType) &&
            (identical(other.strategy, strategy) ||
                other.strategy == strategy) &&
            const DeepCollectionEquality()
                .equals(other._resolvedData, _resolvedData) &&
            (identical(other.isResolved, isResolved) ||
                other.isResolved == isResolved));
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
      const DeepCollectionEquality().hash(_localData),
      const DeepCollectionEquality().hash(_remoteData),
      conflictType,
      strategy,
      const DeepCollectionEquality().hash(_resolvedData),
      isResolved);

  /// Create a copy of ConflictResolution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConflictResolutionImplCopyWith<_$ConflictResolutionImpl> get copyWith =>
      __$$ConflictResolutionImplCopyWithImpl<_$ConflictResolutionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConflictResolutionImplToJson(
      this,
    );
  }
}

abstract class _ConflictResolution implements ConflictResolution {
  const factory _ConflictResolution(
      {@HiveField(0) required final String id,
      @HiveField(1) required final DateTime createdAt,
      @HiveField(2) required final DateTime updatedAt,
      @HiveField(3) final int version,
      @HiveField(4) final SyncStatus syncStatus,
      @HiveField(5) final Map<String, dynamic>? metadata,
      @HiveField(6) required final String entityType,
      @HiveField(7) required final String entityId,
      @HiveField(8) required final Map<String, dynamic> localData,
      @HiveField(9) required final Map<String, dynamic> remoteData,
      @HiveField(10) required final ConflictType conflictType,
      @HiveField(11) required final ConflictResolutionStrategy strategy,
      @HiveField(12) final Map<String, dynamic>? resolvedData,
      @HiveField(13) final bool isResolved}) = _$ConflictResolutionImpl;

  factory _ConflictResolution.fromJson(Map<String, dynamic> json) =
      _$ConflictResolutionImpl.fromJson;

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
  Map<String, dynamic> get localData;
  @override
  @HiveField(9)
  Map<String, dynamic> get remoteData;
  @override
  @HiveField(10)
  ConflictType get conflictType;
  @override
  @HiveField(11)
  ConflictResolutionStrategy get strategy;
  @override
  @HiveField(12)
  Map<String, dynamic>? get resolvedData;
  @override
  @HiveField(13)
  bool get isResolved;

  /// Create a copy of ConflictResolution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConflictResolutionImplCopyWith<_$ConflictResolutionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
