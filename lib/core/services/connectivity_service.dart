import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

/// Service for monitoring device connectivity
@singleton
class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  // Stream controllers for connectivity changes
  final StreamController<bool> _connectivityController =
      StreamController<bool>.broadcast();

  /// Stream of connectivity status changes
  Stream<bool> get connectivityStream => _connectivityController.stream;

  /// Current connectivity status
  bool _isConnected = true;
  bool get isConnected => _isConnected;

  /// Initialize connectivity monitoring
  Future<void> initialize() async {
    // Check initial connectivity status
    await _checkConnectivity();

    // Listen for connectivity changes
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _onConnectivityChanged,
      onError: (error) {
        print('Connectivity error: $error');
      },
    );
  }

  /// Check current connectivity status
  Future<void> _checkConnectivity() async {
    try {
      final connectivityResult = await _connectivity.checkConnectivity();
      final isConnected = _hasInternetConnection(connectivityResult);
      _updateConnectivityStatus(isConnected);
    } catch (e) {
      print('Error checking connectivity: $e');
      _updateConnectivityStatus(false);
    }
  }

  /// Handle connectivity changes
  void _onConnectivityChanged(ConnectivityResult connectivityResult) {
    final isConnected = _hasInternetConnection(connectivityResult);
    _updateConnectivityStatus(isConnected);
  }

  /// Determine if there's an internet connection based on connectivity result
  bool _hasInternetConnection(ConnectivityResult connectivityResult) {
    // Check if we have any connectivity that indicates internet access
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.ethernet;
  }

  /// Update connectivity status and notify listeners
  void _updateConnectivityStatus(bool isConnected) {
    if (_isConnected != isConnected) {
      _isConnected = isConnected;
      _connectivityController.add(_isConnected);
      print('Connectivity changed: ${_isConnected ? "Online" : "Offline"}');
    }
  }

  /// Force check connectivity (useful for manual refresh)
  Future<bool> forceCheckConnectivity() async {
    await _checkConnectivity();
    return _isConnected;
  }

  /// Dispose resources
  void dispose() {
    _connectivitySubscription?.cancel();
    _connectivityController.close();
  }
}
