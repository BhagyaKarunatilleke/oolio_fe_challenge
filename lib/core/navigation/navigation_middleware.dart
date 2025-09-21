import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'navigation_analytics.dart';

/// Navigation middleware to handle analytics and state management
@singleton
class NavigationMiddleware {
  final NavigationAnalytics _analytics;
  String? _currentRoute;
  DateTime? _routeStartTime;

  NavigationMiddleware(this._analytics);

  /// Initialize navigation tracking
  void initialize() {
    _currentRoute = '/';
    _routeStartTime = DateTime.now();
  }

  /// Handle route changes
  void onRouteChanged(BuildContext context, GoRouterState state) {
    final newRoute = state.uri.path;
    final previousRoute = _currentRoute;

    if (previousRoute != null && previousRoute != newRoute) {
      // Record navigation event
      _analytics.recordNavigation(
        from: previousRoute,
        to: newRoute,
        timestamp: DateTime.now(),
        metadata: {
          'query_parameters': state.uri.queryParameters,
          'path_parameters': state.pathParameters,
        },
      );
    }

    _currentRoute = newRoute;
    _routeStartTime = DateTime.now();
  }

  /// Get current route
  String? get currentRoute => _currentRoute;

  /// Get time spent on current route
  Duration? get timeOnCurrentRoute {
    if (_routeStartTime == null) return null;
    return DateTime.now().difference(_routeStartTime!);
  }

  /// Check if user can navigate back
  bool canNavigateBack(BuildContext context) {
    return context.canPop();
  }

  /// Handle back button press
  Future<bool> handleBackButton(BuildContext context) async {
    if (canNavigateBack(context)) {
      context.pop();
      return false; // Don't exit app
    } else {
      // Show exit confirmation dialog
      final shouldExit = await _showExitConfirmation(context);
      return shouldExit;
    }
  }

  /// Show exit confirmation dialog
  Future<bool> _showExitConfirmation(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit App'),
        content: const Text('Are you sure you want to exit the POS system?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Exit'),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  /// Validate navigation state
  bool validateNavigationState(BuildContext context, String targetRoute) {
    // Add validation logic here
    // For example, check if user is logged in, has required permissions, etc.

    switch (targetRoute) {
      case '/checkout':
        // Validate that cart has items
        return _validateCheckoutNavigation(context);
      case '/order-confirmation':
        // Validate that order data exists
        return _validateOrderConfirmationNavigation(context);
      default:
        return true;
    }
  }

  /// Validate checkout navigation
  bool _validateCheckoutNavigation(BuildContext context) {
    // This would typically check cart state
    // For now, we'll assume it's always valid
    return true;
  }

  /// Validate order confirmation navigation
  bool _validateOrderConfirmationNavigation(BuildContext context) {
    // This would typically check if order data exists
    // For now, we'll assume it's always valid
    return true;
  }

  /// Get navigation breadcrumbs
  List<String> getNavigationBreadcrumbs(BuildContext context) {
    final router = GoRouter.of(context);
    final location = router.routerDelegate.currentConfiguration.uri.path;

    // Simple breadcrumb generation
    final segments = location.split('/').where((s) => s.isNotEmpty).toList();
    final breadcrumbs = <String>[];

    String currentPath = '';
    for (final segment in segments) {
      currentPath += '/$segment';
      breadcrumbs.add(_getBreadcrumbLabel(currentPath));
    }

    return breadcrumbs;
  }

  /// Get breadcrumb label for a path
  String _getBreadcrumbLabel(String path) {
    switch (path) {
      case '/':
        return 'Home';
      case '/cart':
        return 'Cart';
      case '/checkout':
        return 'Checkout';
      case '/orders':
        return 'Orders';
      default:
        if (path.startsWith('/product/')) {
          return 'Product Details';
        } else if (path.startsWith('/orders/')) {
          return 'Order Details';
        }
        return 'Unknown';
    }
  }

  /// Get navigation analytics summary
  Map<String, dynamic> getNavigationSummary() {
    final history = _analytics.getNavigationHistory();
    final stats = _analytics.getNavigationStats();
    final flows = _analytics.getNavigationFlows();
    final sessionDuration = _analytics.getSessionDuration();

    return {
      'total_navigations': history.length,
      'unique_routes_visited': stats.length,
      'most_visited_routes': _analytics.getMostVisitedRoutes(),
      'common_navigation_flows': flows.take(5).toList(),
      'session_duration': sessionDuration.inMinutes,
      'current_route': _currentRoute,
      'time_on_current_route': timeOnCurrentRoute?.inSeconds,
    };
  }
}
