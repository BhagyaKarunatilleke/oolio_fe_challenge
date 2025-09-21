import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../main.dart';
import '../cubit/product_detail_cubit.dart';
import '../cubit/product_detail_state.dart';
import '../widgets/product_customization_widget.dart';
import '../../../cart/presentation/cubit/cart_cubit.dart';
import '../../../cart/data/models/cart_item_model.dart';
import '../../../cart/presentation/pages/cart_page.dart';

class ProductDetailPage extends StatelessWidget {
  final String productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailCubit()..loadProduct(productId),
      child: const ProductDetailView(),
    );
  }
}

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<ProductDetailCubit, ProductDetailState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded:
                (
                  product,
                  selectedVariants,
                  selectedAddons,
                  specialInstructions,
                  quantity,
                  totalPrice,
                ) => _buildLoadedContent(
                  context,
                  product,
                  selectedVariants,
                  selectedAddons,
                  specialInstructions,
                  quantity,
                  totalPrice,
                ),
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
                  const SizedBox(height: 16),
                  Text(
                    'Error',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    message,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ProductDetailCubit>().loadProduct(
                        context.read<ProductDetailCubit>().state.maybeWhen(
                          loaded: (product, _, _, _, _, __) => product.id,
                          orElse: () => '',
                        ),
                      );
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoadedContent(
    BuildContext context,
    product,
    List<String> selectedVariants,
    List<String> selectedAddons,
    String specialInstructions,
    int quantity,
    double totalPrice,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[200],
            ),
            child: product.metadata?['imageUrl'] != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      product.metadata!['imageUrl'],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          _buildImagePlaceholder(),
                    ),
                  )
                : _buildImagePlaceholder(),
          ),

          const SizedBox(height: 24),

          // Product Name
          Text(
            product.name,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          // Product Description
          if (product.description.isNotEmpty)
            Text(
              product.description,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
            ),

          const SizedBox(height: 16),

          // Base Price
          Row(
            children: [
              Text(
                'Base Price: ',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Customization Widget
          ProductCustomizationWidget(
            product: product,
            selectedVariants: selectedVariants,
            selectedAddons: selectedAddons,
            specialInstructions: specialInstructions,
            quantity: quantity,
            totalPrice: totalPrice,
            onVariantSelected: (variant) {
              context.read<ProductDetailCubit>().selectVariant(variant);
            },
            onAddonToggled: (addon) {
              context.read<ProductDetailCubit>().toggleAddon(addon);
            },
            onSpecialInstructionsChanged: (instructions) {
              context.read<ProductDetailCubit>().updateSpecialInstructions(
                instructions,
              );
            },
            onQuantityChanged: (newQuantity) {
              context.read<ProductDetailCubit>().updateQuantity(newQuantity);
            },
            onIncrementQuantity: () {
              context.read<ProductDetailCubit>().incrementQuantity();
            },
            onDecrementQuantity: () {
              context.read<ProductDetailCubit>().decrementQuantity();
            },
            onAddToCart: () {
              _addToCart(
                context,
                product,
                selectedVariants,
                selectedAddons,
                specialInstructions,
                quantity,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[300],
      ),
      child: const Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          size: 64,
          color: Colors.grey,
        ),
      ),
    );
  }

  void _addToCart(
    BuildContext context,
    product,
    List<String> selectedVariants,
    List<String> selectedAddons,
    String specialInstructions,
    int quantity,
  ) {
    // Calculate the actual unit price including variants and add-ons
    double calculatedUnitPrice = _calculateUnitPrice(
      product,
      selectedVariants,
      selectedAddons,
    );

    final cartItem = CartItemModel.create(
      productId: product.id,
      productName: product.name,
      productDescription: product.description,
      unitPrice: calculatedUnitPrice,
      quantity: quantity,
      selectedVariants: selectedVariants,
      selectedAddons: selectedAddons,
      specialInstructions: specialInstructions.isNotEmpty
          ? specialInstructions
          : null,
      imageUrl: product.metadata?['imageUrl'],
    );

    context.read<CartCubit>().addItemToCart(cartItem);

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} added to cart'),
        action: SnackBarAction(
          label: 'View Cart',
          onPressed: () {
            // Navigate to cart page using global navigator key
            navigatorKey.currentState?.push(
              MaterialPageRoute(builder: (context) => const CartPage()),
            );
          },
        ),
      ),
    );

    // Pop the page immediately
    Navigator.of(context).pop();
  }

  double _calculateUnitPrice(
    product,
    List<String> selectedVariants,
    List<String> selectedAddons,
  ) {
    double basePrice = product.price;

    // Add variant price modifiers
    for (final variantName in selectedVariants) {
      final variant = product.variants.firstWhere(
        (v) => v.name == variantName,
        orElse: () => throw Exception('Variant not found: $variantName'),
      );
      basePrice += variant.priceModifier;
    }

    // Add add-on prices
    for (final addonName in selectedAddons) {
      final addon = product.addons.firstWhere(
        (a) => a.name == addonName,
        orElse: () => throw Exception('Addon not found: $addonName'),
      );
      basePrice += addon.price;
    }

    return basePrice;
  }
}
