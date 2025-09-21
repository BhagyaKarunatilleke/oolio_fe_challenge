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

  Future<List<ProductModel>> _createMockProducts() async {
    final mockProducts = [
      // Burgers
      ProductModel.create(
        name: 'Classic Burger',
        description:
            'Juicy beef patty with lettuce, tomato, onion, and our special sauce',
        price: 12.99,
        category: 'Burgers',
        tags: ['beef', 'classic', 'popular'],
        stockQuantity: 50,
        variants: [
          ProductVariant(name: 'Single', priceModifier: 0.0, isDefault: true),
          ProductVariant(name: 'Double', priceModifier: 4.0),
        ],
        addons: [
          ProductAddon(name: 'Extra Cheese', price: 1.50),
          ProductAddon(name: 'Bacon', price: 2.50),
          ProductAddon(name: 'Avocado', price: 2.0),
        ],
      ),

      ProductModel.create(
        name: 'Chicken Burger',
        description:
            'Grilled chicken breast with crispy lettuce, tomato, and mayo',
        price: 11.99,
        category: 'Burgers',
        tags: ['chicken', 'grilled', 'healthy'],
        stockQuantity: 30,
        variants: [
          ProductVariant(name: 'Regular', priceModifier: 0.0, isDefault: true),
          ProductVariant(name: 'Spicy', priceModifier: 0.0),
        ],
        addons: [
          ProductAddon(name: 'Extra Chicken', price: 3.0),
          ProductAddon(name: 'Grilled Onions', price: 1.0),
        ],
      ),

      // Sandwiches
      ProductModel.create(
        name: 'Turkey Club',
        description:
            'Sliced turkey, bacon, lettuce, tomato, and mayo on artisan bread',
        price: 10.99,
        category: 'Sandwiches',
        tags: ['turkey', 'club', 'artisan'],
        stockQuantity: 25,
        variants: [
          ProductVariant(name: 'Half', priceModifier: -2.0, isDefault: true),
          ProductVariant(name: 'Full', priceModifier: 0.0),
        ],
        addons: [
          ProductAddon(name: 'Extra Turkey', price: 2.50),
          ProductAddon(name: 'Extra Bacon', price: 2.0),
        ],
      ),

      ProductModel.create(
        name: 'Veggie Wrap',
        description:
            'Fresh vegetables, hummus, and sprouts in a whole wheat wrap',
        price: 9.99,
        category: 'Sandwiches',
        tags: ['vegetarian', 'healthy', 'fresh'],
        stockQuantity: 20,
        addons: [
          ProductAddon(name: 'Extra Hummus', price: 1.50),
          ProductAddon(name: 'Avocado', price: 2.0),
        ],
      ),

      // Salads
      ProductModel.create(
        name: 'Caesar Salad',
        description:
            'Fresh romaine lettuce, croutons, parmesan cheese, and caesar dressing',
        price: 8.99,
        category: 'Salads',
        tags: ['caesar', 'fresh', 'classic'],
        stockQuantity: 15,
        variants: [
          ProductVariant(name: 'Small', priceModifier: -2.0, isDefault: true),
          ProductVariant(name: 'Large', priceModifier: 2.0),
        ],
        addons: [
          ProductAddon(name: 'Grilled Chicken', price: 4.0),
          ProductAddon(name: 'Extra Croutons', price: 1.0),
        ],
      ),

      ProductModel.create(
        name: 'Garden Salad',
        description:
            'Mixed greens, cherry tomatoes, cucumbers, carrots, and balsamic vinaigrette',
        price: 7.99,
        category: 'Salads',
        tags: ['garden', 'fresh', 'light'],
        stockQuantity: 12,
        addons: [
          ProductAddon(name: 'Grilled Chicken', price: 4.0),
          ProductAddon(name: 'Feta Cheese', price: 2.0),
        ],
      ),

      // Beverages
      ProductModel.create(
        name: 'Fresh Lemonade',
        description: 'Freshly squeezed lemon juice with sparkling water',
        price: 3.99,
        category: 'Beverages',
        tags: ['fresh', 'lemonade', 'refreshing'],
        stockQuantity: 40,
        variants: [
          ProductVariant(name: 'Regular', priceModifier: 0.0, isDefault: true),
          ProductVariant(name: 'Large', priceModifier: 1.0),
        ],
        addons: [
          ProductAddon(name: 'Extra Lemon', price: 0.50),
          ProductAddon(name: 'Mint', price: 0.50),
        ],
      ),

      ProductModel.create(
        name: 'Iced Coffee',
        description: 'Cold brew coffee with your choice of milk and sweetener',
        price: 4.99,
        category: 'Beverages',
        tags: ['coffee', 'cold brew', 'caffeinated'],
        stockQuantity: 35,
        variants: [
          ProductVariant(name: 'Small', priceModifier: 0.0, isDefault: true),
          ProductVariant(name: 'Medium', priceModifier: 1.0),
          ProductVariant(name: 'Large', priceModifier: 2.0),
        ],
        addons: [
          ProductAddon(name: 'Extra Shot', price: 1.0),
          ProductAddon(name: 'Oat Milk', price: 0.75),
          ProductAddon(name: 'Vanilla Syrup', price: 0.50),
        ],
      ),

      // Desserts
      ProductModel.create(
        name: 'Chocolate Brownie',
        description:
            'Rich, fudgy chocolate brownie served warm with vanilla ice cream',
        price: 6.99,
        category: 'Desserts',
        tags: ['chocolate', 'brownie', 'warm'],
        stockQuantity: 20,
        addons: [
          ProductAddon(name: 'Extra Ice Cream', price: 1.50),
          ProductAddon(name: 'Chocolate Sauce', price: 1.0),
          ProductAddon(name: 'Whipped Cream', price: 0.75),
        ],
      ),

      ProductModel.create(
        name: 'Apple Pie',
        description:
            'Homemade apple pie with cinnamon and served with vanilla ice cream',
        price: 7.99,
        category: 'Desserts',
        tags: ['apple', 'pie', 'homemade'],
        stockQuantity: 15,
        addons: [
          ProductAddon(name: 'Extra Ice Cream', price: 1.50),
          ProductAddon(name: 'Caramel Sauce', price: 1.0),
        ],
      ),
    ];

    // Save mock products to local storage
    for (final product in mockProducts) {
      await _storage.save(StorageKeys.productsBox, product);
    }

    return mockProducts;
  }
}
