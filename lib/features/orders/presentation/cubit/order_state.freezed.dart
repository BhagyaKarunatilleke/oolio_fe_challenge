// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OrderModel> orders) loaded,
    required TResult Function(OrderModel order) orderCreated,
    required TResult Function(OrderModel order) orderUpdated,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrderModel> orders)? loaded,
    TResult? Function(OrderModel order)? orderCreated,
    TResult? Function(OrderModel order)? orderUpdated,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrderModel> orders)? loaded,
    TResult Function(OrderModel order)? orderCreated,
    TResult Function(OrderModel order)? orderUpdated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderInitial value) initial,
    required TResult Function(OrderLoading value) loading,
    required TResult Function(OrderLoaded value) loaded,
    required TResult Function(OrderCreated value) orderCreated,
    required TResult Function(OrderUpdated value) orderUpdated,
    required TResult Function(OrderError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderInitial value)? initial,
    TResult? Function(OrderLoading value)? loading,
    TResult? Function(OrderLoaded value)? loaded,
    TResult? Function(OrderCreated value)? orderCreated,
    TResult? Function(OrderUpdated value)? orderUpdated,
    TResult? Function(OrderError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderInitial value)? initial,
    TResult Function(OrderLoading value)? loading,
    TResult Function(OrderLoaded value)? loaded,
    TResult Function(OrderCreated value)? orderCreated,
    TResult Function(OrderUpdated value)? orderUpdated,
    TResult Function(OrderError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStateCopyWith<$Res> {
  factory $OrderStateCopyWith(
          OrderState value, $Res Function(OrderState) then) =
      _$OrderStateCopyWithImpl<$Res, OrderState>;
}

/// @nodoc
class _$OrderStateCopyWithImpl<$Res, $Val extends OrderState>
    implements $OrderStateCopyWith<$Res> {
  _$OrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$OrderInitialImplCopyWith<$Res> {
  factory _$$OrderInitialImplCopyWith(
          _$OrderInitialImpl value, $Res Function(_$OrderInitialImpl) then) =
      __$$OrderInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderInitialImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderInitialImpl>
    implements _$$OrderInitialImplCopyWith<$Res> {
  __$$OrderInitialImplCopyWithImpl(
      _$OrderInitialImpl _value, $Res Function(_$OrderInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OrderInitialImpl implements OrderInitial {
  const _$OrderInitialImpl();

  @override
  String toString() {
    return 'OrderState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OrderInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OrderModel> orders) loaded,
    required TResult Function(OrderModel order) orderCreated,
    required TResult Function(OrderModel order) orderUpdated,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrderModel> orders)? loaded,
    TResult? Function(OrderModel order)? orderCreated,
    TResult? Function(OrderModel order)? orderUpdated,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrderModel> orders)? loaded,
    TResult Function(OrderModel order)? orderCreated,
    TResult Function(OrderModel order)? orderUpdated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderInitial value) initial,
    required TResult Function(OrderLoading value) loading,
    required TResult Function(OrderLoaded value) loaded,
    required TResult Function(OrderCreated value) orderCreated,
    required TResult Function(OrderUpdated value) orderUpdated,
    required TResult Function(OrderError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderInitial value)? initial,
    TResult? Function(OrderLoading value)? loading,
    TResult? Function(OrderLoaded value)? loaded,
    TResult? Function(OrderCreated value)? orderCreated,
    TResult? Function(OrderUpdated value)? orderUpdated,
    TResult? Function(OrderError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderInitial value)? initial,
    TResult Function(OrderLoading value)? loading,
    TResult Function(OrderLoaded value)? loaded,
    TResult Function(OrderCreated value)? orderCreated,
    TResult Function(OrderUpdated value)? orderUpdated,
    TResult Function(OrderError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class OrderInitial implements OrderState {
  const factory OrderInitial() = _$OrderInitialImpl;
}

/// @nodoc
abstract class _$$OrderLoadingImplCopyWith<$Res> {
  factory _$$OrderLoadingImplCopyWith(
          _$OrderLoadingImpl value, $Res Function(_$OrderLoadingImpl) then) =
      __$$OrderLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderLoadingImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderLoadingImpl>
    implements _$$OrderLoadingImplCopyWith<$Res> {
  __$$OrderLoadingImplCopyWithImpl(
      _$OrderLoadingImpl _value, $Res Function(_$OrderLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OrderLoadingImpl implements OrderLoading {
  const _$OrderLoadingImpl();

  @override
  String toString() {
    return 'OrderState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OrderLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OrderModel> orders) loaded,
    required TResult Function(OrderModel order) orderCreated,
    required TResult Function(OrderModel order) orderUpdated,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrderModel> orders)? loaded,
    TResult? Function(OrderModel order)? orderCreated,
    TResult? Function(OrderModel order)? orderUpdated,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrderModel> orders)? loaded,
    TResult Function(OrderModel order)? orderCreated,
    TResult Function(OrderModel order)? orderUpdated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderInitial value) initial,
    required TResult Function(OrderLoading value) loading,
    required TResult Function(OrderLoaded value) loaded,
    required TResult Function(OrderCreated value) orderCreated,
    required TResult Function(OrderUpdated value) orderUpdated,
    required TResult Function(OrderError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderInitial value)? initial,
    TResult? Function(OrderLoading value)? loading,
    TResult? Function(OrderLoaded value)? loaded,
    TResult? Function(OrderCreated value)? orderCreated,
    TResult? Function(OrderUpdated value)? orderUpdated,
    TResult? Function(OrderError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderInitial value)? initial,
    TResult Function(OrderLoading value)? loading,
    TResult Function(OrderLoaded value)? loaded,
    TResult Function(OrderCreated value)? orderCreated,
    TResult Function(OrderUpdated value)? orderUpdated,
    TResult Function(OrderError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class OrderLoading implements OrderState {
  const factory OrderLoading() = _$OrderLoadingImpl;
}

/// @nodoc
abstract class _$$OrderLoadedImplCopyWith<$Res> {
  factory _$$OrderLoadedImplCopyWith(
          _$OrderLoadedImpl value, $Res Function(_$OrderLoadedImpl) then) =
      __$$OrderLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<OrderModel> orders});
}

/// @nodoc
class __$$OrderLoadedImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderLoadedImpl>
    implements _$$OrderLoadedImplCopyWith<$Res> {
  __$$OrderLoadedImplCopyWithImpl(
      _$OrderLoadedImpl _value, $Res Function(_$OrderLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
  }) {
    return _then(_$OrderLoadedImpl(
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>,
    ));
  }
}

/// @nodoc

class _$OrderLoadedImpl implements OrderLoaded {
  const _$OrderLoadedImpl({required final List<OrderModel> orders})
      : _orders = orders;

  final List<OrderModel> _orders;
  @override
  List<OrderModel> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  String toString() {
    return 'OrderState.loaded(orders: $orders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderLoadedImpl &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_orders));

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderLoadedImplCopyWith<_$OrderLoadedImpl> get copyWith =>
      __$$OrderLoadedImplCopyWithImpl<_$OrderLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OrderModel> orders) loaded,
    required TResult Function(OrderModel order) orderCreated,
    required TResult Function(OrderModel order) orderUpdated,
    required TResult Function(String message) error,
  }) {
    return loaded(orders);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrderModel> orders)? loaded,
    TResult? Function(OrderModel order)? orderCreated,
    TResult? Function(OrderModel order)? orderUpdated,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(orders);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrderModel> orders)? loaded,
    TResult Function(OrderModel order)? orderCreated,
    TResult Function(OrderModel order)? orderUpdated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(orders);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderInitial value) initial,
    required TResult Function(OrderLoading value) loading,
    required TResult Function(OrderLoaded value) loaded,
    required TResult Function(OrderCreated value) orderCreated,
    required TResult Function(OrderUpdated value) orderUpdated,
    required TResult Function(OrderError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderInitial value)? initial,
    TResult? Function(OrderLoading value)? loading,
    TResult? Function(OrderLoaded value)? loaded,
    TResult? Function(OrderCreated value)? orderCreated,
    TResult? Function(OrderUpdated value)? orderUpdated,
    TResult? Function(OrderError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderInitial value)? initial,
    TResult Function(OrderLoading value)? loading,
    TResult Function(OrderLoaded value)? loaded,
    TResult Function(OrderCreated value)? orderCreated,
    TResult Function(OrderUpdated value)? orderUpdated,
    TResult Function(OrderError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class OrderLoaded implements OrderState {
  const factory OrderLoaded({required final List<OrderModel> orders}) =
      _$OrderLoadedImpl;

  List<OrderModel> get orders;

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderLoadedImplCopyWith<_$OrderLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrderCreatedImplCopyWith<$Res> {
  factory _$$OrderCreatedImplCopyWith(
          _$OrderCreatedImpl value, $Res Function(_$OrderCreatedImpl) then) =
      __$$OrderCreatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderModel order});

  $OrderModelCopyWith<$Res> get order;
}

/// @nodoc
class __$$OrderCreatedImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderCreatedImpl>
    implements _$$OrderCreatedImplCopyWith<$Res> {
  __$$OrderCreatedImplCopyWithImpl(
      _$OrderCreatedImpl _value, $Res Function(_$OrderCreatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
  }) {
    return _then(_$OrderCreatedImpl(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderModel,
    ));
  }

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderModelCopyWith<$Res> get order {
    return $OrderModelCopyWith<$Res>(_value.order, (value) {
      return _then(_value.copyWith(order: value));
    });
  }
}

/// @nodoc

class _$OrderCreatedImpl implements OrderCreated {
  const _$OrderCreatedImpl({required this.order});

  @override
  final OrderModel order;

  @override
  String toString() {
    return 'OrderState.orderCreated(order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderCreatedImpl &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode => Object.hash(runtimeType, order);

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderCreatedImplCopyWith<_$OrderCreatedImpl> get copyWith =>
      __$$OrderCreatedImplCopyWithImpl<_$OrderCreatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OrderModel> orders) loaded,
    required TResult Function(OrderModel order) orderCreated,
    required TResult Function(OrderModel order) orderUpdated,
    required TResult Function(String message) error,
  }) {
    return orderCreated(order);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrderModel> orders)? loaded,
    TResult? Function(OrderModel order)? orderCreated,
    TResult? Function(OrderModel order)? orderUpdated,
    TResult? Function(String message)? error,
  }) {
    return orderCreated?.call(order);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrderModel> orders)? loaded,
    TResult Function(OrderModel order)? orderCreated,
    TResult Function(OrderModel order)? orderUpdated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (orderCreated != null) {
      return orderCreated(order);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderInitial value) initial,
    required TResult Function(OrderLoading value) loading,
    required TResult Function(OrderLoaded value) loaded,
    required TResult Function(OrderCreated value) orderCreated,
    required TResult Function(OrderUpdated value) orderUpdated,
    required TResult Function(OrderError value) error,
  }) {
    return orderCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderInitial value)? initial,
    TResult? Function(OrderLoading value)? loading,
    TResult? Function(OrderLoaded value)? loaded,
    TResult? Function(OrderCreated value)? orderCreated,
    TResult? Function(OrderUpdated value)? orderUpdated,
    TResult? Function(OrderError value)? error,
  }) {
    return orderCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderInitial value)? initial,
    TResult Function(OrderLoading value)? loading,
    TResult Function(OrderLoaded value)? loaded,
    TResult Function(OrderCreated value)? orderCreated,
    TResult Function(OrderUpdated value)? orderUpdated,
    TResult Function(OrderError value)? error,
    required TResult orElse(),
  }) {
    if (orderCreated != null) {
      return orderCreated(this);
    }
    return orElse();
  }
}

abstract class OrderCreated implements OrderState {
  const factory OrderCreated({required final OrderModel order}) =
      _$OrderCreatedImpl;

  OrderModel get order;

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderCreatedImplCopyWith<_$OrderCreatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrderUpdatedImplCopyWith<$Res> {
  factory _$$OrderUpdatedImplCopyWith(
          _$OrderUpdatedImpl value, $Res Function(_$OrderUpdatedImpl) then) =
      __$$OrderUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderModel order});

  $OrderModelCopyWith<$Res> get order;
}

/// @nodoc
class __$$OrderUpdatedImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderUpdatedImpl>
    implements _$$OrderUpdatedImplCopyWith<$Res> {
  __$$OrderUpdatedImplCopyWithImpl(
      _$OrderUpdatedImpl _value, $Res Function(_$OrderUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
  }) {
    return _then(_$OrderUpdatedImpl(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderModel,
    ));
  }

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderModelCopyWith<$Res> get order {
    return $OrderModelCopyWith<$Res>(_value.order, (value) {
      return _then(_value.copyWith(order: value));
    });
  }
}

/// @nodoc

class _$OrderUpdatedImpl implements OrderUpdated {
  const _$OrderUpdatedImpl({required this.order});

  @override
  final OrderModel order;

  @override
  String toString() {
    return 'OrderState.orderUpdated(order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderUpdatedImpl &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode => Object.hash(runtimeType, order);

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderUpdatedImplCopyWith<_$OrderUpdatedImpl> get copyWith =>
      __$$OrderUpdatedImplCopyWithImpl<_$OrderUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OrderModel> orders) loaded,
    required TResult Function(OrderModel order) orderCreated,
    required TResult Function(OrderModel order) orderUpdated,
    required TResult Function(String message) error,
  }) {
    return orderUpdated(order);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrderModel> orders)? loaded,
    TResult? Function(OrderModel order)? orderCreated,
    TResult? Function(OrderModel order)? orderUpdated,
    TResult? Function(String message)? error,
  }) {
    return orderUpdated?.call(order);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrderModel> orders)? loaded,
    TResult Function(OrderModel order)? orderCreated,
    TResult Function(OrderModel order)? orderUpdated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (orderUpdated != null) {
      return orderUpdated(order);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderInitial value) initial,
    required TResult Function(OrderLoading value) loading,
    required TResult Function(OrderLoaded value) loaded,
    required TResult Function(OrderCreated value) orderCreated,
    required TResult Function(OrderUpdated value) orderUpdated,
    required TResult Function(OrderError value) error,
  }) {
    return orderUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderInitial value)? initial,
    TResult? Function(OrderLoading value)? loading,
    TResult? Function(OrderLoaded value)? loaded,
    TResult? Function(OrderCreated value)? orderCreated,
    TResult? Function(OrderUpdated value)? orderUpdated,
    TResult? Function(OrderError value)? error,
  }) {
    return orderUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderInitial value)? initial,
    TResult Function(OrderLoading value)? loading,
    TResult Function(OrderLoaded value)? loaded,
    TResult Function(OrderCreated value)? orderCreated,
    TResult Function(OrderUpdated value)? orderUpdated,
    TResult Function(OrderError value)? error,
    required TResult orElse(),
  }) {
    if (orderUpdated != null) {
      return orderUpdated(this);
    }
    return orElse();
  }
}

abstract class OrderUpdated implements OrderState {
  const factory OrderUpdated({required final OrderModel order}) =
      _$OrderUpdatedImpl;

  OrderModel get order;

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderUpdatedImplCopyWith<_$OrderUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrderErrorImplCopyWith<$Res> {
  factory _$$OrderErrorImplCopyWith(
          _$OrderErrorImpl value, $Res Function(_$OrderErrorImpl) then) =
      __$$OrderErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$OrderErrorImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderErrorImpl>
    implements _$$OrderErrorImplCopyWith<$Res> {
  __$$OrderErrorImplCopyWithImpl(
      _$OrderErrorImpl _value, $Res Function(_$OrderErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$OrderErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OrderErrorImpl implements OrderError {
  const _$OrderErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'OrderState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderErrorImplCopyWith<_$OrderErrorImpl> get copyWith =>
      __$$OrderErrorImplCopyWithImpl<_$OrderErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OrderModel> orders) loaded,
    required TResult Function(OrderModel order) orderCreated,
    required TResult Function(OrderModel order) orderUpdated,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OrderModel> orders)? loaded,
    TResult? Function(OrderModel order)? orderCreated,
    TResult? Function(OrderModel order)? orderUpdated,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OrderModel> orders)? loaded,
    TResult Function(OrderModel order)? orderCreated,
    TResult Function(OrderModel order)? orderUpdated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderInitial value) initial,
    required TResult Function(OrderLoading value) loading,
    required TResult Function(OrderLoaded value) loaded,
    required TResult Function(OrderCreated value) orderCreated,
    required TResult Function(OrderUpdated value) orderUpdated,
    required TResult Function(OrderError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderInitial value)? initial,
    TResult? Function(OrderLoading value)? loading,
    TResult? Function(OrderLoaded value)? loaded,
    TResult? Function(OrderCreated value)? orderCreated,
    TResult? Function(OrderUpdated value)? orderUpdated,
    TResult? Function(OrderError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderInitial value)? initial,
    TResult Function(OrderLoading value)? loading,
    TResult Function(OrderLoaded value)? loaded,
    TResult Function(OrderCreated value)? orderCreated,
    TResult Function(OrderUpdated value)? orderUpdated,
    TResult Function(OrderError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class OrderError implements OrderState {
  const factory OrderError(final String message) = _$OrderErrorImpl;

  String get message;

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderErrorImplCopyWith<_$OrderErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CheckoutState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String customerName, String customerPhone,
            String? specialInstructions)
        customerDetails,
    required TResult Function(String customerName, String customerPhone,
            String? specialInstructions)
        paymentSelection,
    required TResult Function() processing,
    required TResult Function(OrderModel order) completed,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String customerName, String customerPhone,
            String? specialInstructions)?
        customerDetails,
    TResult? Function(String customerName, String customerPhone,
            String? specialInstructions)?
        paymentSelection,
    TResult? Function()? processing,
    TResult? Function(OrderModel order)? completed,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String customerName, String customerPhone,
            String? specialInstructions)?
        customerDetails,
    TResult Function(String customerName, String customerPhone,
            String? specialInstructions)?
        paymentSelection,
    TResult Function()? processing,
    TResult Function(OrderModel order)? completed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutInitial value) initial,
    required TResult Function(CheckoutLoading value) loading,
    required TResult Function(CheckoutCustomerDetails value) customerDetails,
    required TResult Function(CheckoutPaymentSelection value) paymentSelection,
    required TResult Function(CheckoutProcessing value) processing,
    required TResult Function(CheckoutCompleted value) completed,
    required TResult Function(CheckoutError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckoutInitial value)? initial,
    TResult? Function(CheckoutLoading value)? loading,
    TResult? Function(CheckoutCustomerDetails value)? customerDetails,
    TResult? Function(CheckoutPaymentSelection value)? paymentSelection,
    TResult? Function(CheckoutProcessing value)? processing,
    TResult? Function(CheckoutCompleted value)? completed,
    TResult? Function(CheckoutError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutInitial value)? initial,
    TResult Function(CheckoutLoading value)? loading,
    TResult Function(CheckoutCustomerDetails value)? customerDetails,
    TResult Function(CheckoutPaymentSelection value)? paymentSelection,
    TResult Function(CheckoutProcessing value)? processing,
    TResult Function(CheckoutCompleted value)? completed,
    TResult Function(CheckoutError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutStateCopyWith<$Res> {
  factory $CheckoutStateCopyWith(
          CheckoutState value, $Res Function(CheckoutState) then) =
      _$CheckoutStateCopyWithImpl<$Res, CheckoutState>;
}

/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res, $Val extends CheckoutState>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CheckoutInitialImplCopyWith<$Res> {
  factory _$$CheckoutInitialImplCopyWith(_$CheckoutInitialImpl value,
          $Res Function(_$CheckoutInitialImpl) then) =
      __$$CheckoutInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckoutInitialImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$CheckoutInitialImpl>
    implements _$$CheckoutInitialImplCopyWith<$Res> {
  __$$CheckoutInitialImplCopyWithImpl(
      _$CheckoutInitialImpl _value, $Res Function(_$CheckoutInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckoutInitialImpl implements CheckoutInitial {
  const _$CheckoutInitialImpl();

  @override
  String toString() {
    return 'CheckoutState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckoutInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String customerName, String customerPhone,
            String? specialInstructions)
        customerDetails,
    required TResult Function(String customerName, String customerPhone,
            String? specialInstructions)
        paymentSelection,
    required TResult Function() processing,
    required TResult Function(OrderModel order) completed,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String customerName, String customerPhone,
            String? specialInstructions)?
        customerDetails,
    TResult? Function(String customerName, String customerPhone,
            String? specialInstructions)?
        paymentSelection,
    TResult? Function()? processing,
    TResult? Function(OrderModel order)? completed,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String customerName, String customerPhone,
            String? specialInstructions)?
        customerDetails,
    TResult Function(String customerName, String customerPhone,
            String? specialInstructions)?
        paymentSelection,
    TResult Function()? processing,
    TResult Function(OrderModel order)? completed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutInitial value) initial,
    required TResult Function(CheckoutLoading value) loading,
    required TResult Function(CheckoutCustomerDetails value) customerDetails,
    required TResult Function(CheckoutPaymentSelection value) paymentSelection,
    required TResult Function(CheckoutProcessing value) processing,
    required TResult Function(CheckoutCompleted value) completed,
    required TResult Function(CheckoutError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckoutInitial value)? initial,
    TResult? Function(CheckoutLoading value)? loading,
    TResult? Function(CheckoutCustomerDetails value)? customerDetails,
    TResult? Function(CheckoutPaymentSelection value)? paymentSelection,
    TResult? Function(CheckoutProcessing value)? processing,
    TResult? Function(CheckoutCompleted value)? completed,
    TResult? Function(CheckoutError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutInitial value)? initial,
    TResult Function(CheckoutLoading value)? loading,
    TResult Function(CheckoutCustomerDetails value)? customerDetails,
    TResult Function(CheckoutPaymentSelection value)? paymentSelection,
    TResult Function(CheckoutProcessing value)? processing,
    TResult Function(CheckoutCompleted value)? completed,
    TResult Function(CheckoutError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CheckoutInitial implements CheckoutState {
  const factory CheckoutInitial() = _$CheckoutInitialImpl;
}

/// @nodoc
abstract class _$$CheckoutLoadingImplCopyWith<$Res> {
  factory _$$CheckoutLoadingImplCopyWith(_$CheckoutLoadingImpl value,
          $Res Function(_$CheckoutLoadingImpl) then) =
      __$$CheckoutLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckoutLoadingImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$CheckoutLoadingImpl>
    implements _$$CheckoutLoadingImplCopyWith<$Res> {
  __$$CheckoutLoadingImplCopyWithImpl(
      _$CheckoutLoadingImpl _value, $Res Function(_$CheckoutLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckoutLoadingImpl implements CheckoutLoading {
  const _$CheckoutLoadingImpl();

  @override
  String toString() {
    return 'CheckoutState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckoutLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String customerName, String customerPhone,
            String? specialInstructions)
        customerDetails,
    required TResult Function(String customerName, String customerPhone,
            String? specialInstructions)
        paymentSelection,
    required TResult Function() processing,
    required TResult Function(OrderModel order) completed,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String customerName, String customerPhone,
            String? specialInstructions)?
        customerDetails,
    TResult? Function(String customerName, String customerPhone,
            String? specialInstructions)?
        paymentSelection,
    TResult? Function()? processing,
    TResult? Function(OrderModel order)? completed,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String customerName, String customerPhone,
            String? specialInstructions)?
        customerDetails,
    TResult Function(String customerName, String customerPhone,
            String? specialInstructions)?
        paymentSelection,
    TResult Function()? processing,
    TResult Function(OrderModel order)? completed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutInitial value) initial,
    required TResult Function(CheckoutLoading value) loading,
    required TResult Function(CheckoutCustomerDetails value) customerDetails,
    required TResult Function(CheckoutPaymentSelection value) paymentSelection,
    required TResult Function(CheckoutProcessing value) processing,
    required TResult Function(CheckoutCompleted value) completed,
    required TResult Function(CheckoutError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckoutInitial value)? initial,
    TResult? Function(CheckoutLoading value)? loading,
    TResult? Function(CheckoutCustomerDetails value)? customerDetails,
    TResult? Function(CheckoutPaymentSelection value)? paymentSelection,
    TResult? Function(CheckoutProcessing value)? processing,
    TResult? Function(CheckoutCompleted value)? completed,
    TResult? Function(CheckoutError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutInitial value)? initial,
    TResult Function(CheckoutLoading value)? loading,
    TResult Function(CheckoutCustomerDetails value)? customerDetails,
    TResult Function(CheckoutPaymentSelection value)? paymentSelection,
    TResult Function(CheckoutProcessing value)? processing,
    TResult Function(CheckoutCompleted value)? completed,
    TResult Function(CheckoutError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CheckoutLoading implements CheckoutState {
  const factory CheckoutLoading() = _$CheckoutLoadingImpl;
}

/// @nodoc
abstract class _$$CheckoutCustomerDetailsImplCopyWith<$Res> {
  factory _$$CheckoutCustomerDetailsImplCopyWith(
          _$CheckoutCustomerDetailsImpl value,
          $Res Function(_$CheckoutCustomerDetailsImpl) then) =
      __$$CheckoutCustomerDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String customerName, String customerPhone, String? specialInstructions});
}

/// @nodoc
class __$$CheckoutCustomerDetailsImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$CheckoutCustomerDetailsImpl>
    implements _$$CheckoutCustomerDetailsImplCopyWith<$Res> {
  __$$CheckoutCustomerDetailsImplCopyWithImpl(
      _$CheckoutCustomerDetailsImpl _value,
      $Res Function(_$CheckoutCustomerDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerName = null,
    Object? customerPhone = null,
    Object? specialInstructions = freezed,
  }) {
    return _then(_$CheckoutCustomerDetailsImpl(
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerPhone: null == customerPhone
          ? _value.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CheckoutCustomerDetailsImpl implements CheckoutCustomerDetails {
  const _$CheckoutCustomerDetailsImpl(
      {required this.customerName,
      required this.customerPhone,
      this.specialInstructions});

  @override
  final String customerName;
  @override
  final String customerPhone;
  @override
  final String? specialInstructions;

  @override
  String toString() {
    return 'CheckoutState.customerDetails(customerName: $customerName, customerPhone: $customerPhone, specialInstructions: $specialInstructions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutCustomerDetailsImpl &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerPhone, customerPhone) ||
                other.customerPhone == customerPhone) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, customerName, customerPhone, specialInstructions);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutCustomerDetailsImplCopyWith<_$CheckoutCustomerDetailsImpl>
      get copyWith => __$$CheckoutCustomerDetailsImplCopyWithImpl<
          _$CheckoutCustomerDetailsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String customerName, String customerPhone,
            String? specialInstructions)
        customerDetails,
    required TResult Function(String customerName, String customerPhone,
            String? specialInstructions)
        paymentSelection,
    required TResult Function() processing,
    required TResult Function(OrderModel order) completed,
    required TResult Function(String message) error,
  }) {
    return customerDetails(customerName, customerPhone, specialInstructions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String customerName, String customerPhone,
            String? specialInstructions)?
        customerDetails,
    TResult? Function(String customerName, String customerPhone,
            String? specialInstructions)?
        paymentSelection,
    TResult? Function()? processing,
    TResult? Function(OrderModel order)? completed,
    TResult? Function(String message)? error,
  }) {
    return customerDetails?.call(
        customerName, customerPhone, specialInstructions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String customerName, String customerPhone,
            String? specialInstructions)?
        customerDetails,
    TResult Function(String customerName, String customerPhone,
            String? specialInstructions)?
        paymentSelection,
    TResult Function()? processing,
    TResult Function(OrderModel order)? completed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (customerDetails != null) {
      return customerDetails(customerName, customerPhone, specialInstructions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutInitial value) initial,
    required TResult Function(CheckoutLoading value) loading,
    required TResult Function(CheckoutCustomerDetails value) customerDetails,
    required TResult Function(CheckoutPaymentSelection value) paymentSelection,
    required TResult Function(CheckoutProcessing value) processing,
    required TResult Function(CheckoutCompleted value) completed,
    required TResult Function(CheckoutError value) error,
  }) {
    return customerDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckoutInitial value)? initial,
    TResult? Function(CheckoutLoading value)? loading,
    TResult? Function(CheckoutCustomerDetails value)? customerDetails,
    TResult? Function(CheckoutPaymentSelection value)? paymentSelection,
    TResult? Function(CheckoutProcessing value)? processing,
    TResult? Function(CheckoutCompleted value)? completed,
    TResult? Function(CheckoutError value)? error,
  }) {
    return customerDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutInitial value)? initial,
    TResult Function(CheckoutLoading value)? loading,
    TResult Function(CheckoutCustomerDetails value)? customerDetails,
    TResult Function(CheckoutPaymentSelection value)? paymentSelection,
    TResult Function(CheckoutProcessing value)? processing,
    TResult Function(CheckoutCompleted value)? completed,
    TResult Function(CheckoutError value)? error,
    required TResult orElse(),
  }) {
    if (customerDetails != null) {
      return customerDetails(this);
    }
    return orElse();
  }
}

abstract class CheckoutCustomerDetails implements CheckoutState {
  const factory CheckoutCustomerDetails(
      {required final String customerName,
      required final String customerPhone,
      final String? specialInstructions}) = _$CheckoutCustomerDetailsImpl;

  String get customerName;
  String get customerPhone;
  String? get specialInstructions;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutCustomerDetailsImplCopyWith<_$CheckoutCustomerDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutPaymentSelectionImplCopyWith<$Res> {
  factory _$$CheckoutPaymentSelectionImplCopyWith(
          _$CheckoutPaymentSelectionImpl value,
          $Res Function(_$CheckoutPaymentSelectionImpl) then) =
      __$$CheckoutPaymentSelectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String customerName, String customerPhone, String? specialInstructions});
}

/// @nodoc
class __$$CheckoutPaymentSelectionImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$CheckoutPaymentSelectionImpl>
    implements _$$CheckoutPaymentSelectionImplCopyWith<$Res> {
  __$$CheckoutPaymentSelectionImplCopyWithImpl(
      _$CheckoutPaymentSelectionImpl _value,
      $Res Function(_$CheckoutPaymentSelectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerName = null,
    Object? customerPhone = null,
    Object? specialInstructions = freezed,
  }) {
    return _then(_$CheckoutPaymentSelectionImpl(
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerPhone: null == customerPhone
          ? _value.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String,
      specialInstructions: freezed == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CheckoutPaymentSelectionImpl implements CheckoutPaymentSelection {
  const _$CheckoutPaymentSelectionImpl(
      {required this.customerName,
      required this.customerPhone,
      this.specialInstructions});

  @override
  final String customerName;
  @override
  final String customerPhone;
  @override
  final String? specialInstructions;

  @override
  String toString() {
    return 'CheckoutState.paymentSelection(customerName: $customerName, customerPhone: $customerPhone, specialInstructions: $specialInstructions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutPaymentSelectionImpl &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerPhone, customerPhone) ||
                other.customerPhone == customerPhone) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, customerName, customerPhone, specialInstructions);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutPaymentSelectionImplCopyWith<_$CheckoutPaymentSelectionImpl>
      get copyWith => __$$CheckoutPaymentSelectionImplCopyWithImpl<
          _$CheckoutPaymentSelectionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String customerName, String customerPhone,
            String? specialInstructions)
        customerDetails,
    required TResult Function(String customerName, String customerPhone,
            String? specialInstructions)
        paymentSelection,
    required TResult Function() processing,
    required TResult Function(OrderModel order) completed,
    required TResult Function(String message) error,
  }) {
    return paymentSelection(customerName, customerPhone, specialInstructions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String customerName, String customerPhone,
            String? specialInstructions)?
        customerDetails,
    TResult? Function(String customerName, String customerPhone,
            String? specialInstructions)?
        paymentSelection,
    TResult? Function()? processing,
    TResult? Function(OrderModel order)? completed,
    TResult? Function(String message)? error,
  }) {
    return paymentSelection?.call(
        customerName, customerPhone, specialInstructions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String customerName, String customerPhone,
            String? specialInstructions)?
        customerDetails,
    TResult Function(String customerName, String customerPhone,
            String? specialInstructions)?
        paymentSelection,
    TResult Function()? processing,
    TResult Function(OrderModel order)? completed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (paymentSelection != null) {
      return paymentSelection(customerName, customerPhone, specialInstructions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutInitial value) initial,
    required TResult Function(CheckoutLoading value) loading,
    required TResult Function(CheckoutCustomerDetails value) customerDetails,
    required TResult Function(CheckoutPaymentSelection value) paymentSelection,
    required TResult Function(CheckoutProcessing value) processing,
    required TResult Function(CheckoutCompleted value) completed,
    required TResult Function(CheckoutError value) error,
  }) {
    return paymentSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckoutInitial value)? initial,
    TResult? Function(CheckoutLoading value)? loading,
    TResult? Function(CheckoutCustomerDetails value)? customerDetails,
    TResult? Function(CheckoutPaymentSelection value)? paymentSelection,
    TResult? Function(CheckoutProcessing value)? processing,
    TResult? Function(CheckoutCompleted value)? completed,
    TResult? Function(CheckoutError value)? error,
  }) {
    return paymentSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutInitial value)? initial,
    TResult Function(CheckoutLoading value)? loading,
    TResult Function(CheckoutCustomerDetails value)? customerDetails,
    TResult Function(CheckoutPaymentSelection value)? paymentSelection,
    TResult Function(CheckoutProcessing value)? processing,
    TResult Function(CheckoutCompleted value)? completed,
    TResult Function(CheckoutError value)? error,
    required TResult orElse(),
  }) {
    if (paymentSelection != null) {
      return paymentSelection(this);
    }
    return orElse();
  }
}

abstract class CheckoutPaymentSelection implements CheckoutState {
  const factory CheckoutPaymentSelection(
      {required final String customerName,
      required final String customerPhone,
      final String? specialInstructions}) = _$CheckoutPaymentSelectionImpl;

  String get customerName;
  String get customerPhone;
  String? get specialInstructions;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutPaymentSelectionImplCopyWith<_$CheckoutPaymentSelectionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutProcessingImplCopyWith<$Res> {
  factory _$$CheckoutProcessingImplCopyWith(_$CheckoutProcessingImpl value,
          $Res Function(_$CheckoutProcessingImpl) then) =
      __$$CheckoutProcessingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckoutProcessingImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$CheckoutProcessingImpl>
    implements _$$CheckoutProcessingImplCopyWith<$Res> {
  __$$CheckoutProcessingImplCopyWithImpl(_$CheckoutProcessingImpl _value,
      $Res Function(_$CheckoutProcessingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckoutProcessingImpl implements CheckoutProcessing {
  const _$CheckoutProcessingImpl();

  @override
  String toString() {
    return 'CheckoutState.processing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckoutProcessingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String customerName, String customerPhone,
            String? specialInstructions)
        customerDetails,
    required TResult Function(String customerName, String customerPhone,
            String? specialInstructions)
        paymentSelection,
    required TResult Function() processing,
    required TResult Function(OrderModel order) completed,
    required TResult Function(String message) error,
  }) {
    return processing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String customerName, String customerPhone,
            String? specialInstructions)?
        customerDetails,
    TResult? Function(String customerName, String customerPhone,
            String? specialInstructions)?
        paymentSelection,
    TResult? Function()? processing,
    TResult? Function(OrderModel order)? completed,
    TResult? Function(String message)? error,
  }) {
    return processing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String customerName, String customerPhone,
            String? specialInstructions)?
        customerDetails,
    TResult Function(String customerName, String customerPhone,
            String? specialInstructions)?
        paymentSelection,
    TResult Function()? processing,
    TResult Function(OrderModel order)? completed,
    TResult Function(String message)? error,
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
    required TResult Function(CheckoutInitial value) initial,
    required TResult Function(CheckoutLoading value) loading,
    required TResult Function(CheckoutCustomerDetails value) customerDetails,
    required TResult Function(CheckoutPaymentSelection value) paymentSelection,
    required TResult Function(CheckoutProcessing value) processing,
    required TResult Function(CheckoutCompleted value) completed,
    required TResult Function(CheckoutError value) error,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckoutInitial value)? initial,
    TResult? Function(CheckoutLoading value)? loading,
    TResult? Function(CheckoutCustomerDetails value)? customerDetails,
    TResult? Function(CheckoutPaymentSelection value)? paymentSelection,
    TResult? Function(CheckoutProcessing value)? processing,
    TResult? Function(CheckoutCompleted value)? completed,
    TResult? Function(CheckoutError value)? error,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutInitial value)? initial,
    TResult Function(CheckoutLoading value)? loading,
    TResult Function(CheckoutCustomerDetails value)? customerDetails,
    TResult Function(CheckoutPaymentSelection value)? paymentSelection,
    TResult Function(CheckoutProcessing value)? processing,
    TResult Function(CheckoutCompleted value)? completed,
    TResult Function(CheckoutError value)? error,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class CheckoutProcessing implements CheckoutState {
  const factory CheckoutProcessing() = _$CheckoutProcessingImpl;
}

/// @nodoc
abstract class _$$CheckoutCompletedImplCopyWith<$Res> {
  factory _$$CheckoutCompletedImplCopyWith(_$CheckoutCompletedImpl value,
          $Res Function(_$CheckoutCompletedImpl) then) =
      __$$CheckoutCompletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderModel order});

  $OrderModelCopyWith<$Res> get order;
}

/// @nodoc
class __$$CheckoutCompletedImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$CheckoutCompletedImpl>
    implements _$$CheckoutCompletedImplCopyWith<$Res> {
  __$$CheckoutCompletedImplCopyWithImpl(_$CheckoutCompletedImpl _value,
      $Res Function(_$CheckoutCompletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
  }) {
    return _then(_$CheckoutCompletedImpl(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderModel,
    ));
  }

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderModelCopyWith<$Res> get order {
    return $OrderModelCopyWith<$Res>(_value.order, (value) {
      return _then(_value.copyWith(order: value));
    });
  }
}

/// @nodoc

class _$CheckoutCompletedImpl implements CheckoutCompleted {
  const _$CheckoutCompletedImpl({required this.order});

  @override
  final OrderModel order;

  @override
  String toString() {
    return 'CheckoutState.completed(order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutCompletedImpl &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode => Object.hash(runtimeType, order);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutCompletedImplCopyWith<_$CheckoutCompletedImpl> get copyWith =>
      __$$CheckoutCompletedImplCopyWithImpl<_$CheckoutCompletedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String customerName, String customerPhone,
            String? specialInstructions)
        customerDetails,
    required TResult Function(String customerName, String customerPhone,
            String? specialInstructions)
        paymentSelection,
    required TResult Function() processing,
    required TResult Function(OrderModel order) completed,
    required TResult Function(String message) error,
  }) {
    return completed(order);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String customerName, String customerPhone,
            String? specialInstructions)?
        customerDetails,
    TResult? Function(String customerName, String customerPhone,
            String? specialInstructions)?
        paymentSelection,
    TResult? Function()? processing,
    TResult? Function(OrderModel order)? completed,
    TResult? Function(String message)? error,
  }) {
    return completed?.call(order);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String customerName, String customerPhone,
            String? specialInstructions)?
        customerDetails,
    TResult Function(String customerName, String customerPhone,
            String? specialInstructions)?
        paymentSelection,
    TResult Function()? processing,
    TResult Function(OrderModel order)? completed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(order);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutInitial value) initial,
    required TResult Function(CheckoutLoading value) loading,
    required TResult Function(CheckoutCustomerDetails value) customerDetails,
    required TResult Function(CheckoutPaymentSelection value) paymentSelection,
    required TResult Function(CheckoutProcessing value) processing,
    required TResult Function(CheckoutCompleted value) completed,
    required TResult Function(CheckoutError value) error,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckoutInitial value)? initial,
    TResult? Function(CheckoutLoading value)? loading,
    TResult? Function(CheckoutCustomerDetails value)? customerDetails,
    TResult? Function(CheckoutPaymentSelection value)? paymentSelection,
    TResult? Function(CheckoutProcessing value)? processing,
    TResult? Function(CheckoutCompleted value)? completed,
    TResult? Function(CheckoutError value)? error,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutInitial value)? initial,
    TResult Function(CheckoutLoading value)? loading,
    TResult Function(CheckoutCustomerDetails value)? customerDetails,
    TResult Function(CheckoutPaymentSelection value)? paymentSelection,
    TResult Function(CheckoutProcessing value)? processing,
    TResult Function(CheckoutCompleted value)? completed,
    TResult Function(CheckoutError value)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class CheckoutCompleted implements CheckoutState {
  const factory CheckoutCompleted({required final OrderModel order}) =
      _$CheckoutCompletedImpl;

  OrderModel get order;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutCompletedImplCopyWith<_$CheckoutCompletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckoutErrorImplCopyWith<$Res> {
  factory _$$CheckoutErrorImplCopyWith(
          _$CheckoutErrorImpl value, $Res Function(_$CheckoutErrorImpl) then) =
      __$$CheckoutErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CheckoutErrorImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$CheckoutErrorImpl>
    implements _$$CheckoutErrorImplCopyWith<$Res> {
  __$$CheckoutErrorImplCopyWithImpl(
      _$CheckoutErrorImpl _value, $Res Function(_$CheckoutErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$CheckoutErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CheckoutErrorImpl implements CheckoutError {
  const _$CheckoutErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CheckoutState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutErrorImplCopyWith<_$CheckoutErrorImpl> get copyWith =>
      __$$CheckoutErrorImplCopyWithImpl<_$CheckoutErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String customerName, String customerPhone,
            String? specialInstructions)
        customerDetails,
    required TResult Function(String customerName, String customerPhone,
            String? specialInstructions)
        paymentSelection,
    required TResult Function() processing,
    required TResult Function(OrderModel order) completed,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String customerName, String customerPhone,
            String? specialInstructions)?
        customerDetails,
    TResult? Function(String customerName, String customerPhone,
            String? specialInstructions)?
        paymentSelection,
    TResult? Function()? processing,
    TResult? Function(OrderModel order)? completed,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String customerName, String customerPhone,
            String? specialInstructions)?
        customerDetails,
    TResult Function(String customerName, String customerPhone,
            String? specialInstructions)?
        paymentSelection,
    TResult Function()? processing,
    TResult Function(OrderModel order)? completed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckoutInitial value) initial,
    required TResult Function(CheckoutLoading value) loading,
    required TResult Function(CheckoutCustomerDetails value) customerDetails,
    required TResult Function(CheckoutPaymentSelection value) paymentSelection,
    required TResult Function(CheckoutProcessing value) processing,
    required TResult Function(CheckoutCompleted value) completed,
    required TResult Function(CheckoutError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CheckoutInitial value)? initial,
    TResult? Function(CheckoutLoading value)? loading,
    TResult? Function(CheckoutCustomerDetails value)? customerDetails,
    TResult? Function(CheckoutPaymentSelection value)? paymentSelection,
    TResult? Function(CheckoutProcessing value)? processing,
    TResult? Function(CheckoutCompleted value)? completed,
    TResult? Function(CheckoutError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckoutInitial value)? initial,
    TResult Function(CheckoutLoading value)? loading,
    TResult Function(CheckoutCustomerDetails value)? customerDetails,
    TResult Function(CheckoutPaymentSelection value)? paymentSelection,
    TResult Function(CheckoutProcessing value)? processing,
    TResult Function(CheckoutCompleted value)? completed,
    TResult Function(CheckoutError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CheckoutError implements CheckoutState {
  const factory CheckoutError(final String message) = _$CheckoutErrorImpl;

  String get message;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutErrorImplCopyWith<_$CheckoutErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
