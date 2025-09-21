import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

/// Navigation analytics service to track user navigation patterns
/// This helps understand user behavior and optimize navigation flow
@singleton
class NavigationAnalytics {
  static const String _navigationHistoryKey = 'navigation_history';
  static const String _navigationStatsKey = 'navigation_stats';
  static const int _maxHistorySize = 100;

  final SharedPreferences _prefs;

  NavigationAnalytics(this._prefs);

  /// Record a navigation event
  Future<void> recordNavigation({
    required String from,
    required String to,
    required DateTime timestamp,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      // Record navigation history
      await _addToHistory(
        NavigationEvent(
          from: from,
          to: to,
          timestamp: timestamp,
          metadata: metadata ?? {},
        ),
      );

      // Update navigation statistics
      await _updateStats(to);
    } catch (e) {
      // Silently fail for analytics - don't break user experience
      // Could log to a proper logging service in production
    }
  }

  /// Add navigation event to history
  Future<void> _addToHistory(NavigationEvent event) async {
    final historyJson = _prefs.getString(_navigationHistoryKey);
    List<Map<String, dynamic>> history = [];

    if (historyJson != null) {
      final List<dynamic> decoded = json.decode(historyJson);
      history = decoded.cast<Map<String, dynamic>>();
    }

    // Add new event
    history.add(event.toJson());

    // Keep only recent history
    if (history.length > _maxHistorySize) {
      history = history.sublist(history.length - _maxHistorySize);
    }

    await _prefs.setString(_navigationHistoryKey, json.encode(history));
  }

  /// Update navigation statistics
  Future<void> _updateStats(String route) async {
    final statsJson = _prefs.getString(_navigationStatsKey);
    Map<String, int> stats = {};

    if (statsJson != null) {
      final Map<String, dynamic> decoded = json.decode(statsJson);
      stats = decoded.map((key, value) => MapEntry(key, value as int));
    }

    // Increment visit count for this route
    stats[route] = (stats[route] ?? 0) + 1;

    await _prefs.setString(_navigationStatsKey, json.encode(stats));
  }

  /// Get navigation history
  List<NavigationEvent> getNavigationHistory() {
    final historyJson = _prefs.getString(_navigationHistoryKey);
    if (historyJson == null) return [];

    try {
      final List<dynamic> decoded = json.decode(historyJson);
      return decoded
          .map((item) => NavigationEvent.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return [];
    }
  }

  /// Get navigation statistics
  Map<String, int> getNavigationStats() {
    final statsJson = _prefs.getString(_navigationStatsKey);
    if (statsJson == null) return {};

    try {
      final Map<String, dynamic> decoded = json.decode(statsJson);
      return decoded.map((key, value) => MapEntry(key, value as int));
    } catch (e) {
      return {};
    }
  }

  /// Get most visited routes
  List<String> getMostVisitedRoutes({int limit = 5}) {
    final stats = getNavigationStats();
    final sortedRoutes = stats.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return sortedRoutes.take(limit).map((entry) => entry.key).toList();
  }

  /// Get navigation flow (common paths)
  List<NavigationFlow> getNavigationFlows() {
    final history = getNavigationHistory();
    final Map<String, int> flows = {};

    for (int i = 1; i < history.length; i++) {
      final from = history[i - 1].to;
      final to = history[i].to;
      final flow = '$from -> $to';
      flows[flow] = (flows[flow] ?? 0) + 1;
    }

    return flows.entries
        .map((entry) => NavigationFlow(path: entry.key, count: entry.value))
        .toList()
      ..sort((a, b) => b.count.compareTo(a.count));
  }

  /// Clear navigation history
  Future<void> clearHistory() async {
    await _prefs.remove(_navigationHistoryKey);
    await _prefs.remove(_navigationStatsKey);
  }

  /// Get session duration (time spent in app)
  Duration getSessionDuration() {
    final history = getNavigationHistory();
    if (history.isEmpty) return Duration.zero;

    final firstEvent = history.first;
    final lastEvent = history.last;

    return lastEvent.timestamp.difference(firstEvent.timestamp);
  }
}

/// Represents a single navigation event
class NavigationEvent {
  final String from;
  final String to;
  final DateTime timestamp;
  final Map<String, dynamic> metadata;

  NavigationEvent({
    required this.from,
    required this.to,
    required this.timestamp,
    required this.metadata,
  });

  Map<String, dynamic> toJson() {
    return {
      'from': from,
      'to': to,
      'timestamp': timestamp.toIso8601String(),
      'metadata': metadata,
    };
  }

  factory NavigationEvent.fromJson(Map<String, dynamic> json) {
    return NavigationEvent(
      from: json['from'] as String,
      to: json['to'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      metadata: Map<String, dynamic>.from(json['metadata'] as Map),
    );
  }
}

/// Represents a navigation flow pattern
class NavigationFlow {
  final String path;
  final int count;

  NavigationFlow({required this.path, required this.count});
}
