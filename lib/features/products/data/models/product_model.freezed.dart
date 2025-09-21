// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
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
  String get name => throw _privateConstructorUsedError;
  @HiveField(7)
  String get description => throw _privateConstructorUsedError;
  @HiveField(8)
  double get price => throw _privateConstructorUsedError;
  @HiveField(9)
  String get category => throw _privateConstructorUsedError;
  @HiveField(10)
  List<String> get tags => throw _privateConstructorUsedError;
  @HiveField(11)
  bool get isAvailable => throw _privateConstructorUsedError;
  @HiveField(12)
  int get stockQuantity => throw _privateConstructorUsedError;
  @HiveField(13)
  List<ProductVariant> get variants => throw _privateConstructorUsedError;
  @HiveField(14)
  List<ProductAddon> get addons => throw _privateConstructorUsedError;

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) DateTime createdAt,
      @HiveField(2) DateTime updatedAt,
      @HiveField(3) int version,
      @HiveField(4) SyncStatus syncStatus,
      @HiveField(5) Map<String, dynamic>? metadata,
      @HiveField(6) String name,
      @HiveField(7) String description,
      @HiveField(8) double price,
      @HiveField(9) String category,
      @HiveField(10) List<String> tags,
      @HiveField(11) bool isAvailable,
      @HiveField(12) int stockQuantity,
      @HiveField(13) List<ProductVariant> variants,
      @HiveField(14) List<ProductAddon> addons});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductModel
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
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? category = null,
    Object? tags = null,
    Object? isAvailable = null,
    Object? stockQuantity = null,
    Object? variants = null,
    Object? addons = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      stockQuantity: null == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      variants: null == variants
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<ProductVariant>,
      addons: null == addons
          ? _value.addons
          : addons // ignore: cast_nullable_to_non_nullable
              as List<ProductAddon>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) DateTime createdAt,
      @HiveField(2) DateTime updatedAt,
      @HiveField(3) int version,
      @HiveField(4) SyncStatus syncStatus,
      @HiveField(5) Map<String, dynamic>? metadata,
      @HiveField(6) String name,
      @HiveField(7) String description,
      @HiveField(8) double price,
      @HiveField(9) String category,
      @HiveField(10) List<String> tags,
      @HiveField(11) bool isAvailable,
      @HiveField(12) int stockQuantity,
      @HiveField(13) List<ProductVariant> variants,
      @HiveField(14) List<ProductAddon> addons});
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductModel
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
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? category = null,
    Object? tags = null,
    Object? isAvailable = null,
    Object? stockQuantity = null,
    Object? variants = null,
    Object? addons = null,
  }) {
    return _then(_$ProductModelImpl(
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      stockQuantity: null == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      variants: null == variants
          ? _value._variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<ProductVariant>,
      addons: null == addons
          ? _value._addons
          : addons // ignore: cast_nullable_to_non_nullable
              as List<ProductAddon>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductModelImpl implements _ProductModel {
  const _$ProductModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.createdAt,
      @HiveField(2) required this.updatedAt,
      @HiveField(3) this.version = 1,
      @HiveField(4) this.syncStatus = SyncStatus.pending,
      @HiveField(5) final Map<String, dynamic>? metadata,
      @HiveField(6) required this.name,
      @HiveField(7) required this.description,
      @HiveField(8) required this.price,
      @HiveField(9) required this.category,
      @HiveField(10) final List<String> tags = const [],
      @HiveField(11) this.isAvailable = true,
      @HiveField(12) this.stockQuantity = 0,
      @HiveField(13) final List<ProductVariant> variants = const [],
      @HiveField(14) final List<ProductAddon> addons = const []})
      : _metadata = metadata,
        _tags = tags,
        _variants = variants,
        _addons = addons;

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

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
  final String name;
  @override
  @HiveField(7)
  final String description;
  @override
  @HiveField(8)
  final double price;
  @override
  @HiveField(9)
  final String category;
  final List<String> _tags;
  @override
  @JsonKey()
  @HiveField(10)
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey()
  @HiveField(11)
  final bool isAvailable;
  @override
  @JsonKey()
  @HiveField(12)
  final int stockQuantity;
  final List<ProductVariant> _variants;
  @override
  @JsonKey()
  @HiveField(13)
  List<ProductVariant> get variants {
    if (_variants is EqualUnmodifiableListView) return _variants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variants);
  }

  final List<ProductAddon> _addons;
  @override
  @JsonKey()
  @HiveField(14)
  List<ProductAddon> get addons {
    if (_addons is EqualUnmodifiableListView) return _addons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addons);
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, syncStatus: $syncStatus, metadata: $metadata, name: $name, description: $description, price: $price, category: $category, tags: $tags, isAvailable: $isAvailable, stockQuantity: $stockQuantity, variants: $variants, addons: $addons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.stockQuantity, stockQuantity) ||
                other.stockQuantity == stockQuantity) &&
            const DeepCollectionEquality().equals(other._variants, _variants) &&
            const DeepCollectionEquality().equals(other._addons, _addons));
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
      name,
      description,
      price,
      category,
      const DeepCollectionEquality().hash(_tags),
      isAvailable,
      stockQuantity,
      const DeepCollectionEquality().hash(_variants),
      const DeepCollectionEquality().hash(_addons));

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  const factory _ProductModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final DateTime createdAt,
      @HiveField(2) required final DateTime updatedAt,
      @HiveField(3) final int version,
      @HiveField(4) final SyncStatus syncStatus,
      @HiveField(5) final Map<String, dynamic>? metadata,
      @HiveField(6) required final String name,
      @HiveField(7) required final String description,
      @HiveField(8) required final double price,
      @HiveField(9) required final String category,
      @HiveField(10) final List<String> tags,
      @HiveField(11) final bool isAvailable,
      @HiveField(12) final int stockQuantity,
      @HiveField(13) final List<ProductVariant> variants,
      @HiveField(14) final List<ProductAddon> addons}) = _$ProductModelImpl;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

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
  String get name;
  @override
  @HiveField(7)
  String get description;
  @override
  @HiveField(8)
  double get price;
  @override
  @HiveField(9)
  String get category;
  @override
  @HiveField(10)
  List<String> get tags;
  @override
  @HiveField(11)
  bool get isAvailable;
  @override
  @HiveField(12)
  int get stockQuantity;
  @override
  @HiveField(13)
  List<ProductVariant> get variants;
  @override
  @HiveField(14)
  List<ProductAddon> get addons;

  /// Create a copy of ProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
