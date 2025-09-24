import 'package:flutter/material.dart';
import '../../domain/models/print_job.dart';
import '../../domain/models/print_destination.dart';

class PrintJobCard extends StatelessWidget {
  final PrintJob job;
  final VoidCallback? onRetry;
  final VoidCallback? onCancel;
  final VoidCallback? onRemove;

  const PrintJobCard({
    super.key,
    required this.job,
    this.onRetry,
    this.onCancel,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row with job info and status
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.displayName,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Created: ${_formatDateTime(job.createdAt)}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                _buildStatusChip(),
                const SizedBox(width: 8),
                _buildPriorityChip(),
              ],
            ),

            const SizedBox(height: 12),

            // Destination and progress info
            Row(
              children: [
                Icon(_getDestinationIcon(), size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  job.destination.displayName,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                if (job.retryCount > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Retry ${job.retryCount}/3',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.orange[800],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),

            // Error message if failed
            if (job.status.when(
              pending: () => false,
              processing: () => false,
              completed: () => false,
              failed: (errorMessage, failedAt) => true,
              cancelled: () => false,
            ))
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red[200]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.error_outline, color: Colors.red[600], size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        job.status.when(
                          pending: () => '',
                          processing: () => '',
                          completed: () => '',
                          failed: (errorMessage, failedAt) => errorMessage,
                          cancelled: () => '',
                        ),
                        style: TextStyle(color: Colors.red[800], fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),

            // Action buttons
            if (_shouldShowActions())
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: _buildActionButtons(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip() {
    return job.status.when(
      pending: () => _buildChip('Pending', Colors.orange, Icons.schedule),
      processing: () => _buildChip('Processing', Colors.blue, Icons.print),
      completed: () =>
          _buildChip('Completed', Colors.green, Icons.check_circle),
      failed: (errorMessage, failedAt) =>
          _buildChip('Failed', Colors.red, Icons.error),
      cancelled: () => _buildChip('Cancelled', Colors.grey, Icons.cancel),
    );
  }

  Widget _buildPriorityChip() {
    return job.priority.when(
      low: () => _buildChip('Low', Colors.grey, Icons.keyboard_arrow_down),
      normal: () => _buildChip('Normal', Colors.blue, Icons.remove),
      high: () => _buildChip('High', Colors.orange, Icons.keyboard_arrow_up),
      urgent: () => _buildChip('Urgent', Colors.red, Icons.priority_high),
    );
  }

  Widget _buildChip(String label, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getDestinationIcon() {
    return job.destination.when(
      file: () => Icons.description,
      usb: () => Icons.usb,
      network: (ipAddress, port) => Icons.wifi,
      bluetooth: (deviceName, deviceAddress) => Icons.bluetooth,
    );
  }

  bool _shouldShowActions() {
    return job.status.when(
      pending: () => true,
      processing: () => false,
      completed: () => false,
      failed: (errorMessage, failedAt) => job.canRetry,
      cancelled: () => false,
    );
  }

  List<Widget> _buildActionButtons() {
    final buttons = <Widget>[];

    job.status.when(
      pending: () {
        buttons.add(
          TextButton.icon(
            onPressed: onCancel,
            icon: const Icon(Icons.cancel, size: 16),
            label: const Text('Cancel'),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
          ),
        );
      },
      processing: () {
        // No actions during processing
      },
      completed: () {
        buttons.add(
          TextButton.icon(
            onPressed: onRemove,
            icon: const Icon(Icons.delete, size: 16),
            label: const Text('Remove'),
            style: TextButton.styleFrom(foregroundColor: Colors.grey),
          ),
        );
      },
      failed: (errorMessage, failedAt) {
        if (job.canRetry) {
          buttons.add(
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh, size: 16),
              label: const Text('Retry'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
          );
        }
        buttons.add(
          TextButton.icon(
            onPressed: onRemove,
            icon: const Icon(Icons.delete, size: 16),
            label: const Text('Remove'),
            style: TextButton.styleFrom(foregroundColor: Colors.grey),
          ),
        );
      },
      cancelled: () {
        buttons.add(
          TextButton.icon(
            onPressed: onRemove,
            icon: const Icon(Icons.delete, size: 16),
            label: const Text('Remove'),
            style: TextButton.styleFrom(foregroundColor: Colors.grey),
          ),
        );
      },
    );

    return buttons;
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
      return '${difference.inDays}d ago';
    }
  }
}
