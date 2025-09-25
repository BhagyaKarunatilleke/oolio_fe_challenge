import 'package:injectable/injectable.dart';

/// Service for managing product category images
@singleton
class ImageService {
  /// Maps product categories to their corresponding image paths
  static const Map<String, String> _categoryImageMap = {
    'appetizers': 'assets/images/Appetizers.jpg',
    'beverages': 'assets/images/Beverages.jpg',
    'burgers': 'assets/images/Burgers.jpg',
    'desserts': 'assets/images/Desserts.jpg',
    'pasta': 'assets/images/Pasta.jpg',
    'pizza': 'assets/images/Pizza.jpg',
    'salads': 'assets/images/Salads.jpg',
    'sandwiches': 'assets/images/Sandwiches.jpg',
    'sides': 'assets/images/Sides.jpg',
    'soups': 'assets/images/Soups.jpg',
  };

  /// Default image path for categories without specific images
  static const String _defaultImagePath = 'assets/images/Burgers.jpg';

  /// Get the image path for a given category
  /// Returns the default image if category is not found
  String getCategoryImagePath(String category) {
    final normalizedCategory = category.toLowerCase().trim();
    return _categoryImageMap[normalizedCategory] ?? _defaultImagePath;
  }

  /// Check if an image exists for a given category
  bool hasCategoryImage(String category) {
    final normalizedCategory = category.toLowerCase().trim();
    return _categoryImageMap.containsKey(normalizedCategory);
  }

  /// Get all available category image paths
  List<String> getAllCategoryImagePaths() {
    return _categoryImageMap.values.toList();
  }

  /// Get all available categories that have images
  List<String> getAllCategoriesWithImages() {
    return _categoryImageMap.keys.toList();
  }

  /// Get a fallback image path for unknown categories
  String getFallbackImagePath() {
    return _defaultImagePath;
  }
}
