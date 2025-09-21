import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/di/service_locator.dart';
import '../../domain/models/product_model.dart';
import '../../domain/repositories/product_repository.dart';
import 'product_detail_state.dart';

@injectable
class ProductDetailCubit extends Cubit<ProductDetailState> {
  final ProductRepository _repository;

  ProductDetailCubit()
    : _repository = get<ProductRepository>(),
      super(const ProductDetailState.initial());

  void loadProduct(String productId) async {
    emit(const ProductDetailState.loading());
    try {
      final product = await _repository.getProductById(productId);
      if (product != null) {
        emit(
          ProductDetailState.loaded(
            product: product,
            totalPrice: product.price,
          ),
        );
      } else {
        emit(const ProductDetailState.error('Product not found'));
      }
    } catch (e) {
      emit(ProductDetailState.error('Failed to load product: ${e.toString()}'));
    }
  }

  void selectVariant(String variant) {
    final currentState = state;
    if (currentState is ProductDetailLoaded) {
      final newSelectedVariants = [variant]; // Only one variant can be selected
      final newTotalPrice = _calculateTotalPrice(
        currentState.product,
        newSelectedVariants,
        currentState.selectedAddons,
        currentState.quantity,
      );

      emit(
        currentState.copyWith(
          selectedVariants: newSelectedVariants,
          totalPrice: newTotalPrice,
        ),
      );
    }
  }

  void toggleAddon(String addon) {
    final currentState = state;
    if (currentState is ProductDetailLoaded) {
      final newSelectedAddons = List<String>.from(currentState.selectedAddons);
      if (newSelectedAddons.contains(addon)) {
        newSelectedAddons.remove(addon);
      } else {
        newSelectedAddons.add(addon);
      }

      final newTotalPrice = _calculateTotalPrice(
        currentState.product,
        currentState.selectedVariants,
        newSelectedAddons,
        currentState.quantity,
      );

      emit(
        currentState.copyWith(
          selectedAddons: newSelectedAddons,
          totalPrice: newTotalPrice,
        ),
      );
    }
  }

  void updateSpecialInstructions(String instructions) {
    final currentState = state;
    if (currentState is ProductDetailLoaded) {
      emit(currentState.copyWith(specialInstructions: instructions));
    }
  }

  void updateQuantity(int quantity) {
    final currentState = state;
    if (currentState is ProductDetailLoaded && quantity > 0) {
      final newTotalPrice = _calculateTotalPrice(
        currentState.product,
        currentState.selectedVariants,
        currentState.selectedAddons,
        quantity,
      );

      emit(
        currentState.copyWith(quantity: quantity, totalPrice: newTotalPrice),
      );
    }
  }

  void incrementQuantity() {
    final currentState = state;
    if (currentState is ProductDetailLoaded) {
      updateQuantity(currentState.quantity + 1);
    }
  }

  void decrementQuantity() {
    final currentState = state;
    if (currentState is ProductDetailLoaded && currentState.quantity > 1) {
      updateQuantity(currentState.quantity - 1);
    }
  }

  double _calculateTotalPrice(
    ProductModel product,
    List<String> selectedVariants,
    List<String> selectedAddons,
    int quantity,
  ) {
    double basePrice = product.price;

    // Add variant price
    for (final variantName in selectedVariants) {
      final variant = product.variants.firstWhere(
        (v) => v.name == variantName,
        orElse: () => throw Exception('Variant not found: $variantName'),
      );
      basePrice += variant.priceModifier;
    }

    // Add addon prices
    for (final addonName in selectedAddons) {
      final addon = product.addons.firstWhere(
        (a) => a.name == addonName,
        orElse: () => throw Exception('Addon not found: $addonName'),
      );
      basePrice += addon.price;
    }

    return basePrice * quantity;
  }
}
