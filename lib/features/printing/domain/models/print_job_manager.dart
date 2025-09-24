import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:injectable/injectable.dart';
import '../repositories/print_queue_repository.dart';
import 'print_job.dart';
import 'print_job_status.dart';
import 'print_destination.dart';
import 'print_queue.dart';

@singleton
class PrintJobManager {
  final PrintQueueRepository _repository;
  bool _isProcessing = false;

  PrintJobManager(this._repository);

  /// Process a single print job
  Future<void> processPrintJob(PrintJob job) async {
    try {
      // Update job status to processing
      final updatedJob = job.copyWithStatus(const PrintJobStatus.processing());
      await _repository.updateJob(updatedJob);

      // Generate ESC/POS bytes
      final escPosBytes = await job.generateEscPosBytes();

      // Print based on destination
      await job.destination.when(
        file: () => _printToFile(escPosBytes, job.id),
        usb: () => _printToUsb(escPosBytes),
        network: (ipAddress, port) =>
            _printToNetwork(escPosBytes, job.destination),
        bluetooth: (deviceName, deviceAddress) =>
            _printToBluetooth(escPosBytes, job.destination),
      );

      // Update job status to completed
      final completedJob = updatedJob.copyWithStatus(
        const PrintJobStatus.completed(),
      );
      await _repository.updateJob(completedJob);
    } catch (e) {
      // Update job status to failed
      final failedJob = job.copyWithStatus(
        PrintJobStatus.failed(errorMessage: e.toString()),
      );
      await _repository.updateJob(failedJob);
      rethrow;
    }
  }

  /// Process the next job in the queue
  Future<void> processNextJob() async {
    if (_isProcessing) return;

    _isProcessing = true;
    try {
      final queue = await _repository.getQueue();
      final nextJob = queue.nextJob;

      if (nextJob != null) {
        await processPrintJob(nextJob);
      }
    } finally {
      _isProcessing = false;
    }
  }

  /// Retry a failed job
  Future<void> retryJob(String jobId) async {
    final job = await _repository.getJob(jobId);
    if (job == null || !job.canRetry) return;

    final retryJob = job.copyWithRetry();
    await _repository.updateJob(retryJob);
    await processPrintJob(retryJob);
  }

  /// Cancel a job
  Future<void> cancelJob(String jobId) async {
    final job = await _repository.getJob(jobId);
    if (job == null || !job.status.isActive) return;

    final cancelledJob = job.copyWithStatus(const PrintJobStatus.cancelled());
    await _repository.updateJob(cancelledJob);
  }

  /// Print to file (Demo mode)
  Future<void> _printToFile(List<int> escPosBytes, String jobId) async {
    final directory = await getApplicationDocumentsDirectory();
    final receiptsDir = Directory('${directory.path}/receipts');

    // Create receipts directory if it doesn't exist
    if (!await receiptsDir.exists()) {
      await receiptsDir.create(recursive: true);
    }

    final file = File('${receiptsDir.path}/receipt_$jobId.txt');

    // Convert ESC/POS bytes to readable text
    final readableText = _convertEscPosToText(escPosBytes);

    await file.writeAsString(readableText);

    // Log the file location for debugging
    print('📄 Receipt saved to: ${file.path}');
    print('📁 Directory: ${receiptsDir.path}');
    print('🌐 Full path: ${file.absolute.path}');
  }

  /// Get the file path for a completed print job
  Future<String?> getReceiptFilePath(String jobId) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final receiptsDir = Directory('${directory.path}/receipts');
      final file = File('${receiptsDir.path}/receipt_$jobId.txt');

      if (await file.exists()) {
        return file.path;
      }
      return null;
    } catch (e) {
      print('Error getting receipt file path: $e');
      return null;
    }
  }

  /// Print to USB printer (placeholder)
  Future<void> _printToUsb(List<int> escPosBytes) async {
    // TODO: Implement USB printing
    throw UnimplementedError('USB printing not implemented yet');
  }

  /// Print to network printer
  Future<void> _printToNetwork(
    List<int> escPosBytes,
    PrintDestination destination,
  ) async {
    destination.when(
      file: () =>
          throw ArgumentError('Invalid destination for network printing'),
      usb: () =>
          throw ArgumentError('Invalid destination for network printing'),
      network: (ipAddress, port) async {
        // TODO: Implement network printing
        throw UnimplementedError('Network printing not implemented yet');
      },
      bluetooth: (deviceName, deviceAddress) =>
          throw ArgumentError('Invalid destination for network printing'),
    );
  }

  /// Print to Bluetooth printer
  Future<void> _printToBluetooth(
    List<int> escPosBytes,
    PrintDestination destination,
  ) async {
    destination.when(
      file: () =>
          throw ArgumentError('Invalid destination for Bluetooth printing'),
      usb: () =>
          throw ArgumentError('Invalid destination for Bluetooth printing'),
      network: (ipAddress, port) =>
          throw ArgumentError('Invalid destination for Bluetooth printing'),
      bluetooth: (deviceName, deviceAddress) async {
        // TODO: Implement Bluetooth printing
        throw UnimplementedError('Bluetooth printing not implemented yet');
      },
    );
  }

  /// Convert ESC/POS bytes to readable text for demo mode
  String _convertEscPosToText(List<int> escPosBytes) {
    // Simple conversion - remove control characters and format
    final text = String.fromCharCodes(
      escPosBytes.where(
        (byte) => byte >= 32 && byte <= 126, // Printable ASCII characters
      ),
    );

    // Basic formatting
    return text
        .replaceAll('\x1B@', '') // ESC @ (initialize)
        .replaceAll('\x1B!', '') // ESC ! (character formatting)
        .replaceAll('\x1Ba', '') // ESC a (alignment)
        .replaceAll('\x1Bd', '') // ESC d (line spacing)
        .replaceAll('\x1BJ', '') // ESC J (paper feed)
        .replaceAll('\x1D', '') // GS commands
        .replaceAll('\x0A', '\n') // Line feed
        .replaceAll('\x0D', '') // Carriage return
        .trim();
  }

  /// Check if manager is currently processing
  bool get isProcessing => _isProcessing;
}
