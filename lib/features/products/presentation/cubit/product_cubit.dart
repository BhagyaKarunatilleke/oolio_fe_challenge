import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/models/product_model.dart';

part 'product_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  final ProductRepository _repository;
  Timer? _searchDebounceTimer;

  ProductCubit(this._repository) : super(ProductInitial());

  Future<void> loadProducts() async {
    emit(ProductLoading());
    try {
      final products = await _repository.getAllProducts();
      final categories = await _repository.getCategories();

      emit(
        ProductLoaded(products: products, categories: ['All', ...categories]),
      );
    } catch (e) {
      emit(ProductError('Failed to load products: ${e.toString()}'));
    }
  }

  void searchProducts(String query) {
    // Cancel previous timer
    _searchDebounceTimer?.cancel();

    // Update search query immediately for UI responsiveness
    final currentState = state;
    if (currentState is ProductLoaded) {
      emit(currentState.copyWith(searchQuery: query));
    }

    // Debounce the actual search
    _searchDebounceTimer = Timer(const Duration(milliseconds: 300), () {
      _performSearch(query);
    });
  }

  Future<void> _performSearch(String query) async {
    if (query.isEmpty) {
      await loadProducts();
      return;
    }

    try {
      final currentState = state;
      if (currentState is ProductLoaded) {
        final products = await _repository.searchProducts(query);
        emit(currentState.copyWith(products: products));
      }
    } catch (e) {
      emit(ProductError('Failed to search products: ${e.toString()}'));
    }
  }

  Future<void> filterByCategory(String category) async {
    final currentState = state;
    if (currentState is ProductLoaded) {
      emit(ProductLoading());

      try {
        List<ProductModel> products;
        if (category == 'All') {
          products = await _repository.getAllProducts();
        } else {
          products = await _repository.getProductsByCategory(category);
        }

        emit(
          currentState.copyWith(products: products, selectedCategory: category),
        );
      } catch (e) {
        emit(ProductError('Failed to filter products: ${e.toString()}'));
      }
    }
  }

  void toggleViewMode() {
    final currentState = state;
    if (currentState is ProductLoaded) {
      final newViewMode = currentState.viewMode == ProductViewMode.grid
          ? ProductViewMode.list
          : ProductViewMode.grid;

      emit(currentState.copyWith(viewMode: newViewMode));
    }
  }

  Future<void> refreshProducts() async {
    await loadProducts();
  }

  @override
  Future<void> close() {
    _searchDebounceTimer?.cancel();
    return super.close();
  }
}
