// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_addon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductAddon _$ProductAddonFromJson(Map<String, dynamic> json) {
  return _ProductAddon.fromJson(json);
}

/// @nodoc
mixin _$ProductAddon {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  double get price => throw _privateConstructorUsedError;
  @HiveField(2)
  bool get isRequired => throw _privateConstructorUsedError;

  /// Serializes this ProductAddon to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductAddon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductAddonCopyWith<ProductAddon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductAddonCopyWith<$Res> {
  factory $ProductAddonCopyWith(
          ProductAddon value, $Res Function(ProductAddon) then) =
      _$ProductAddonCopyWithImpl<$Res, ProductAddon>;
  @useResult
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) double price,
      @HiveField(2) bool isRequired});
}

/// @nodoc
class _$ProductAddonCopyWithImpl<$Res, $Val extends ProductAddon>
    implements $ProductAddonCopyWith<$Res> {
  _$ProductAddonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductAddon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
    Object? isRequired = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductAddonImplCopyWith<$Res>
    implements $ProductAddonCopyWith<$Res> {
  factory _$$ProductAddonImplCopyWith(
          _$ProductAddonImpl value, $Res Function(_$ProductAddonImpl) then) =
      __$$ProductAddonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) double price,
      @HiveField(2) bool isRequired});
}

/// @nodoc
class __$$ProductAddonImplCopyWithImpl<$Res>
    extends _$ProductAddonCopyWithImpl<$Res, _$ProductAddonImpl>
    implements _$$ProductAddonImplCopyWith<$Res> {
  __$$ProductAddonImplCopyWithImpl(
      _$ProductAddonImpl _value, $Res Function(_$ProductAddonImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductAddon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
    Object? isRequired = null,
  }) {
    return _then(_$ProductAddonImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductAddonImpl implements _ProductAddon {
  const _$ProductAddonImpl(
      {@HiveField(0) required this.name,
      @HiveField(1) required this.price,
      @HiveField(2) this.isRequired = false});

  factory _$ProductAddonImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductAddonImplFromJson(json);

  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  final double price;
  @override
  @JsonKey()
  @HiveField(2)
  final bool isRequired;

  @override
  String toString() {
    return 'ProductAddon(name: $name, price: $price, isRequired: $isRequired)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductAddonImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, price, isRequired);

  /// Create a copy of ProductAddon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductAddonImplCopyWith<_$ProductAddonImpl> get copyWith =>
      __$$ProductAddonImplCopyWithImpl<_$ProductAddonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductAddonImplToJson(
      this,
    );
  }
}

abstract class _ProductAddon implements ProductAddon {
  const factory _ProductAddon(
      {@HiveField(0) required final String name,
      @HiveField(1) required final double price,
      @HiveField(2) final bool isRequired}) = _$ProductAddonImpl;

  factory _ProductAddon.fromJson(Map<String, dynamic> json) =
      _$ProductAddonImpl.fromJson;

  @override
  @HiveField(0)
  String get name;
  @override
  @HiveField(1)
  double get price;
  @override
  @HiveField(2)
  bool get isRequired;

  /// Create a copy of ProductAddon
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductAddonImplCopyWith<_$ProductAddonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
