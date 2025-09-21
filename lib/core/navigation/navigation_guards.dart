import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/cart/presentation/cubit/cart_cubit.dart';
import '../../../features/cart/domain/models/cart_model.dart';
import '../../../features/orders/domain/models/order_model.dart';
import 'app_router.dart';

/// Navigation guards to protect routes and ensure proper navigation flow
class NavigationGuards {
  /// Guard for checkout route - ensures cart has items
  static bool checkoutGuard(BuildContext context, GoRouterState state) {
    final cartCubit = context.read<CartCubit>();
    final cartState = cartCubit.state;

    if (cartState is CartLoaded && cartState.cart.itemCount == 0) {
      // Show error message and redirect to cart
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Your cart is empty. Add items before checkout.'),
          backgroundColor: Colors.orange,
        ),
      );
      context.go(AppRoutes.cart);
      return false;
    }

    return true;
  }

  /// Guard for order confirmation route - ensures order data exists
  static bool orderConfirmationGuard(
    BuildContext context,
    GoRouterState state,
  ) {
    final order = state.extra as OrderModel?;

    if (order == null) {
      // Redirect to home if no order data
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No order data found. Redirecting to home.'),
          backgroundColor: Colors.red,
        ),
      );
      context.go(AppRoutes.home);
      return false;
    }

    return true;
  }

  /// Guard for product detail route - ensures product ID exists
  static bool productDetailGuard(BuildContext context, GoRouterState state) {
    final productId = state.pathParameters['id'];

    if (productId == null || productId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid product ID. Redirecting to home.'),
          backgroundColor: Colors.red,
        ),
      );
      context.go(AppRoutes.home);
      return false;
    }

    return true;
  }

  /// Guard for order details route - ensures order ID exists
  static bool orderDetailsGuard(BuildContext context, GoRouterState state) {
    final orderId = state.pathParameters['id'];

    if (orderId == null || orderId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid order ID. Redirecting to orders.'),
          backgroundColor: Colors.red,
        ),
      );
      context.go(AppRoutes.orderTracking);
      return false;
    }

    return true;
  }

  /// Guard for cart route - ensures cart state is loaded
  static bool cartGuard(BuildContext context, GoRouterState state) {
    final cartCubit = context.read<CartCubit>();
    final cartState = cartCubit.state;

    if (cartState is CartLoading) {
      // Show loading indicator
      return true;
    }

    if (cartState is CartError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error loading cart: ${cartState.message}'),
          backgroundColor: Colors.red,
        ),
      );
    }

    return true;
  }

  /// Guard for order tracking route - ensures order data is available
  static bool orderTrackingGuard(BuildContext context, GoRouterState state) {
    // This could check if the user has permission to view orders
    // For now, we'll always allow access
    return true;
  }

  /// Generic guard that checks if navigation is allowed
  static bool genericGuard(BuildContext context, GoRouterState state) {
    // Add any generic checks here
    // For example, check if app is in maintenance mode, user permissions, etc.
    return true;
  }

  /// Guard that prevents navigation during critical operations
  static bool criticalOperationGuard(
    BuildContext context,
    GoRouterState state,
  ) {
    // Check if any critical operations are in progress
    // For example, payment processing, order submission, etc.

    // This would typically check some global state or cubit state
    // For now, we'll always allow navigation
    return true;
  }

  /// Guard that ensures proper authentication state
  static bool authenticationGuard(BuildContext context, GoRouterState state) {
    // Since this is a POS system without authentication,
    // we'll always allow navigation
    // In a real app, this would check authentication state
    return true;
  }

  /// Guard that checks app connectivity
  static bool connectivityGuard(BuildContext context, GoRouterState state) {
    // This would check network connectivity
    // For now, we'll always allow navigation since this is an offline-first app
    return true;
  }

  /// Guard that validates route parameters
  static bool parameterValidationGuard(
    BuildContext context,
    GoRouterState state,
  ) {
    // Validate route parameters based on the route
    switch (state.uri.path) {
      case AppRoutes.productDetail:
        return productDetailGuard(context, state);
      case AppRoutes.orderDetails:
        return orderDetailsGuard(context, state);
      default:
        return true;
    }
  }

  /// Combined guard that runs all applicable guards
  static bool combinedGuard(BuildContext context, GoRouterState state) {
    // Run guards in order of importance

    // 1. Generic checks first
    if (!genericGuard(context, state)) return false;

    // 2. Authentication checks
    if (!authenticationGuard(context, state)) return false;

    // 3. Connectivity checks
    if (!connectivityGuard(context, state)) return false;

    // 4. Critical operation checks
    if (!criticalOperationGuard(context, state)) return false;

    // 5. Parameter validation
    if (!parameterValidationGuard(context, state)) return false;

    // 6. Route-specific guards
    switch (state.uri.path) {
      case AppRoutes.checkout:
        return checkoutGuard(context, state);
      case AppRoutes.orderConfirmation:
        return orderConfirmationGuard(context, state);
      case AppRoutes.cart:
        return cartGuard(context, state);
      case AppRoutes.orderTracking:
        return orderTrackingGuard(context, state);
      default:
        return true;
    }
  }
}
