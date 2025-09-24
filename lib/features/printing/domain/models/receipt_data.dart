import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';

part 'receipt_data.freezed.dart';
part 'receipt_data.g.dart';

@freezed
class ReceiptData with _$ReceiptData {
  const factory ReceiptData({
    required Map<String, dynamic> data,
    String? templateId,
    DateTime? generatedAt,
  }) = _ReceiptData;

  factory ReceiptData.fromJson(Map<String, dynamic> json) =>
      _$ReceiptDataFromJson(json);
}

extension ReceiptDataExtension on ReceiptData {
  /// Convert to ESC/POS bytes using esc_pos_utils_plus
  Future<List<int>> toEscPosBytes() async {
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm80, profile);

    return _generateReceipt(generator);
  }

  /// Convert to readable text for demo mode
  String toText() {
    return _generateTextReceipt();
  }

  /// Generate ESC/POS receipt using the Generator class
  Future<List<int>> _generateReceipt(Generator generator) async {
    final List<int> bytes = <int>[];

    try {
      // Header
      final header = data['header'] as Map<String, dynamic>?;
      if (header != null) {
        bytes.addAll(
          generator.text(
            header['restaurantName'] ?? 'RESTAURANT',
            styles: PosStyles(align: PosAlign.center, bold: true),
          ),
        );

        if (header['address'] != null) {
          bytes.addAll(
            generator.text(
              header['address'],
              styles: PosStyles(align: PosAlign.center),
            ),
          );
        }

        if (header['phone'] != null) {
          bytes.addAll(
            generator.text(
              header['phone'],
              styles: PosStyles(align: PosAlign.center),
            ),
          );
        }

        bytes.addAll(generator.feed(1));
      }

      // Order info
      final order = data['order'] as Map<String, dynamic>?;
      if (order != null) {
        bytes.addAll(
          generator.text(
            'Order #: ${order['orderNumber'] ?? 'N/A'}',
            styles: PosStyles(bold: true),
          ),
        );

        if (order['date'] != null) {
          bytes.addAll(generator.text('Date: ${order['date']}'));
        }

        if (order['time'] != null) {
          bytes.addAll(generator.text('Time: ${order['time']}'));
        }

        bytes.addAll(generator.feed(1));
      }

      // Items table header
      bytes.addAll(
        generator.row([
          PosColumn(text: 'ITEM', width: 6, styles: PosStyles(bold: true)),
          PosColumn(text: 'QTY', width: 2, styles: PosStyles(bold: true)),
          PosColumn(text: 'PRICE', width: 4, styles: PosStyles(bold: true)),
        ]),
      );

      // Items
      final items = data['items'] as List<dynamic>?;
      if (items != null) {
        for (final item in items) {
          final itemMap = item as Map<String, dynamic>;
          bytes.addAll(
            generator.row([
              PosColumn(text: itemMap['name'] ?? 'Unknown Item', width: 6),
              PosColumn(text: '${itemMap['quantity'] ?? 1}', width: 2),
              PosColumn(
                text: '\$${_formatPrice(itemMap['price'] ?? 0.0)}',
                width: 4,
              ),
            ]),
          );
        }
      }

      // Totals
      final totals = data['totals'] as Map<String, dynamic>?;
      if (totals != null) {
        bytes.addAll(generator.feed(1));

        if (totals['subtotal'] != null) {
          bytes.addAll(
            generator.text(
              'Subtotal: \$${_formatPrice(totals['subtotal'])}',
              styles: PosStyles(align: PosAlign.right),
            ),
          );
        }

        if (totals['tax'] != null) {
          bytes.addAll(
            generator.text(
              'Tax: \$${_formatPrice(totals['tax'])}',
              styles: PosStyles(align: PosAlign.right),
            ),
          );
        }

        bytes.addAll(
          generator.text(
            'Total: \$${_formatPrice(totals['total'] ?? 0.0)}',
            styles: PosStyles(align: PosAlign.right, bold: true),
          ),
        );
      }

      // Payment
      final payment = data['payment'] as Map<String, dynamic>?;
      if (payment != null) {
        bytes.addAll(generator.feed(1));

        if (payment['method'] != null) {
          bytes.addAll(generator.text('Payment: ${payment['method']}'));
        }

        if (payment['change'] != null) {
          bytes.addAll(
            generator.text('Change: \$${_formatPrice(payment['change'])}'),
          );
        }
      }

      // Footer
      bytes.addAll(generator.feed(2));
      bytes.addAll(
        generator.text('Thank you!', styles: PosStyles(align: PosAlign.center)),
      );

      // Cut paper
      bytes.addAll(generator.feed(2));
      bytes.addAll(generator.cut());
    } catch (e) {
      // If there's an error, generate a simple error receipt
      bytes.clear();
      bytes.addAll(generator.text('ERROR GENERATING RECEIPT'));
      bytes.addAll(generator.text('Error: $e'));
      bytes.addAll(generator.cut());
    }

    return bytes;
  }

  /// Generate readable text receipt for demo mode
  String _generateTextReceipt() {
    final buffer = StringBuffer();

    // Header
    final header = data['header'] as Map<String, dynamic>?;
    if (header != null) {
      buffer.writeln(_centerText(header['restaurantName'] ?? 'RESTAURANT', 32));
      if (header['address'] != null) {
        buffer.writeln(_centerText(header['address'], 32));
      }
      if (header['phone'] != null) {
        buffer.writeln(_centerText(header['phone'], 32));
      }
      buffer.writeln('═' * 32);
    }

    // Order info
    final order = data['order'] as Map<String, dynamic>?;
    if (order != null) {
      buffer.writeln('Order #: ${order['orderNumber'] ?? 'N/A'}');
      if (order['date'] != null) {
        buffer.writeln('Date: ${order['date']}');
      }
      if (order['time'] != null) {
        buffer.writeln('Time: ${order['time']}');
      }
      buffer.writeln('═' * 32);
    }

    // Items table header
    buffer.writeln('ITEM                     QTY PRICE');
    buffer.writeln('─' * 32);

    // Items
    final items = data['items'] as List<dynamic>?;
    if (items != null) {
      for (final item in items) {
        final itemMap = item as Map<String, dynamic>;
        final name = (itemMap['name'] ?? 'Unknown Item').toString();
        final quantity = itemMap['quantity'] ?? 1;
        final price = _formatPrice(itemMap['price'] ?? 0.0);

        buffer.writeln(
          '${name.padRight(22)} ${quantity.toString().padLeft(3)} \$$price',
        );
      }
    }

    // Totals
    final totals = data['totals'] as Map<String, dynamic>?;
    if (totals != null) {
      buffer.writeln('─' * 32);

      if (totals['subtotal'] != null) {
        buffer.writeln(
          'Subtotal: ${' ' * 19}\$${_formatPrice(totals['subtotal'])}',
        );
      }

      if (totals['tax'] != null) {
        buffer.writeln('Tax: ${' ' * 23}\$${_formatPrice(totals['tax'])}');
      }

      buffer.writeln(
        'Total: ${' ' * 21}\$${_formatPrice(totals['total'] ?? 0.0)}',
      );
    }

    // Payment
    final payment = data['payment'] as Map<String, dynamic>?;
    if (payment != null) {
      buffer.writeln('═' * 32);

      if (payment['method'] != null) {
        buffer.writeln('Payment: ${payment['method']}');
      }

      if (payment['change'] != null) {
        buffer.writeln('Change: \$${_formatPrice(payment['change'])}');
      }
    }

    // Footer
    buffer.writeln('═' * 32);
    buffer.writeln(_centerText('Thank you!', 32));

    return buffer.toString();
  }

  String _centerText(String text, int width) {
    if (text.length >= width) return text;
    final padding = (width - text.length) ~/ 2;
    return ' ' * padding + text;
  }

  String _formatPrice(dynamic price) {
    if (price == null) return '0.00';
    final numPrice = price is num
        ? price
        : double.tryParse(price.toString()) ?? 0.0;
    return numPrice.toStringAsFixed(2);
  }
}
