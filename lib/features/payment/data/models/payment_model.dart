import 'dart:typed_data';

import 'package:kyrgyz_tourism/features/payment/domain/entities/payment_entity.dart';

class PaymentQrModel extends PaymentQrEntity {
  PaymentQrModel({required super.qrBytes, super.amount});

  factory PaymentQrModel.fromBytes(Uint8List bytes) {
    return PaymentQrModel(qrBytes: bytes);
  }
}
