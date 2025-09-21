// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
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
  String get orderNumber => throw _privateConstructorUsedError;
  @HiveField(7)
  OrderStatus get status => throw _privateConstructorUsedError;
  @HiveField(8)
  List<OrderItemModel> get items => throw _privateConstructorUsedError;
  @HiveField(9)
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  @HiveField(10)
  PaymentStatus get paymentStatus => throw _privateConstructorUsedError;
  @HiveField(11)
  String? get customerName => throw _privateConstructorUsedError;
  @HiveField(12)
  String? get customerPhone => throw _privateConstructorUsedError;
  @HiveField(13)
  String? get specialInstructions => throw _privateConstructorUsedError;

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) DateTime createdAt,
      @HiveField(2) DateTime updatedAt,
      @HiveField(3) int version,
      @HiveField(4) SyncStatus syncStatus,
      @HiveField(5) Map<String, dynamic>? metadata,
      @HiveField(6) String orderNumber,
      @HiveField(7) OrderStatus status,
      @HiveField(8) List<OrderItemModel> items,
      @HiveField(9) PaymentMethod paymentMethod,
      @HiveField(10) PaymentStatus paymentStatus,
      @HiveField(11) String? customerName,
      @HiveField(12) String? customerPhone,
      @HiveField(13) String? specialInstructions});
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderModel
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
    Object? orderNumber = null,
    Object? status = null,
    Object? items = null,
    Object? paymentMethod = null,
    Object? paymentStatus = null,
    Object? customerName = freezed,
    Object? customerPhone = freezed,
    Object? specialInstructions = freezed,
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
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemModel>,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as PaymentStatus,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerPhone: freezed == customerPhone
          ? _value.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
          _$OrderModelImpl value, $Res Function(_$OrderModelImpl) then) =
      __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) DateTime createdAt,
      @HiveField(2) DateTime updatedAt,
      @HiveField(3) int version,
      @HiveField(4) SyncStatus syncStatus,
      @HiveField(5) Map<String, dynamic>? metadata,
      @HiveField(6) String orderNumber,
      @HiveField(7) OrderStatus status,
      @HiveField(8) List<OrderItemModel> items,
      @HiveField(9) PaymentMethod paymentMethod,
      @HiveField(10) PaymentStatus paymentStatus,
      @HiveField(11) String? customerName,
      @HiveField(12) String? customerPhone,
      @HiveField(13) String? specialInstructions});
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
      _$OrderModelImpl _value, $Res Function(_$OrderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderModel
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
    Object? orderNumber = null,
    Object? status = null,
    Object? items = null,
    Object? paymentMethod = null,
    Object? paymentStatus = null,
    Object? customerName = freezed,
    Object? customerPhone = freezed,
    Object? specialInstructions = freezed,
  }) {
    return _then(_$OrderModelImpl(
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
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItemModel>,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as PaymentStatus,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerPhone: freezed == customerPhone
          ? _value.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelImpl implements _OrderModel {
  const _$OrderModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.createdAt,
      @HiveField(2) required this.updatedAt,
      @HiveField(3) this.version = 1,
      @HiveField(4) this.syncStatus = SyncStatus.pending,
      @HiveField(5) final Map<String, dynamic>? metadata,
      @HiveField(6) required this.orderNumber,
      @HiveField(7) required this.status,
      @HiveField(8) final List<OrderItemModel> items = const [],
      @HiveField(9) this.paymentMethod = PaymentMethod.cash,
      @HiveField(10) this.paymentStatus = PaymentStatus.pending,
      @HiveField(11) this.customerName,
      @HiveField(12) this.customerPhone,
      @HiveField(13) this.specialInstructions})
      : _metadata = metadata,
        _items = items;

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

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
  final String orderNumber;
  @override
  @HiveField(7)
  final OrderStatus status;
  final List<OrderItemModel> _items;
  @override
  @JsonKey()
  @HiveField(8)
  List<OrderItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  @HiveField(9)
  final PaymentMethod paymentMethod;
  @override
  @JsonKey()
  @HiveField(10)
  final PaymentStatus paymentStatus;
  @override
  @HiveField(11)
  final String? customerName;
  @override
  @HiveField(12)
  final String? customerPhone;
  @override
  @HiveField(13)
  final String? specialInstructions;

  @override
  String toString() {
    return 'OrderModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, syncStatus: $syncStatus, metadata: $metadata, orderNumber: $orderNumber, status: $status, items: $items, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, customerName: $customerName, customerPhone: $customerPhone, specialInstructions: $specialInstructions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerPhone, customerPhone) ||
                other.customerPhone == customerPhone) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions));
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
      orderNumber,
      status,
      const DeepCollectionEquality().hash(_items),
      paymentMethod,
      paymentStatus,
      customerName,
      customerPhone,
      specialInstructions);

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(
      this,
    );
  }
}

abstract class _OrderModel implements OrderModel {
  const factory _OrderModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final DateTime createdAt,
      @HiveField(2) required final DateTime updatedAt,
      @HiveField(3) final int version,
      @HiveField(4) final SyncStatus syncStatus,
      @HiveField(5) final Map<String, dynamic>? metadata,
      @HiveField(6) required final String orderNumber,
      @HiveField(7) required final OrderStatus status,
      @HiveField(8) final List<OrderItemModel> items,
      @HiveField(9) final PaymentMethod paymentMethod,
      @HiveField(10) final PaymentStatus paymentStatus,
      @HiveField(11) final String? customerName,
      @HiveField(12) final String? customerPhone,
      @HiveField(13) final String? specialInstructions}) = _$OrderModelImpl;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

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
  String get orderNumber;
  @override
  @HiveField(7)
  OrderStatus get status;
  @override
  @HiveField(8)
  List<OrderItemModel> get items;
  @override
  @HiveField(9)
  PaymentMethod get paymentMethod;
  @override
  @HiveField(10)
  PaymentStatus get paymentStatus;
  @override
  @HiveField(11)
  String? get customerName;
  @override
  @HiveField(12)
  String? get customerPhone;
  @override
  @HiveField(13)
  String? get specialInstructions;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
