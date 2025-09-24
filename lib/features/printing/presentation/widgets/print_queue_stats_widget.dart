import 'package:flutter/material.dart';
import '../../domain/models/print_queue.dart';

class PrintQueueStatsWidget extends StatelessWidget {
  final PrintQueueStats stats;

  const PrintQueueStatsWidget({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Print Queue Status',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Active jobs row
            if (stats.pendingJobs > 0 || stats.processingJobs > 0)
              _buildStatRow(
                context,
                'Active Jobs',
                '${stats.pendingJobs + stats.processingJobs}',
                Colors.blue,
                Icons.print,
              ),

            // Completed jobs row
            if (stats.completedJobs > 0)
              _buildStatRow(
                context,
                'Completed',
                '${stats.completedJobs}',
                Colors.green,
                Icons.check_circle,
              ),

            // Failed jobs row
            if (stats.failedJobs > 0)
              _buildStatRow(
                context,
                'Failed',
                '${stats.failedJobs}',
                Colors.red,
                Icons.error,
              ),

            // Cancelled jobs row
            if (stats.cancelledJobs > 0)
              _buildStatRow(
                context,
                'Cancelled',
                '${stats.cancelledJobs}',
                Colors.grey,
                Icons.cancel,
              ),

            // Total jobs row
            _buildStatRow(
              context,
              'Total Jobs',
              '${stats.totalJobs}',
              Colors.grey[700]!,
              Icons.list_alt,
            ),

            // Progress indicator for active jobs
            if (stats.pendingJobs > 0 || stats.processingJobs > 0)
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Processing Status',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: stats.totalJobs > 0
                          ? (stats.completedJobs +
                                    stats.failedJobs +
                                    stats.cancelledJobs) /
                                stats.totalJobs
                          : 1.0,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        stats.failedJobs > 0 ? Colors.orange : Colors.green,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${((stats.completedJobs + stats.failedJobs + stats.cancelledJobs) / (stats.totalJobs > 0 ? stats.totalJobs : 1) * 100).toStringAsFixed(0)}% Complete',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(
    BuildContext context,
    String label,
    String value,
    Color color,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
