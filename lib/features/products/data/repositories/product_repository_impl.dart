import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/storage/storage_service.dart';
import '../../../../core/constants/storage_keys.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/models/product_model.dart';
import '../models/product_variant.dart';
import '../models/product_addon.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final StorageService _storage;

  ProductRepositoryImpl(this._storage);

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      // Try to get products from local storage first
      final localProducts = await _storage.getAll<ProductModel>(
        StorageKeys.productsBox,
      );

      if (localProducts.isNotEmpty) {
        return localProducts;
      }

      // If no local products, create and save mock data
      return await _createMockProducts();
    } catch (e) {
      // Fallback to mock data if storage fails
      return await _createMockProducts();
    }
  }

  /// Load first 100 products immediately for fast initial display
  Future<List<ProductModel>> getInitialProducts() async {
    try {
      // Try to get products from local storage first
      final localProducts = await _storage.getAll<ProductModel>(
        StorageKeys.productsBox,
      );

      if (localProducts.isNotEmpty) {
        return localProducts.take(100).toList();
      }

      // If no local products, load first 100 from assets
      return await _loadInitialProductsFromAssets();
    } catch (e) {
      // Fallback to minimal mock data if loading fails
      return await _createFallbackProducts();
    }
  }

  /// Load remaining products in the background
  Future<void> loadRemainingProducts() async {
    try {
      final localProducts = await _storage.getAll<ProductModel>(
        StorageKeys.productsBox,
      );

      // If we already have all products, no need to load more
      if (localProducts.length >= 1000) {
        return;
      }

      // Load all products from assets and save to storage
      await _createMockProducts();
    } catch (e) {
      print('Failed to load remaining products: $e');
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(String category) async {
    final allProducts = await getAllProducts();
    return allProducts
        .where((product) => product.category == category)
        .toList();
  }

  @override
  Future<List<ProductModel>> searchProducts(String query) async {
    final allProducts = await getAllProducts();
    final lowercaseQuery = query.toLowerCase();

    return allProducts.where((product) {
      return product.name.toLowerCase().contains(lowercaseQuery) ||
          product.description.toLowerCase().contains(lowercaseQuery) ||
          product.tags.any((tag) => tag.toLowerCase().contains(lowercaseQuery));
    }).toList();
  }

  @override
  Future<List<String>> getCategories() async {
    final allProducts = await getAllProducts();
    final categories = allProducts
        .map((product) => product.category)
        .toSet()
        .toList();
    categories.sort();
    return categories;
  }

  @override
  Future<ProductModel?> getProductById(String id) async {
    try {
      return await _storage.get<ProductModel>(StorageKeys.productsBox, id);
    } catch (e) {
      // Fallback to mock data
      final allProducts = await getAllProducts();
      return allProducts.where((product) => product.id == id).firstOrNull;
    }
  }

  @override
  Future<List<ProductModel>> getAvailableProducts() async {
    final allProducts = await getAllProducts();
    return allProducts
        .where((product) => product.isAvailable && product.stockQuantity > 0)
        .toList();
  }

  Future<List<ProductModel>> _loadInitialProductsFromAssets() async {
    try {
      // Load products from assets
      final jsonString = await rootBundle.loadString('assets/products.json');
      final List<dynamic> jsonList = jsonDecode(jsonString);

      // Take only first 100 products for initial load
      final initialProducts = jsonList.take(100).toList();

      final products = initialProducts.map((json) {
        return _convertJsonToProduct(json);
      }).toList();

      // Save initial products to local storage
      for (final product in products) {
        await _storage.save(StorageKeys.productsBox, product);
      }

      return products;
    } catch (e) {
      print('Failed to load initial products from assets: $e');
      return await _createFallbackProducts();
    }
  }

  Future<List<ProductModel>> _createMockProducts() async {
    try {
      // Load products from assets
      final jsonString = await rootBundle.loadString('assets/products.json');
      final List<dynamic> jsonList = jsonDecode(jsonString);

      final products = jsonList.map((json) {
        return _convertJsonToProduct(json);
      }).toList();

      // Save all products to local storage
      for (final product in products) {
        await _storage.save(StorageKeys.productsBox, product);
      }

      return products;
    } catch (e) {
      // Fallback to a minimal set of products if asset loading fails
      print('Failed to load products from assets: $e');
      return await _createFallbackProducts();
    }
  }

  ProductModel _convertJsonToProduct(Map<String, dynamic> json) {
    // Convert variants from JSON
    final variants = <ProductVariant>[];
    if (json['variants'] != null) {
      for (final variantJson in json['variants']) {
        variants.add(
          ProductVariant(
            name: variantJson['name'],
            priceModifier: variantJson['priceModifier'].toDouble(),
            isDefault: variantJson['isDefault'] ?? false,
          ),
        );
      }
    }

    // Convert addons from JSON
    final addons = <ProductAddon>[];
    if (json['addons'] != null) {
      for (final addonJson in json['addons']) {
        addons.add(
          ProductAddon(
            name: addonJson['name'],
            price: addonJson['price'].toDouble(),
          ),
        );
      }
    }

    return ProductModel.create(
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      category: json['category'],
      tags: List<String>.from(json['tags'] ?? []),
      isAvailable: json['isAvailable'] ?? true,
      stockQuantity: json['stockQuantity'] ?? 0,
      variants: variants,
      addons: addons,
    );
  }

  Future<List<ProductModel>> _createFallbackProducts() async {
    final fallbackProducts = [
      ProductModel.create(
        name: 'Classic Burger',
        description:
            'Juicy beef patty with lettuce, tomato, onion, and our special sauce',
        price: 12.99,
        category: 'Burgers',
        tags: ['beef', 'classic', 'popular'],
        stockQuantity: 50,
      ),
      ProductModel.create(
        name: 'Fresh Lemonade',
        description: 'Freshly squeezed lemon juice with sparkling water',
        price: 3.99,
        category: 'Beverages',
        tags: ['fresh', 'lemonade', 'refreshing'],
        stockQuantity: 40,
      ),
    ];

    // Save fallback products to local storage
    for (final product in fallbackProducts) {
      await _storage.save(StorageKeys.productsBox, product);
    }

    return fallbackProducts;
  }
}
