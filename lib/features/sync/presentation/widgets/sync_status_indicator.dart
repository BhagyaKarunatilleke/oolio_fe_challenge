import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/sync_cubit.dart';

/// Widget that displays sync status indicators throughout the app
class SyncStatusIndicator extends StatelessWidget {
  final Widget child;
  final bool showDetailedStatus;
  final VoidCallback? onTap;

  const SyncStatusIndicator({
    super.key,
    required this.child,
    this.showDetailedStatus = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SyncCubit, SyncState>(
      builder: (context, state) {
        return Stack(
          children: [
            child,
            if (_shouldShowIndicator(state))
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _getStatusColor(state).withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _getStatusIcon(state),
                        if (showDetailedStatus) ...[
                          const SizedBox(width: 4),
                          _getStatusText(state),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  bool _shouldShowIndicator(SyncState state) {
    return state is SyncProcessing ||
        state is SyncItemProcessing ||
        state is SyncError ||
        state is SyncItemFailed;
  }

  Color _getStatusColor(SyncState state) {
    if (state is SyncProcessing || state is SyncItemProcessing) {
      return Colors.blue;
    } else if (state is SyncError || state is SyncItemFailed) {
      return Colors.red;
    }
    return Colors.green;
  }

  Widget _getStatusIcon(SyncState state) {
    if (state is SyncProcessing || state is SyncItemProcessing) {
      return const SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else if (state is SyncError || state is SyncItemFailed) {
      return const Icon(Icons.error_outline, color: Colors.white, size: 16);
    }
    return const Icon(Icons.sync, color: Colors.white, size: 16);
  }

  Widget _getStatusText(SyncState state) {
    String text;
    if (state is SyncProcessing) {
      text = 'Syncing...';
    } else if (state is SyncItemProcessing) {
      text = 'Processing...';
    } else if (state is SyncError) {
      text = 'Sync Error';
    } else if (state is SyncItemFailed) {
      text = 'Failed';
    } else {
      text = 'Synced';
    }

    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

/// Compact sync status indicator for app bars
class CompactSyncStatusIndicator extends StatelessWidget {
  const CompactSyncStatusIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SyncCubit, SyncState>(
      builder: (context, state) {
        if (!_shouldShowIndicator(state)) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () => _showSyncDetails(context, state),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: _getStatusColor(state).withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: _getStatusIcon(state),
            ),
          ),
        );
      },
    );
  }

  bool _shouldShowIndicator(SyncState state) {
    return state is SyncProcessing ||
        state is SyncItemProcessing ||
        state is SyncError ||
        state is SyncItemFailed;
  }

  Color _getStatusColor(SyncState state) {
    if (state is SyncProcessing || state is SyncItemProcessing) {
      return Colors.blue;
    } else if (state is SyncError || state is SyncItemFailed) {
      return Colors.red;
    }
    return Colors.green;
  }

  Widget _getStatusIcon(SyncState state) {
    if (state is SyncProcessing || state is SyncItemProcessing) {
      return const SizedBox(
        width: 14,
        height: 14,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else if (state is SyncError || state is SyncItemFailed) {
      return const Icon(Icons.error_outline, color: Colors.white, size: 14);
    }
    return const Icon(Icons.sync, color: Colors.white, size: 14);
  }

  void _showSyncDetails(BuildContext context, SyncState state) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sync Status'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_getStatusDescription(state)),
            if (state is SyncError) ...[
              const SizedBox(height: 8),
              Text(
                'Error: ${state.message}',
                style: const TextStyle(color: Colors.red),
              ),
            ],
            if (state is SyncItemFailed) ...[
              const SizedBox(height: 8),
              Text(
                'Error: ${state.error}',
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
          if (state is SyncError || state is SyncItemFailed)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.read<SyncCubit>().triggerSync();
              },
              child: const Text('Retry'),
            ),
        ],
      ),
    );
  }

  String _getStatusDescription(SyncState state) {
    if (state is SyncProcessing) {
      return 'Synchronizing data with server...';
    } else if (state is SyncItemProcessing) {
      return 'Processing sync item...';
    } else if (state is SyncError) {
      return 'Sync failed due to an error.';
    } else if (state is SyncItemFailed) {
      return 'Failed to sync item.';
    }
    return 'Sync completed successfully.';
  }
}

/// Floating sync status button for quick access
class FloatingSyncButton extends StatelessWidget {
  const FloatingSyncButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SyncCubit, SyncState>(
      builder: (context, state) {
        final isProcessing =
            state is SyncProcessing || state is SyncItemProcessing;

        return FloatingActionButton.small(
          onPressed: isProcessing
              ? null
              : () => context.read<SyncCubit>().triggerSync(),
          backgroundColor: _getStatusColor(state),
          child: isProcessing
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : const Icon(Icons.sync, color: Colors.white),
        );
      },
    );
  }

  Color _getStatusColor(SyncState state) {
    if (state is SyncProcessing || state is SyncItemProcessing) {
      return Colors.blue;
    } else if (state is SyncError || state is SyncItemFailed) {
      return Colors.red;
    }
    return Colors.green;
  }
}
