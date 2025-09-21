import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/product_cubit.dart';
import '../widgets/product_card.dart';
import '../widgets/product_search_bar.dart';
import '../widgets/category_filter.dart';
import '../../../cart/presentation/cubit/cart_cubit.dart';
import '../../../cart/domain/models/cart_item_model.dart';
import '../../../cart/presentation/widgets/cart_floating_button.dart';
import '../../../cart/presentation/pages/cart_page.dart';
import '../pages/product_detail_page.dart';

class ProductCatalogPage extends StatelessWidget {
  const ProductCatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Truck Menu'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoaded) {
                return IconButton(
                  icon: Icon(
                    state.viewMode == ProductViewMode.grid
                        ? Icons.view_list
                        : Icons.view_module,
                  ),
                  onPressed: () {
                    context.read<ProductCubit>().toggleViewMode();
                  },
                  tooltip: state.viewMode == ProductViewMode.grid
                      ? 'List View'
                      : 'Grid View',
                );
              }
              return const SizedBox.shrink();
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<ProductCubit>().refreshProducts();
            },
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductInitial) {
            context.read<ProductCubit>().loadProducts();
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProductError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text(
                    'Error loading products',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.message,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ProductCubit>().loadProducts();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is ProductLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                await context.read<ProductCubit>().refreshProducts();
              },
              child: Column(
                children: [
                  // Search Bar
                  ProductSearchBar(
                    query: state.searchQuery,
                    onQueryChanged: (query) {
                      context.read<ProductCubit>().searchProducts(query);
                    },
                  ),

                  // Category Filter
                  CategoryFilter(
                    categories: state.categories,
                    selectedCategory: state.selectedCategory,
                    onCategorySelected: (category) {
                      context.read<ProductCubit>().filterByCategory(category);
                    },
                  ),

                  // Products Count
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${state.products.length} products found',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Colors.grey[600]),
                        ),
                        if (state.searchQuery.isNotEmpty)
                          TextButton(
                            onPressed: () {
                              context.read<ProductCubit>().searchProducts('');
                            },
                            child: const Text('Clear Search'),
                          ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Products List
                  Expanded(
                    child: state.products.isEmpty
                        ? _buildEmptyState(context, state)
                        : _buildProductsList(context, state),
                  ),
                ],
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: const CartFloatingButton(),
    );
  }

  Widget _buildEmptyState(BuildContext context, ProductLoaded state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            state.searchQuery.isNotEmpty
                ? 'No products found'
                : 'No products available',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            state.searchQuery.isNotEmpty
                ? 'Try adjusting your search or filters'
                : 'Check back later for new items',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
          if (state.searchQuery.isNotEmpty) ...[
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<ProductCubit>().searchProducts('');
              },
              child: const Text('Clear Search'),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildProductsList(BuildContext context, ProductLoaded state) {
    if (state.viewMode == ProductViewMode.list) {
      return ListView.builder(
        padding: const EdgeInsets.only(bottom: 16),
        itemCount: state.products.length,
        itemBuilder: (context, index) {
          final product = state.products[index];
          return ProductCard(
            product: product,
            isListView: true,
            onTap: () {
              _navigateToProductDetail(context, product);
            },
            onAddToCart: () {
              _addToCart(context, product);
            },
            onCustomize: () {
              _navigateToProductDetail(context, product);
            },
          );
        },
      );
    } else {
      return GridView.builder(
        padding: const EdgeInsets.all(16),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _getCrossAxisCount(context),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          mainAxisExtent: 300,
        ),
        itemCount: state.products.length,
        itemBuilder: (context, index) {
          final product = state.products[index];
          return ProductCard(
            product: product,
            isListView: false,
            onTap: () {
              _navigateToProductDetail(context, product);
            },
            onAddToCart: () {
              _addToCart(context, product);
            },
            onCustomize: () {
              _navigateToProductDetail(context, product);
            },
          );
        },
      );
    }
  }

  int _getCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1200) {
      return 4; // Large tablets/desktop
    } else if (width > 800) {
      return 3; // Medium tablets
    } else if (width > 600) {
      return 2; // Small tablets
    } else {
      return 2; // Mobile phones
    }
  }

  void _addToCart(BuildContext context, product) {
    final cartItem = CartItemModel.create(
      productId: product.id,
      productName: product.name,
      productDescription: product.description,
      unitPrice: product.price,
      quantity: 1,
      imageUrl: product.metadata?['imageUrl'],
    );

    context.read<CartCubit>().addItemToCart(cartItem);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} added to cart'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'View Cart',
          onPressed: () {
            // Navigate to cart page
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => const CartPage()));
          },
        ),
      ),
    );
  }

  void _navigateToProductDetail(BuildContext context, product) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProductDetailPage(productId: product.id),
      ),
    );
  }
}
