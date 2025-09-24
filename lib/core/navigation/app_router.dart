import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/products/presentation/pages/product_catalog_page.dart';
import '../../features/products/presentation/pages/product_detail_page.dart';
import '../../features/cart/presentation/pages/cart_page.dart';
import '../../features/orders/presentation/pages/checkout_page.dart';
import '../../features/orders/presentation/pages/order_confirmation_page.dart';
import '../../features/orders/presentation/pages/order_tracking_page.dart';
import '../../features/orders/domain/models/order_model.dart';
import '../../features/printing/presentation/pages/print_queue_page.dart';
import '../../features/sync/presentation/pages/sync_management_page.dart';

/// Centralized navigation routes for the POS system
class AppRoutes {
  static const String home = '/';
  static const String productDetail = '/product/:id';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String orderConfirmation = '/order-confirmation';
  static const String orderTracking = '/orders';
  static const String orderDetails = '/orders/:id';
  static const String printQueue = '/print-queue';
  static const String syncManagement = '/sync-management';

  /// Helper method to get product detail route
  static String getProductDetailRoute(String productId) =>
      '/product/$productId';

  /// Helper method to get order details route
  static String getOrderDetailsRoute(String orderId) => '/orders/$orderId';
}

/// App router configuration using go_router for better navigation management
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (context, state) => const ProductCatalogPage(),
      ),
      GoRoute(
        path: AppRoutes.productDetail,
        name: 'product-detail',
        builder: (context, state) {
          final productId = state.pathParameters['id']!;
          return ProductDetailPage(productId: productId);
        },
      ),
      GoRoute(
        path: AppRoutes.cart,
        name: 'cart',
        builder: (context, state) => const CartPage(),
      ),
      GoRoute(
        path: AppRoutes.checkout,
        name: 'checkout',
        builder: (context, state) => const CheckoutPage(),
      ),
      GoRoute(
        path: AppRoutes.orderConfirmation,
        name: 'order-confirmation',
        builder: (context, state) {
          final order = state.extra as OrderModel?;
          if (order == null) {
            // Redirect to home if no order data
            return const ProductCatalogPage();
          }
          return OrderConfirmationPage(order: order);
        },
      ),
      GoRoute(
        path: AppRoutes.orderTracking,
        name: 'order-tracking',
        builder: (context, state) {
          // Check if we should go to home when back button is pressed
          final shouldGoToHome =
              state.uri.queryParameters['fromConfirmation'] == 'true';
          return OrderTrackingPage(shouldGoToHome: shouldGoToHome);
        },
      ),
      GoRoute(
        path: AppRoutes.orderDetails,
        name: 'order-details',
        builder: (context, state) {
          // TODO: Implement OrderDetailsPage with state.pathParameters['id']
          return const OrderTrackingPage(); // Temporary fallback
        },
      ),
      GoRoute(
        path: AppRoutes.printQueue,
        name: 'print-queue',
        builder: (context, state) => const PrintQueuePage(),
      ),
      GoRoute(
        path: AppRoutes.syncManagement,
        name: 'sync-management',
        builder: (context, state) => const SyncManagementPage(),
      ),
    ],
    errorBuilder: (context, state) => _buildErrorPage(context, state.error),
  );

  static Widget _buildErrorPage(BuildContext context, Exception? error) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Error'),
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Navigation Error',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              error?.toString() ?? 'An unknown error occurred',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => context.go(AppRoutes.home),
              icon: const Icon(Icons.home),
              label: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
