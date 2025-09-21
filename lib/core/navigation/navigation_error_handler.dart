import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'app_router.dart';

/// Comprehensive error handler for navigation edge cases
@singleton
class NavigationErrorHandler {
  /// Handle navigation errors globally
  static void handleNavigationError(
    BuildContext context,
    Object error,
    StackTrace? stackTrace,
  ) {
    print('Navigation Error: $error');
    print('Stack Trace: $stackTrace');

    // Show user-friendly error message
    _showNavigationErrorDialog(context, error);

    // Log error for debugging (in production, this would go to a logging service)
    _logNavigationError(error, stackTrace);
  }

  /// Show navigation error dialog to user
  static void _showNavigationErrorDialog(BuildContext context, Object error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.error_outline, color: Colors.red),
            SizedBox(width: 8),
            Text('Navigation Error'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Something went wrong while navigating.'),
            const SizedBox(height: 8),
            Text(
              _getUserFriendlyErrorMessage(error),
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Navigate to home as fallback
              context.go(AppRoutes.home);
            },
            child: const Text('Go Home'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  /// Get user-friendly error message
  static String _getUserFriendlyErrorMessage(Object error) {
    final errorString = error.toString().toLowerCase();

    if (errorString.contains('route not found')) {
      return 'The requested page could not be found.';
    } else if (errorString.contains('permission denied')) {
      return 'You do not have permission to access this page.';
    } else if (errorString.contains('network')) {
      return 'Network connection is required for this action.';
    } else if (errorString.contains('timeout')) {
      return 'The request timed out. Please try again.';
    } else if (errorString.contains('invalid parameter')) {
      return 'Invalid data provided. Please check your input.';
    } else {
      return 'An unexpected error occurred. Please try again.';
    }
  }

  /// Log navigation error for debugging
  static void _logNavigationError(Object error, StackTrace? stackTrace) {
    // In production, this would send to a logging service like Sentry, Crashlytics, etc.
    final timestamp = DateTime.now().toIso8601String();
    final logEntry = {
      'timestamp': timestamp,
      'error': error.toString(),
      'stackTrace': stackTrace?.toString(),
      'type': 'navigation_error',
    };

    // For now, just print to console
    print('Navigation Error Log: $logEntry');
  }

  /// Handle route not found errors
  static void handleRouteNotFound(BuildContext context, String route) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Page Not Found'),
        content: Text('The page "$route" could not be found.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.go(AppRoutes.home);
            },
            child: const Text('Go Home'),
          ),
        ],
      ),
    );
  }

  /// Handle navigation timeout
  static void handleNavigationTimeout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Navigation Timeout'),
        content: const Text(
          'Navigation is taking longer than expected. Please try again.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.go(AppRoutes.home);
            },
            child: const Text('Go Home'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Retry navigation
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  /// Handle navigation permission errors
  static void handlePermissionError(BuildContext context, String permission) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permission Required'),
        content: Text('You need permission to access $permission.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  /// Handle navigation state errors
  static void handleNavigationStateError(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Navigation Error'),
        content: Text('Navigation state error: $error'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.go(AppRoutes.home);
            },
            child: const Text('Go Home'),
          ),
        ],
      ),
    );
  }

  /// Handle critical navigation errors that require app restart
  static void handleCriticalNavigationError(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Critical Error'),
        content: const Text(
          'A critical navigation error occurred. The app will restart.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // In a real app, this would restart the app
              context.go(AppRoutes.home);
            },
            child: const Text('Restart'),
          ),
        ],
      ),
    );
  }

  /// Validate navigation parameters
  static bool validateNavigationParameters(
    String route,
    Map<String, dynamic> parameters,
  ) {
    switch (route) {
      case AppRoutes.productDetail:
        return parameters.containsKey('id') && parameters['id'] != null;
      case AppRoutes.orderDetails:
        return parameters.containsKey('id') && parameters['id'] != null;
      case AppRoutes.orderConfirmation:
        return parameters.containsKey('order') && parameters['order'] != null;
      default:
        return true;
    }
  }

  /// Handle invalid navigation parameters
  static void handleInvalidParameters(
    BuildContext context,
    String route,
    Map<String, dynamic> parameters,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Invalid Parameters'),
        content: Text('Invalid parameters for route: $route'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.go(AppRoutes.home);
            },
            child: const Text('Go Home'),
          ),
        ],
      ),
    );
  }

  /// Handle navigation during critical operations
  static Future<bool> handleNavigationDuringCriticalOperation(
    BuildContext context,
    String operation,
  ) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Operation in Progress'),
        content: Text(
          '$operation is in progress. Are you sure you want to leave?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Stay'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Leave'),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  /// Handle navigation with unsaved changes
  static Future<bool> handleNavigationWithUnsavedChanges(
    BuildContext context,
  ) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Unsaved Changes'),
        content: const Text(
          'You have unsaved changes. Are you sure you want to leave?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Stay'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Leave'),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  /// Handle navigation with network connectivity issues
  static void handleNetworkConnectivityError(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Network Error'),
        content: const Text(
          'Network connection is required for this action. Please check your connection.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  /// Handle navigation with authentication errors
  static void handleAuthenticationError(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Authentication Error'),
        content: const Text('Your session has expired. Please log in again.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.go(AppRoutes.home);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  /// Handle navigation with data synchronization errors
  static void handleDataSyncError(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Data Sync Error'),
        content: Text('Data synchronization failed: $error'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.go(AppRoutes.home);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  /// Handle navigation with validation errors
  static void handleValidationError(
    BuildContext context,
    String field,
    String error,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Validation Error'),
        content: Text('Invalid $field: $error'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
