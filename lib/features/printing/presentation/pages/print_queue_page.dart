import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/navigation/app_router.dart';
import '../cubit/print_queue_cubit.dart';
import '../cubit/print_queue_state.dart';
import '../widgets/print_job_card.dart';
import '../widgets/print_queue_stats_widget.dart';

class PrintQueuePage extends StatelessWidget {
  const PrintQueuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Print Queue'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) => _handleMenuAction(context, value),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'process_next',
                child: Row(
                  children: [
                    Icon(Icons.play_arrow),
                    SizedBox(width: 8),
                    Text('Process Next Job'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'clear_old',
                child: Row(
                  children: [
                    Icon(Icons.cleaning_services),
                    SizedBox(width: 8),
                    Text('Clear Old Jobs'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'clear_stale',
                child: Row(
                  children: [
                    Icon(Icons.delete_sweep),
                    SizedBox(width: 8),
                    Text('Clear Stale Jobs'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'clear_all',
                child: Row(
                  children: [
                    Icon(Icons.clear_all, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Clear All Jobs', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            // Navigate to home page instead of going back
            context.go(AppRoutes.home);
          }
        },
        child: BlocProvider(
          create: (context) => get<PrintQueueCubit>()..loadQueue(),
          child: const PrintQueueView(),
        ),
      ),
    );
  }

  void _handleMenuAction(BuildContext context, String action) {
    final cubit = context.read<PrintQueueCubit>();

    switch (action) {
      case 'process_next':
        cubit.processNextJob();
        break;
      case 'clear_old':
        cubit.clearOldCompletedJobs();
        break;
      case 'clear_stale':
        cubit.clearStaleJobs();
        break;
      case 'clear_all':
        _showClearAllConfirmation(context, cubit);
        break;
    }
  }

  void _showClearAllConfirmation(BuildContext context, PrintQueueCubit cubit) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear All Jobs'),
        content: const Text(
          'Are you sure you want to clear all print jobs? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              cubit.clearAllJobs();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Clear All'),
          ),
        ],
      ),
    );
  }
}

class PrintQueueView extends StatelessWidget {
  const PrintQueueView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrintQueueCubit, PrintQueueState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (queue, isProcessing) =>
              _buildLoadedView(context, queue, isProcessing),
          error: (message, queue) => _buildErrorView(context, message, queue),
        );
      },
    );
  }

  Widget _buildLoadedView(BuildContext context, queue, bool isProcessing) {
    if (queue.jobs.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.print_disabled, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No Print Jobs',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Print jobs will appear here when orders are placed.',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<PrintQueueCubit>().loadQueue();
      },
      child: Column(
        children: [
          // Statistics widget
          PrintQueueStatsWidget(stats: queue.stats),

          // Processing indicator
          if (isProcessing)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue[200]!),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Processing print jobs...',
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

          // Jobs list
          Expanded(
            child: ListView.builder(
              itemCount: queue.jobs.length,
              itemBuilder: (context, index) {
                final job = queue.jobs[index];
                return PrintJobCard(
                  job: job,
                  onRetry: () =>
                      context.read<PrintQueueCubit>().retryJob(job.id),
                  onCancel: () =>
                      context.read<PrintQueueCubit>().cancelJob(job.id),
                  onRemove: () =>
                      context.read<PrintQueueCubit>().removeJob(job.id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorView(BuildContext context, String message, queue) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red[400]),
          const SizedBox(height: 16),
          Text(
            'Error Loading Print Queue',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: Colors.red[600]),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () => context.read<PrintQueueCubit>().loadQueue(),
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
