import 'dart:typed_data';

class PaymentQrEntity {
  final Uint8List qrBytes;
  final int? amount;

  PaymentQrEntity({required this.qrBytes, this.amount});
}
