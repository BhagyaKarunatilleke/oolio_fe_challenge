import 'package:flutter/material.dart';
import '../../domain/models/product_model.dart';

class ProductCustomizationWidget extends StatelessWidget {
  final ProductModel product;
  final List<String> selectedVariants;
  final List<String> selectedAddons;
  final String specialInstructions;
  final int quantity;
  final double totalPrice;
  final Function(String) onVariantSelected;
  final Function(String) onAddonToggled;
  final Function(String) onSpecialInstructionsChanged;
  final Function(int) onQuantityChanged;
  final VoidCallback onIncrementQuantity;
  final VoidCallback onDecrementQuantity;
  final VoidCallback onAddToCart;

  const ProductCustomizationWidget({
    super.key,
    required this.product,
    required this.selectedVariants,
    required this.selectedAddons,
    required this.specialInstructions,
    required this.quantity,
    required this.totalPrice,
    required this.onVariantSelected,
    required this.onAddonToggled,
    required this.onSpecialInstructionsChanged,
    required this.onQuantityChanged,
    required this.onIncrementQuantity,
    required this.onDecrementQuantity,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Variants Section
        if (product.variants.isNotEmpty) ...[
          _buildSectionTitle(context, 'Choose Variant'),
          const SizedBox(height: 12),
          _buildVariantSelector(context),
          const SizedBox(height: 24),
        ],

        // Add-ons Section
        if (product.addons.isNotEmpty) ...[
          _buildSectionTitle(context, 'Add-ons'),
          const SizedBox(height: 12),
          _buildAddonSelector(context),
          const SizedBox(height: 24),
        ],

        // Quantity Section
        _buildSectionTitle(context, 'Quantity'),
        const SizedBox(height: 12),
        _buildQuantitySelector(context),
        const SizedBox(height: 24),

        // Special Instructions Section
        _buildSectionTitle(context, 'Special Instructions'),
        const SizedBox(height: 12),
        _buildSpecialInstructionsInput(context),
        const SizedBox(height: 32),

        // Price Summary
        _buildPriceSummary(context),
        const SizedBox(height: 24),

        // Add to Cart Button
        _buildAddToCartButton(context),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
    );
  }

  Widget _buildVariantSelector(BuildContext context) {
    return Column(
      children: product.variants.map((variant) {
        final isSelected = selectedVariants.contains(variant.name);
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: InkWell(
            onTap: () => onVariantSelected(variant.name),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey[300]!,
                  width: isSelected ? 2 : 1,
                ),
                color: isSelected
                    ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                    : Colors.white,
              ),
              child: Row(
                children: [
                  Radio<String>(
                    value: variant.name,
                    groupValue: selectedVariants.isNotEmpty
                        ? selectedVariants.first
                        : null,
                    onChanged: (value) => onVariantSelected(variant.name),
                    activeColor: Theme.of(context).colorScheme.primary,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          variant.name,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  if (variant.priceModifier != 0)
                    Text(
                      variant.priceModifier > 0
                          ? '+\$${variant.priceModifier.toStringAsFixed(2)}'
                          : '\$${variant.priceModifier.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: variant.priceModifier > 0
                            ? Colors.green[600]
                            : Colors.red[600],
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildAddonSelector(BuildContext context) {
    return Column(
      children: product.addons.map((addon) {
        final isSelected = selectedAddons.contains(addon.name);
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: InkWell(
            onTap: () => onAddonToggled(addon.name),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey[300]!,
                  width: isSelected ? 2 : 1,
                ),
                color: isSelected
                    ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                    : Colors.white,
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: isSelected,
                    onChanged: (value) => onAddonToggled(addon.name),
                    activeColor: Theme.of(context).colorScheme.primary,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          addon.name,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '\$${addon.price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.green[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildQuantitySelector(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Quantity',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          Row(
            children: [
              IconButton(
                onPressed: onDecrementQuantity,
                icon: const Icon(Icons.remove),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  shape: const CircleBorder(),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  quantity.toString(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              IconButton(
                onPressed: onIncrementQuantity,
                icon: const Icon(Icons.add),
                style: IconButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  shape: const CircleBorder(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialInstructionsInput(BuildContext context) {
    return TextField(
      onChanged: onSpecialInstructionsChanged,
      maxLines: 3,
      decoration: InputDecoration(
        hintText: 'Any special requests or modifications?',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget _buildPriceSummary(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total Price',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            '\$${totalPrice.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddToCartButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onAddToCart,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_cart),
            const SizedBox(width: 8),
            Text(
              'Add to Cart',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
