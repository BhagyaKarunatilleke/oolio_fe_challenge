import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import '../../features/orders/domain/models/order_model.dart';
import 'app_router.dart';

/// Centralized navigation service for the POS system
/// Provides type-safe navigation methods and handles navigation state
@singleton
class NavigationService {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  /// Navigate to home (Product Catalog)
  void goHome(BuildContext context) {
    context.go(AppRoutes.home);
  }

  /// Navigate to product detail page
  void goToProductDetail(BuildContext context, String productId) {
    context.go(AppRoutes.getProductDetailRoute(productId));
  }

  /// Navigate to cart page
  void goToCart(BuildContext context) {
    context.go(AppRoutes.cart);
  }

  /// Navigate to checkout page
  void goToCheckout(BuildContext context) {
    context.go(AppRoutes.checkout);
  }

  /// Navigate to order confirmation page
  void goToOrderConfirmation(BuildContext context, OrderModel order) {
    context.go(AppRoutes.orderConfirmation, extra: order);
  }

  /// Navigate to order tracking page
  void goToOrderTracking(BuildContext context) {
    context.go(AppRoutes.orderTracking);
  }

  /// Navigate to order details page
  void goToOrderDetails(BuildContext context, String orderId) {
    context.go(AppRoutes.getOrderDetailsRoute(orderId));
  }

  /// Navigate back to previous screen
  void goBack(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      // If can't pop, go to home
      goHome(context);
    }
  }

  /// Navigate back to home and clear navigation stack
  void goHomeAndClearStack(BuildContext context) {
    context.go(AppRoutes.home);
  }

  /// Replace current screen with new screen
  void replaceWith(BuildContext context, String route, {Object? extra}) {
    context.go(route, extra: extra);
  }

  /// Push new screen onto navigation stack
  void push(BuildContext context, String route, {Object? extra}) {
    context.push(route, extra: extra);
  }

  /// Push and remove all previous screens
  void pushAndRemoveUntil(BuildContext context, String route, {Object? extra}) {
    context.go(route, extra: extra);
  }

  /// Check if navigation is possible
  bool canNavigateBack(BuildContext context) {
    return context.canPop();
  }

  /// Get current route name
  String? getCurrentRoute(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    return location;
  }

  /// Navigate with animation
  void navigateWithAnimation(
    BuildContext context,
    String route, {
    Object? extra,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) {
    // For now, use standard navigation
    // In a more advanced implementation, we could add custom page transitions
    context.go(route, extra: extra);
  }

  /// Show confirmation dialog before navigation
  Future<bool> showNavigationConfirmation(
    BuildContext context,
    String title,
    String message,
  ) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  /// Navigate with confirmation dialog
  Future<void> navigateWithConfirmation(
    BuildContext context,
    String route,
    String title,
    String message, {
    Object? extra,
  }) async {
    final confirmed = await showNavigationConfirmation(context, title, message);
    if (confirmed && context.mounted) {
      context.go(route, extra: extra);
    }
  }
}
