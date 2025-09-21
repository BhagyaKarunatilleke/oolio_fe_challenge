import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/models/product_model.dart';

part 'product_detail_state.freezed.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState.initial() = ProductDetailInitial;

  const factory ProductDetailState.loading() = ProductDetailLoading;

  const factory ProductDetailState.loaded({
    required ProductModel product,
    @Default([]) List<String> selectedVariants,
    @Default([]) List<String> selectedAddons,
    @Default('') String specialInstructions,
    @Default(1) int quantity,
    required double totalPrice,
  }) = ProductDetailLoaded;

  const factory ProductDetailState.error(String message) = ProductDetailError;
}
