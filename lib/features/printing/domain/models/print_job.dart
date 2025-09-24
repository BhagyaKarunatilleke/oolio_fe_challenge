import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import 'print_destination.dart';
import 'print_job_status.dart';
import 'print_job_priority.dart';
import 'receipt_data.dart';

part 'print_job.freezed.dart';
part 'print_job.g.dart';

@freezed
class PrintJob with _$PrintJob {
  const factory PrintJob({
    required String id,
    required PrintDestination destination,
    required PrintJobPriority priority,
    required PrintJobStatus status,
    required String receiptData, // JSON string
    @Default(0) int retryCount,
    required DateTime createdAt,
    DateTime? startedAt,
    DateTime? completedAt,
    List<int>? escPosBytes, // Pre-generated ESC/POS bytes (optional)
  }) = _PrintJob;

  factory PrintJob.fromJson(Map<String, dynamic> json) =>
      _$PrintJobFromJson(json);
}

extension PrintJobExtension on PrintJob {
  /// Create a new PrintJob from OrderModel
  static PrintJob fromOrderData({
    required Map<String, dynamic> orderData,
    required PrintDestination destination,
    PrintJobPriority priority = const PrintJobPriority.normal(),
  }) {
    final receiptData = ReceiptData(
      data: orderData,
      templateId: 'order_receipt',
      generatedAt: DateTime.now(),
    );

    return PrintJob(
      id: const Uuid().v4(),
      destination: destination,
      priority: priority,
      status: const PrintJobStatus.pending(),
      receiptData: jsonEncode(receiptData.toJson()),
      createdAt: DateTime.now(),
    );
  }

  /// Generate ESC/POS bytes on demand
  Future<List<int>> generateEscPosBytes() async {
    if (escPosBytes != null) return escPosBytes!;

    try {
      // Parse the JSON string to Map
      final Map<String, dynamic> receiptDataMap = jsonDecode(receiptData);
      final receiptDataObj = ReceiptData.fromJson(receiptDataMap);
      return await receiptDataObj.toEscPosBytes();
    } catch (e) {
      throw Exception('Failed to generate ESC/POS bytes: $e');
    }
  }

  /// Generate readable text for demo mode
  String generateTextReceipt() {
    try {
      // Parse the JSON string to Map
      final Map<String, dynamic> receiptDataMap = jsonDecode(receiptData);
      final receiptDataObj = ReceiptData.fromJson(receiptDataMap);
      return receiptDataObj.toText();
    } catch (e) {
      return 'ERROR GENERATING RECEIPT\nError: $e';
    }
  }

  /// Copy with updated status
  PrintJob copyWithStatus(PrintJobStatus newStatus) {
    return copyWith(
      status: newStatus,
      startedAt: newStatus.when(
        pending: () => startedAt,
        processing: () => DateTime.now(),
        completed: () => startedAt,
        failed: (errorMessage, failedAt) => startedAt,
        cancelled: () => startedAt,
      ),
      completedAt: newStatus.when(
        pending: () => completedAt,
        processing: () => completedAt,
        completed: () => DateTime.now(),
        failed: (errorMessage, failedAt) => DateTime.now(),
        cancelled: () => DateTime.now(),
      ),
    );
  }

  /// Copy with incremented retry count
  PrintJob copyWithRetry() {
    return copyWith(
      retryCount: retryCount + 1,
      status: const PrintJobStatus.pending(),
      startedAt: null,
      completedAt: null,
    );
  }

  /// Check if job can be retried
  bool get canRetry {
    return status.canRetry && retryCount < 3; // Max 3 retries
  }

  /// Get display name for the job
  String get displayName {
    try {
      // Parse the JSON string to Map
      final Map<String, dynamic> receiptDataMap = jsonDecode(receiptData);
      final receiptDataObj = ReceiptData.fromJson(receiptDataMap);
      final orderNumber =
          receiptDataObj.data['order']?['orderNumber'] ?? 'Unknown';
      return 'Order #$orderNumber';
    } catch (e) {
      return 'Print Job #${id.substring(0, 8)}';
    }
  }

  /// Get age of the job
  Duration get age {
    return DateTime.now().difference(createdAt);
  }

  /// Check if job is stale (older than 1 hour)
  bool get isStale {
    return age.inHours > 1;
  }
}
