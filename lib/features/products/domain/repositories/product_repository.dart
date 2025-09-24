import '../models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getAllProducts();
  Future<List<ProductModel>> getProductsByCategory(String category);
  Future<List<ProductModel>> searchProducts(String query);
  Future<List<String>> getCategories();
  Future<ProductModel?> getProductById(String id);
  Future<List<ProductModel>> getAvailableProducts();

  // Progressive loading methods
  Future<List<ProductModel>> getInitialProducts();
  Future<void> loadRemainingProducts();
}
