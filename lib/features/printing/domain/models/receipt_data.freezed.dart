// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReceiptData _$ReceiptDataFromJson(Map<String, dynamic> json) {
  return _ReceiptData.fromJson(json);
}

/// @nodoc
mixin _$ReceiptData {
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  String? get templateId => throw _privateConstructorUsedError;
  DateTime? get generatedAt => throw _privateConstructorUsedError;

  /// Serializes this ReceiptData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReceiptData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReceiptDataCopyWith<ReceiptData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptDataCopyWith<$Res> {
  factory $ReceiptDataCopyWith(
          ReceiptData value, $Res Function(ReceiptData) then) =
      _$ReceiptDataCopyWithImpl<$Res, ReceiptData>;
  @useResult
  $Res call(
      {Map<String, dynamic> data, String? templateId, DateTime? generatedAt});
}

/// @nodoc
class _$ReceiptDataCopyWithImpl<$Res, $Val extends ReceiptData>
    implements $ReceiptDataCopyWith<$Res> {
  _$ReceiptDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReceiptData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? templateId = freezed,
    Object? generatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      templateId: freezed == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String?,
      generatedAt: freezed == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReceiptDataImplCopyWith<$Res>
    implements $ReceiptDataCopyWith<$Res> {
  factory _$$ReceiptDataImplCopyWith(
          _$ReceiptDataImpl value, $Res Function(_$ReceiptDataImpl) then) =
      __$$ReceiptDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, dynamic> data, String? templateId, DateTime? generatedAt});
}

/// @nodoc
class __$$ReceiptDataImplCopyWithImpl<$Res>
    extends _$ReceiptDataCopyWithImpl<$Res, _$ReceiptDataImpl>
    implements _$$ReceiptDataImplCopyWith<$Res> {
  __$$ReceiptDataImplCopyWithImpl(
      _$ReceiptDataImpl _value, $Res Function(_$ReceiptDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReceiptData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? templateId = freezed,
    Object? generatedAt = freezed,
  }) {
    return _then(_$ReceiptDataImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      templateId: freezed == templateId
          ? _value.templateId
          : templateId // ignore: cast_nullable_to_non_nullable
              as String?,
      generatedAt: freezed == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReceiptDataImpl implements _ReceiptData {
  const _$ReceiptDataImpl(
      {required final Map<String, dynamic> data,
      this.templateId,
      this.generatedAt})
      : _data = data;

  factory _$ReceiptDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceiptDataImplFromJson(json);

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  final String? templateId;
  @override
  final DateTime? generatedAt;

  @override
  String toString() {
    return 'ReceiptData(data: $data, templateId: $templateId, generatedAt: $generatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptDataImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_data), templateId, generatedAt);

  /// Create a copy of ReceiptData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptDataImplCopyWith<_$ReceiptDataImpl> get copyWith =>
      __$$ReceiptDataImplCopyWithImpl<_$ReceiptDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceiptDataImplToJson(
      this,
    );
  }
}

abstract class _ReceiptData implements ReceiptData {
  const factory _ReceiptData(
      {required final Map<String, dynamic> data,
      final String? templateId,
      final DateTime? generatedAt}) = _$ReceiptDataImpl;

  factory _ReceiptData.fromJson(Map<String, dynamic> json) =
      _$ReceiptDataImpl.fromJson;

  @override
  Map<String, dynamic> get data;
  @override
  String? get templateId;
  @override
  DateTime? get generatedAt;

  /// Create a copy of ReceiptData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiptDataImplCopyWith<_$ReceiptDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
