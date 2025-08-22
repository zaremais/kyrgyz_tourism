import 'package:kyrgyz_tourism/modules/payment/domain/entities/payment_entity.dart';
import 'package:kyrgyz_tourism/modules/payment/domain/usecases/get_payment_qr_code_use_case.dart';

abstract class PaymentDomainRepository {
  Future<PaymentQrEntity> getPaymentQr(QrCodeParams params);
}
