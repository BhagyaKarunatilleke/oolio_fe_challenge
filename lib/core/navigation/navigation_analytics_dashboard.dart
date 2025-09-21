import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'navigation_analytics.dart';

/// Navigation analytics dashboard widget
/// Displays navigation patterns and user flow analytics
class NavigationAnalyticsDashboard extends StatefulWidget {
  const NavigationAnalyticsDashboard({super.key});

  @override
  State<NavigationAnalyticsDashboard> createState() =>
      _NavigationAnalyticsDashboardState();
}

class _NavigationAnalyticsDashboardState
    extends State<NavigationAnalyticsDashboard> {
  late NavigationAnalytics _analytics;

  @override
  void initState() {
    super.initState();
    _initializeAnalytics();
  }

  Future<void> _initializeAnalytics() async {
    final prefs = await SharedPreferences.getInstance();
    _analytics = NavigationAnalytics(prefs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Analytics'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSummaryCard(),
            const SizedBox(height: 16),
            _buildMostVisitedRoutesCard(),
            const SizedBox(height: 16),
            _buildNavigationFlowsCard(),
            const SizedBox(height: 16),
            _buildSessionInfoCard(),
            const SizedBox(height: 16),
            _buildNavigationHistoryCard(),
            const SizedBox(height: 16),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard() {
    final stats = _analytics.getNavigationStats();
    final history = _analytics.getNavigationHistory();
    final sessionDuration = _analytics.getSessionDuration();

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Navigation Summary',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    'Total Navigations',
                    history.length.toString(),
                    Icons.navigation,
                    Colors.blue,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    'Unique Routes',
                    stats.length.toString(),
                    Icons.route,
                    Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    'Session Duration',
                    '${sessionDuration.inMinutes}m',
                    Icons.timer,
                    Colors.orange,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    'Avg. Time/Route',
                    _calculateAverageTimePerRoute(history).toStringAsFixed(1) +
                        's',
                    Icons.speed,
                    Colors.purple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 32),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildMostVisitedRoutesCard() {
    final mostVisited = _analytics.getMostVisitedRoutes();
    final stats = _analytics.getNavigationStats();

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Most Visited Routes',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            if (mostVisited.isEmpty)
              const Text('No navigation data available')
            else
              ...mostVisited.map(
                (route) => _buildRouteItem(route, stats[route] ?? 0),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildRouteItem(String route, int visits) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              _getRouteDisplayName(route),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              visits.toString(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationFlowsCard() {
    final flows = _analytics.getNavigationFlows();

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Common Navigation Flows',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            if (flows.isEmpty)
              const Text('No navigation flow data available')
            else
              ...flows.take(5).map((flow) => _buildFlowItem(flow)),
          ],
        ),
      ),
    );
  }

  Widget _buildFlowItem(NavigationFlow flow) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              flow.path,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              flow.count.toString(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSessionInfoCard() {
    final sessionDuration = _analytics.getSessionDuration();
    final history = _analytics.getNavigationHistory();

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Session Information',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildInfoRow('Session Duration', _formatDuration(sessionDuration)),
            _buildInfoRow('Total Navigations', history.length.toString()),
            _buildInfoRow(
              'Navigation Rate',
              _calculateNavigationRate(history).toStringAsFixed(1) + '/min',
            ),
            if (history.isNotEmpty) ...[
              _buildInfoRow(
                'First Navigation',
                _formatDateTime(history.first.timestamp),
              ),
              _buildInfoRow(
                'Last Navigation',
                _formatDateTime(history.last.timestamp),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
          Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationHistoryCard() {
    final history = _analytics.getNavigationHistory();

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Navigation History',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                if (history.isNotEmpty)
                  TextButton(
                    onPressed: _clearHistory,
                    child: const Text('Clear History'),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            if (history.isEmpty)
              const Text('No navigation history available')
            else
              ...history.reversed
                  .take(10)
                  .map((event) => _buildHistoryItem(event)),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryItem(NavigationEvent event) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.arrow_forward, size: 16, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '${_getRouteDisplayName(event.from)} → ${_getRouteDisplayName(event.to)}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Text(
            _formatDateTime(event.timestamp),
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: _exportAnalytics,
            icon: const Icon(Icons.download),
            label: const Text('Export Data'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: _clearAnalytics,
            icon: const Icon(Icons.clear_all),
            label: const Text('Clear All'),
          ),
        ),
      ],
    );
  }

  String _getRouteDisplayName(String route) {
    switch (route) {
      case '/':
        return 'Home';
      case '/cart':
        return 'Cart';
      case '/checkout':
        return 'Checkout';
      case '/orders':
        return 'Orders';
      case '/order-confirmation':
        return 'Order Confirmation';
      default:
        if (route.startsWith('/product/')) {
          return 'Product Detail';
        } else if (route.startsWith('/orders/')) {
          return 'Order Details';
        }
        return route;
    }
  }

  double _calculateAverageTimePerRoute(List<NavigationEvent> history) {
    if (history.length < 2) return 0.0;

    final totalTime = history.last.timestamp.difference(
      history.first.timestamp,
    );
    return totalTime.inSeconds / history.length;
  }

  double _calculateNavigationRate(List<NavigationEvent> history) {
    if (history.isEmpty) return 0.0;

    final sessionDuration = _analytics.getSessionDuration();
    if (sessionDuration.inMinutes == 0) return 0.0;

    return history.length / sessionDuration.inMinutes;
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m ${seconds}s';
    } else if (minutes > 0) {
      return '${minutes}m ${seconds}s';
    } else {
      return '${seconds}s';
    }
  }

  String _formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else {
      return '${dateTime.day}/${dateTime.month} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
    }
  }

  void _clearHistory() {
    _analytics.clearHistory();
    setState(() {});
  }

  void _exportAnalytics() {
    // In a real app, this would export analytics data
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Analytics data exported successfully')),
    );
  }

  void _clearAnalytics() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Analytics'),
        content: const Text(
          'Are you sure you want to clear all analytics data?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _analytics.clearHistory();
              setState(() {});
            },
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }
}
