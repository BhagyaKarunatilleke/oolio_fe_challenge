part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;
  final List<String> categories;
  final String selectedCategory;
  final String searchQuery;
  final ProductViewMode viewMode;

  const ProductLoaded({
    required this.products,
    required this.categories,
    this.selectedCategory = 'All',
    this.searchQuery = '',
    this.viewMode = ProductViewMode.grid,
  });

  ProductLoaded copyWith({
    List<ProductModel>? products,
    List<String>? categories,
    String? selectedCategory,
    String? searchQuery,
    ProductViewMode? viewMode,
  }) {
    return ProductLoaded(
      products: products ?? this.products,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      searchQuery: searchQuery ?? this.searchQuery,
      viewMode: viewMode ?? this.viewMode,
    );
  }

  @override
  List<Object?> get props => [
    products,
    categories,
    selectedCategory,
    searchQuery,
    viewMode,
  ];
}

class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object?> get props => [message];
}

enum ProductViewMode { grid, list }
