// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) {
  return _OrderItemModel.fromJson(json);
}

/// @nodoc
mixin _$OrderItemModel {
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
  String get productId => throw _privateConstructorUsedError;
  @HiveField(7)
  String get productName => throw _privateConstructorUsedError;
  @HiveField(8)
  int get quantity => throw _privateConstructorUsedError;
  @HiveField(9)
  double get unitPrice => throw _privateConstructorUsedError;
  @HiveField(10)
  List<String> get selectedVariants => throw _privateConstructorUsedError;
  @HiveField(11)
  List<String> get selectedAddons => throw _privateConstructorUsedError;
  @HiveField(12)
  String? get specialInstructions => throw _privateConstructorUsedError;

  /// Serializes this OrderItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemModelCopyWith<OrderItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemModelCopyWith<$Res> {
  factory $OrderItemModelCopyWith(
          OrderItemModel value, $Res Function(OrderItemModel) then) =
      _$OrderItemModelCopyWithImpl<$Res, OrderItemModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) DateTime createdAt,
      @HiveField(2) DateTime updatedAt,
      @HiveField(3) int version,
      @HiveField(4) SyncStatus syncStatus,
      @HiveField(5) Map<String, dynamic>? metadata,
      @HiveField(6) String productId,
      @HiveField(7) String productName,
      @HiveField(8) int quantity,
      @HiveField(9) double unitPrice,
      @HiveField(10) List<String> selectedVariants,
      @HiveField(11) List<String> selectedAddons,
      @HiveField(12) String? specialInstructions});
}

/// @nodoc
class _$OrderItemModelCopyWithImpl<$Res, $Val extends OrderItemModel>
    implements $OrderItemModelCopyWith<$Res> {
  _$OrderItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItemModel
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
    Object? productId = null,
    Object? productName = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? selectedVariants = null,
    Object? selectedAddons = null,
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
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      selectedVariants: null == selectedVariants
          ? _value.selectedVariants
          : selectedVariants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedAddons: null == selectedAddons
          ? _value.selectedAddons
          : selectedAddons // ignore: cast_nullable_to_non_nullable
              as List<String>,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderItemModelImplCopyWith<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  factory _$$OrderItemModelImplCopyWith(_$OrderItemModelImpl value,
          $Res Function(_$OrderItemModelImpl) then) =
      __$$OrderItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) DateTime createdAt,
      @HiveField(2) DateTime updatedAt,
      @HiveField(3) int version,
      @HiveField(4) SyncStatus syncStatus,
      @HiveField(5) Map<String, dynamic>? metadata,
      @HiveField(6) String productId,
      @HiveField(7) String productName,
      @HiveField(8) int quantity,
      @HiveField(9) double unitPrice,
      @HiveField(10) List<String> selectedVariants,
      @HiveField(11) List<String> selectedAddons,
      @HiveField(12) String? specialInstructions});
}

/// @nodoc
class __$$OrderItemModelImplCopyWithImpl<$Res>
    extends _$OrderItemModelCopyWithImpl<$Res, _$OrderItemModelImpl>
    implements _$$OrderItemModelImplCopyWith<$Res> {
  __$$OrderItemModelImplCopyWithImpl(
      _$OrderItemModelImpl _value, $Res Function(_$OrderItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderItemModel
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
    Object? productId = null,
    Object? productName = null,
    Object? quantity = null,
    Object? unitPrice = null,
    Object? selectedVariants = null,
    Object? selectedAddons = null,
    Object? specialInstructions = freezed,
  }) {
    return _then(_$OrderItemModelImpl(
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
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      selectedVariants: null == selectedVariants
          ? _value._selectedVariants
          : selectedVariants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedAddons: null == selectedAddons
          ? _value._selectedAddons
          : selectedAddons // ignore: cast_nullable_to_non_nullable
              as List<String>,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemModelImpl implements _OrderItemModel {
  const _$OrderItemModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.createdAt,
      @HiveField(2) required this.updatedAt,
      @HiveField(3) this.version = 1,
      @HiveField(4) this.syncStatus = SyncStatus.pending,
      @HiveField(5) final Map<String, dynamic>? metadata,
      @HiveField(6) required this.productId,
      @HiveField(7) required this.productName,
      @HiveField(8) required this.quantity,
      @HiveField(9) required this.unitPrice,
      @HiveField(10) final List<String> selectedVariants = const [],
      @HiveField(11) final List<String> selectedAddons = const [],
      @HiveField(12) this.specialInstructions})
      : _metadata = metadata,
        _selectedVariants = selectedVariants,
        _selectedAddons = selectedAddons;

  factory _$OrderItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemModelImplFromJson(json);

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
  final String productId;
  @override
  @HiveField(7)
  final String productName;
  @override
  @HiveField(8)
  final int quantity;
  @override
  @HiveField(9)
  final double unitPrice;
  final List<String> _selectedVariants;
  @override
  @JsonKey()
  @HiveField(10)
  List<String> get selectedVariants {
    if (_selectedVariants is EqualUnmodifiableListView)
      return _selectedVariants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedVariants);
  }

  final List<String> _selectedAddons;
  @override
  @JsonKey()
  @HiveField(11)
  List<String> get selectedAddons {
    if (_selectedAddons is EqualUnmodifiableListView) return _selectedAddons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedAddons);
  }

  @override
  @HiveField(12)
  final String? specialInstructions;

  @override
  String toString() {
    return 'OrderItemModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, syncStatus: $syncStatus, metadata: $metadata, productId: $productId, productName: $productName, quantity: $quantity, unitPrice: $unitPrice, selectedVariants: $selectedVariants, selectedAddons: $selectedAddons, specialInstructions: $specialInstructions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            const DeepCollectionEquality()
                .equals(other._selectedVariants, _selectedVariants) &&
            const DeepCollectionEquality()
                .equals(other._selectedAddons, _selectedAddons) &&
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
      productId,
      productName,
      quantity,
      unitPrice,
      const DeepCollectionEquality().hash(_selectedVariants),
      const DeepCollectionEquality().hash(_selectedAddons),
      specialInstructions);

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemModelImplCopyWith<_$OrderItemModelImpl> get copyWith =>
      __$$OrderItemModelImplCopyWithImpl<_$OrderItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemModelImplToJson(
      this,
    );
  }
}

abstract class _OrderItemModel implements OrderItemModel {
  const factory _OrderItemModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final DateTime createdAt,
      @HiveField(2) required final DateTime updatedAt,
      @HiveField(3) final int version,
      @HiveField(4) final SyncStatus syncStatus,
      @HiveField(5) final Map<String, dynamic>? metadata,
      @HiveField(6) required final String productId,
      @HiveField(7) required final String productName,
      @HiveField(8) required final int quantity,
      @HiveField(9) required final double unitPrice,
      @HiveField(10) final List<String> selectedVariants,
      @HiveField(11) final List<String> selectedAddons,
      @HiveField(12) final String? specialInstructions}) = _$OrderItemModelImpl;

  factory _OrderItemModel.fromJson(Map<String, dynamic> json) =
      _$OrderItemModelImpl.fromJson;

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
  String get productId;
  @override
  @HiveField(7)
  String get productName;
  @override
  @HiveField(8)
  int get quantity;
  @override
  @HiveField(9)
  double get unitPrice;
  @override
  @HiveField(10)
  List<String> get selectedVariants;
  @override
  @HiveField(11)
  List<String> get selectedAddons;
  @override
  @HiveField(12)
  String? get specialInstructions;

  /// Create a copy of OrderItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemModelImplCopyWith<_$OrderItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
