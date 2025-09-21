// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_tracking_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderTrackingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<OrderModel> activeOrders,
            List<OrderModel> completedOrders,
            OrderTrackingFilter currentFilter,
            String searchQuery)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<OrderModel> activeOrders,
            List<OrderModel> completedOrders,
            OrderTrackingFilter currentFilter,
            String searchQuery)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<OrderModel> activeOrders,
            List<OrderModel> completedOrders,
            OrderTrackingFilter currentFilter,
            String searchQuery)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderTrackingInitial value) initial,
    required TResult Function(OrderTrackingLoading value) loading,
    required TResult Function(OrderTrackingLoaded value) loaded,
    required TResult Function(OrderTrackingError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderTrackingInitial value)? initial,
    TResult? Function(OrderTrackingLoading value)? loading,
    TResult? Function(OrderTrackingLoaded value)? loaded,
    TResult? Function(OrderTrackingError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderTrackingInitial value)? initial,
    TResult Function(OrderTrackingLoading value)? loading,
    TResult Function(OrderTrackingLoaded value)? loaded,
    TResult Function(OrderTrackingError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTrackingStateCopyWith<$Res> {
  factory $OrderTrackingStateCopyWith(
          OrderTrackingState value, $Res Function(OrderTrackingState) then) =
      _$OrderTrackingStateCopyWithImpl<$Res, OrderTrackingState>;
}

/// @nodoc
class _$OrderTrackingStateCopyWithImpl<$Res, $Val extends OrderTrackingState>
    implements $OrderTrackingStateCopyWith<$Res> {
  _$OrderTrackingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderTrackingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$OrderTrackingInitialImplCopyWith<$Res> {
  factory _$$OrderTrackingInitialImplCopyWith(_$OrderTrackingInitialImpl value,
          $Res Function(_$OrderTrackingInitialImpl) then) =
      __$$OrderTrackingInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderTrackingInitialImplCopyWithImpl<$Res>
    extends _$OrderTrackingStateCopyWithImpl<$Res, _$OrderTrackingInitialImpl>
    implements _$$OrderTrackingInitialImplCopyWith<$Res> {
  __$$OrderTrackingInitialImplCopyWithImpl(_$OrderTrackingInitialImpl _value,
      $Res Function(_$OrderTrackingInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderTrackingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OrderTrackingInitialImpl implements OrderTrackingInitial {
  const _$OrderTrackingInitialImpl();

  @override
  String toString() {
    return 'OrderTrackingState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderTrackingInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<OrderModel> activeOrders,
            List<OrderModel> completedOrders,
            OrderTrackingFilter currentFilter,
            String searchQuery)
        loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<OrderModel> activeOrders,
            List<OrderModel> completedOrders,
            OrderTrackingFilter currentFilter,
            String searchQuery)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<OrderModel> activeOrders,
            List<OrderModel> completedOrders,
            OrderTrackingFilter currentFilter,
            String searchQuery)?
        loaded,
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
    required TResult Function(OrderTrackingInitial value) initial,
    required TResult Function(OrderTrackingLoading value) loading,
    required TResult Function(OrderTrackingLoaded value) loaded,
    required TResult Function(OrderTrackingError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderTrackingInitial value)? initial,
    TResult? Function(OrderTrackingLoading value)? loading,
    TResult? Function(OrderTrackingLoaded value)? loaded,
    TResult? Function(OrderTrackingError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderTrackingInitial value)? initial,
    TResult Function(OrderTrackingLoading value)? loading,
    TResult Function(OrderTrackingLoaded value)? loaded,
    TResult Function(OrderTrackingError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class OrderTrackingInitial implements OrderTrackingState {
  const factory OrderTrackingInitial() = _$OrderTrackingInitialImpl;
}

/// @nodoc
abstract class _$$OrderTrackingLoadingImplCopyWith<$Res> {
  factory _$$OrderTrackingLoadingImplCopyWith(_$OrderTrackingLoadingImpl value,
          $Res Function(_$OrderTrackingLoadingImpl) then) =
      __$$OrderTrackingLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OrderTrackingLoadingImplCopyWithImpl<$Res>
    extends _$OrderTrackingStateCopyWithImpl<$Res, _$OrderTrackingLoadingImpl>
    implements _$$OrderTrackingLoadingImplCopyWith<$Res> {
  __$$OrderTrackingLoadingImplCopyWithImpl(_$OrderTrackingLoadingImpl _value,
      $Res Function(_$OrderTrackingLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderTrackingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OrderTrackingLoadingImpl implements OrderTrackingLoading {
  const _$OrderTrackingLoadingImpl();

  @override
  String toString() {
    return 'OrderTrackingState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderTrackingLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<OrderModel> activeOrders,
            List<OrderModel> completedOrders,
            OrderTrackingFilter currentFilter,
            String searchQuery)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<OrderModel> activeOrders,
            List<OrderModel> completedOrders,
            OrderTrackingFilter currentFilter,
            String searchQuery)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<OrderModel> activeOrders,
            List<OrderModel> completedOrders,
            OrderTrackingFilter currentFilter,
            String searchQuery)?
        loaded,
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
    required TResult Function(OrderTrackingInitial value) initial,
    required TResult Function(OrderTrackingLoading value) loading,
    required TResult Function(OrderTrackingLoaded value) loaded,
    required TResult Function(OrderTrackingError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderTrackingInitial value)? initial,
    TResult? Function(OrderTrackingLoading value)? loading,
    TResult? Function(OrderTrackingLoaded value)? loaded,
    TResult? Function(OrderTrackingError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderTrackingInitial value)? initial,
    TResult Function(OrderTrackingLoading value)? loading,
    TResult Function(OrderTrackingLoaded value)? loaded,
    TResult Function(OrderTrackingError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class OrderTrackingLoading implements OrderTrackingState {
  const factory OrderTrackingLoading() = _$OrderTrackingLoadingImpl;
}

/// @nodoc
abstract class _$$OrderTrackingLoadedImplCopyWith<$Res> {
  factory _$$OrderTrackingLoadedImplCopyWith(_$OrderTrackingLoadedImpl value,
          $Res Function(_$OrderTrackingLoadedImpl) then) =
      __$$OrderTrackingLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<OrderModel> activeOrders,
      List<OrderModel> completedOrders,
      OrderTrackingFilter currentFilter,
      String searchQuery});
}

/// @nodoc
class __$$OrderTrackingLoadedImplCopyWithImpl<$Res>
    extends _$OrderTrackingStateCopyWithImpl<$Res, _$OrderTrackingLoadedImpl>
    implements _$$OrderTrackingLoadedImplCopyWith<$Res> {
  __$$OrderTrackingLoadedImplCopyWithImpl(_$OrderTrackingLoadedImpl _value,
      $Res Function(_$OrderTrackingLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeOrders = null,
    Object? completedOrders = null,
    Object? currentFilter = null,
    Object? searchQuery = null,
  }) {
    return _then(_$OrderTrackingLoadedImpl(
      activeOrders: null == activeOrders
          ? _value._activeOrders
          : activeOrders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>,
      completedOrders: null == completedOrders
          ? _value._completedOrders
          : completedOrders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>,
      currentFilter: null == currentFilter
          ? _value.currentFilter
          : currentFilter // ignore: cast_nullable_to_non_nullable
              as OrderTrackingFilter,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OrderTrackingLoadedImpl implements OrderTrackingLoaded {
  const _$OrderTrackingLoadedImpl(
      {required final List<OrderModel> activeOrders,
      required final List<OrderModel> completedOrders,
      this.currentFilter = OrderTrackingFilter.all,
      this.searchQuery = ''})
      : _activeOrders = activeOrders,
        _completedOrders = completedOrders;

  final List<OrderModel> _activeOrders;
  @override
  List<OrderModel> get activeOrders {
    if (_activeOrders is EqualUnmodifiableListView) return _activeOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeOrders);
  }

  final List<OrderModel> _completedOrders;
  @override
  List<OrderModel> get completedOrders {
    if (_completedOrders is EqualUnmodifiableListView) return _completedOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedOrders);
  }

  @override
  @JsonKey()
  final OrderTrackingFilter currentFilter;
  @override
  @JsonKey()
  final String searchQuery;

  @override
  String toString() {
    return 'OrderTrackingState.loaded(activeOrders: $activeOrders, completedOrders: $completedOrders, currentFilter: $currentFilter, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderTrackingLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._activeOrders, _activeOrders) &&
            const DeepCollectionEquality()
                .equals(other._completedOrders, _completedOrders) &&
            (identical(other.currentFilter, currentFilter) ||
                other.currentFilter == currentFilter) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_activeOrders),
      const DeepCollectionEquality().hash(_completedOrders),
      currentFilter,
      searchQuery);

  /// Create a copy of OrderTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderTrackingLoadedImplCopyWith<_$OrderTrackingLoadedImpl> get copyWith =>
      __$$OrderTrackingLoadedImplCopyWithImpl<_$OrderTrackingLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<OrderModel> activeOrders,
            List<OrderModel> completedOrders,
            OrderTrackingFilter currentFilter,
            String searchQuery)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(activeOrders, completedOrders, currentFilter, searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<OrderModel> activeOrders,
            List<OrderModel> completedOrders,
            OrderTrackingFilter currentFilter,
            String searchQuery)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(
        activeOrders, completedOrders, currentFilter, searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<OrderModel> activeOrders,
            List<OrderModel> completedOrders,
            OrderTrackingFilter currentFilter,
            String searchQuery)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(activeOrders, completedOrders, currentFilter, searchQuery);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderTrackingInitial value) initial,
    required TResult Function(OrderTrackingLoading value) loading,
    required TResult Function(OrderTrackingLoaded value) loaded,
    required TResult Function(OrderTrackingError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderTrackingInitial value)? initial,
    TResult? Function(OrderTrackingLoading value)? loading,
    TResult? Function(OrderTrackingLoaded value)? loaded,
    TResult? Function(OrderTrackingError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderTrackingInitial value)? initial,
    TResult Function(OrderTrackingLoading value)? loading,
    TResult Function(OrderTrackingLoaded value)? loaded,
    TResult Function(OrderTrackingError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class OrderTrackingLoaded implements OrderTrackingState {
  const factory OrderTrackingLoaded(
      {required final List<OrderModel> activeOrders,
      required final List<OrderModel> completedOrders,
      final OrderTrackingFilter currentFilter,
      final String searchQuery}) = _$OrderTrackingLoadedImpl;

  List<OrderModel> get activeOrders;
  List<OrderModel> get completedOrders;
  OrderTrackingFilter get currentFilter;
  String get searchQuery;

  /// Create a copy of OrderTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderTrackingLoadedImplCopyWith<_$OrderTrackingLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrderTrackingErrorImplCopyWith<$Res> {
  factory _$$OrderTrackingErrorImplCopyWith(_$OrderTrackingErrorImpl value,
          $Res Function(_$OrderTrackingErrorImpl) then) =
      __$$OrderTrackingErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$OrderTrackingErrorImplCopyWithImpl<$Res>
    extends _$OrderTrackingStateCopyWithImpl<$Res, _$OrderTrackingErrorImpl>
    implements _$$OrderTrackingErrorImplCopyWith<$Res> {
  __$$OrderTrackingErrorImplCopyWithImpl(_$OrderTrackingErrorImpl _value,
      $Res Function(_$OrderTrackingErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$OrderTrackingErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OrderTrackingErrorImpl implements OrderTrackingError {
  const _$OrderTrackingErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'OrderTrackingState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderTrackingErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of OrderTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderTrackingErrorImplCopyWith<_$OrderTrackingErrorImpl> get copyWith =>
      __$$OrderTrackingErrorImplCopyWithImpl<_$OrderTrackingErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<OrderModel> activeOrders,
            List<OrderModel> completedOrders,
            OrderTrackingFilter currentFilter,
            String searchQuery)
        loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<OrderModel> activeOrders,
            List<OrderModel> completedOrders,
            OrderTrackingFilter currentFilter,
            String searchQuery)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<OrderModel> activeOrders,
            List<OrderModel> completedOrders,
            OrderTrackingFilter currentFilter,
            String searchQuery)?
        loaded,
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
    required TResult Function(OrderTrackingInitial value) initial,
    required TResult Function(OrderTrackingLoading value) loading,
    required TResult Function(OrderTrackingLoaded value) loaded,
    required TResult Function(OrderTrackingError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OrderTrackingInitial value)? initial,
    TResult? Function(OrderTrackingLoading value)? loading,
    TResult? Function(OrderTrackingLoaded value)? loaded,
    TResult? Function(OrderTrackingError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderTrackingInitial value)? initial,
    TResult Function(OrderTrackingLoading value)? loading,
    TResult Function(OrderTrackingLoaded value)? loaded,
    TResult Function(OrderTrackingError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class OrderTrackingError implements OrderTrackingState {
  const factory OrderTrackingError(final String message) =
      _$OrderTrackingErrorImpl;

  String get message;

  /// Create a copy of OrderTrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderTrackingErrorImplCopyWith<_$OrderTrackingErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
