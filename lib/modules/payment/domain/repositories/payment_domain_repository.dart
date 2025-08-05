import 'package:kyrgyz_tourism/modules/payment/domain/entities/payment_entity.dart';
import 'package:kyrgyz_tourism/modules/payment/domain/usecases/applay_promocode_use_case.dart';

abstract class PaymentDomainRepository {
  Future<PaymentEntity> getPaymentInfo();
  Future<PaymentEntity> applyPromocode(PromocodeParams params);
  Future<void> confirmBooking();
}
