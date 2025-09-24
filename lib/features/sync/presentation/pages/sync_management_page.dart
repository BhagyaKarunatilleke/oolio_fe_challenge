import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../cubit/sync_cubit.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/navigation/app_router.dart';
import '../../../../core/services/connectivity_service.dart';

class SyncManagementPage extends StatelessWidget {
  const SyncManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sync Management'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          // Manual sync trigger
          BlocBuilder<SyncCubit, SyncState>(
            builder: (context, state) {
              final isProcessing =
                  state is SyncProcessing || state is SyncItemProcessing;
              return IconButton(
                icon: isProcessing
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.sync),
                onPressed: isProcessing
                    ? null
                    : () => context.read<SyncCubit>().triggerSync(),
                tooltip: 'Manual Sync',
              );
            },
          ),
          // Refresh connectivity status
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _refreshConnectivity(context);
            },
            tooltip: 'Refresh Connectivity',
          ),
        ],
      ),
      body: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            context.go(AppRoutes.home);
          }
        },
        child: BlocProvider(
          create: (context) => get<SyncCubit>()..getQueueStats(),
          child: const SyncManagementView(),
        ),
      ),
    );
  }

  void _refreshConnectivity(BuildContext context) async {
    try {
      final connectivityService = get<ConnectivityService>();
      final isConnected = await connectivityService.forceCheckConnectivity();

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isConnected ? 'Device is online' : 'Device is offline',
            ),
            backgroundColor: isConnected ? Colors.green : Colors.red,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to check connectivity: $e'),
            backgroundColor: Colors.orange,
          ),
        );
      }
    }
  }
}

class SyncManagementView extends StatelessWidget {
  const SyncManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SyncCubit, SyncState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Current sync status card
              _buildSyncStatusCard(context, state),
              const SizedBox(height: 16),

              // Online/Offline status
              _buildConnectivityStatus(context, state),
              const SizedBox(height: 16),

              // Sync queue statistics
              if (state is SyncStatsLoaded)
                _buildSyncStatsCard(context, state.stats),
              const SizedBox(height: 16),

              // Recent sync events
              _buildRecentEventsCard(context, state),
              const SizedBox(height: 16),

              // Sync controls
              _buildSyncControls(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSyncStatusCard(BuildContext context, SyncState state) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(_getStatusIcon(state), color: _getStatusColor(state)),
                const SizedBox(width: 8),
                Text(
                  'Sync Status',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              _getStatusDescription(state),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (state is SyncError) ...[
              const SizedBox(height: 8),
              Text(
                'Error: ${state.message}',
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildConnectivityStatus(BuildContext context, SyncState state) {
    final isOnline = state is! SyncOnlineStatusChanged || state.isOnline;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              isOnline ? Icons.wifi : Icons.wifi_off,
              color: isOnline ? Colors.green : Colors.red,
            ),
            const SizedBox(width: 8),
            Text(
              isOnline ? 'Online' : 'Offline',
              style: TextStyle(
                color: isOnline ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            if (isOnline)
              const Text(
                'Auto-sync enabled',
                style: TextStyle(color: Colors.grey),
              )
            else
              const Text(
                'Changes queued for sync',
                style: TextStyle(color: Colors.grey),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSyncStatsCard(BuildContext context, dynamic stats) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sync Queue Statistics',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildStatItem(
                  'Total',
                  stats.totalItems.toString(),
                  Colors.blue,
                ),
                _buildStatItem(
                  'Pending',
                  stats.pendingItems.toString(),
                  Colors.orange,
                ),
                _buildStatItem(
                  'Failed',
                  stats.failedItems.toString(),
                  Colors.red,
                ),
                _buildStatItem(
                  'Syncing',
                  stats.syncingItems.toString(),
                  Colors.purple,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
    );
  }

  Widget _buildRecentEventsCard(BuildContext context, SyncState state) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Events',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            _buildEventItem(
              icon: _getStatusIcon(state),
              title: _getEventTitle(state),
              subtitle: _getEventSubtitle(state),
              color: _getStatusColor(state),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSyncControls(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sync Controls',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => context.read<SyncCubit>().triggerSync(),
                    icon: const Icon(Icons.sync),
                    label: const Text('Sync Now'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _showPartialSyncDialog(context),
                    icon: const Icon(Icons.sync_alt),
                    label: const Text('Partial Sync'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showPartialSyncDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Partial Sync'),
        content: const Text(
          'This feature allows you to sync large datasets in batches to prevent overwhelming the server.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // In a real implementation, this would trigger partial sync
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Partial sync feature would be implemented here',
                  ),
                ),
              );
            },
            child: const Text('Start'),
          ),
        ],
      ),
    );
  }

  IconData _getStatusIcon(SyncState state) {
    if (state is SyncProcessing || state is SyncItemProcessing) {
      return Icons.sync;
    } else if (state is SyncError || state is SyncItemFailed) {
      return Icons.error_outline;
    } else if (state is SyncCompleted || state is SyncItemCompleted) {
      return Icons.check_circle_outline;
    }
    return Icons.sync_outlined;
  }

  Color _getStatusColor(SyncState state) {
    if (state is SyncProcessing || state is SyncItemProcessing) {
      return Colors.blue;
    } else if (state is SyncError || state is SyncItemFailed) {
      return Colors.red;
    } else if (state is SyncCompleted || state is SyncItemCompleted) {
      return Colors.green;
    }
    return Colors.grey;
  }

  String _getStatusDescription(SyncState state) {
    if (state is SyncProcessing) {
      return 'Synchronizing data with server...';
    } else if (state is SyncItemProcessing) {
      return 'Processing sync item...';
    } else if (state is SyncCompleted) {
      return 'Last sync completed successfully.';
    } else if (state is SyncError) {
      return 'Sync failed due to an error.';
    } else if (state is SyncItemFailed) {
      return 'Failed to sync item.';
    } else if (state is SyncItemCompleted) {
      return 'Item synced successfully.';
    }
    return 'Sync status unknown.';
  }

  String _getEventTitle(SyncState state) {
    if (state is SyncProcessing) {
      return 'Sync in Progress';
    } else if (state is SyncItemProcessing) {
      return 'Processing Item';
    } else if (state is SyncCompleted) {
      return 'Sync Completed';
    } else if (state is SyncError) {
      return 'Sync Failed';
    } else if (state is SyncItemFailed) {
      return 'Item Failed';
    }
    return 'No Recent Events';
  }

  String _getEventSubtitle(SyncState state) {
    final now = DateTime.now();
    final timeStr =
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';

    if (state is SyncProcessing) {
      return 'Started at $timeStr';
    } else if (state is SyncItemProcessing) {
      return 'Started at $timeStr';
    } else if (state is SyncCompleted) {
      return 'Completed at $timeStr';
    } else if (state is SyncError) {
      return 'Failed at $timeStr';
    } else if (state is SyncItemFailed) {
      return 'Failed at $timeStr';
    }
    return 'No recent activity';
  }
}
