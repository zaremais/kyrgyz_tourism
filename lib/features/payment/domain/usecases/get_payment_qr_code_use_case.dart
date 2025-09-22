import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/features/payment/domain/entities/payment_entity.dart';
import 'package:kyrgyz_tourism/features/payment/domain/repositories/payment_domain_repository.dart';

@injectable
class GetPaymentQrCodeUseCase
    extends BaseUsecase<PaymentQrEntity, QrCodeParams> {
  final PaymentDomainRepository _repository;

  GetPaymentQrCodeUseCase({required PaymentDomainRepository repository})
    : _repository = repository;

  @override
  Future<PaymentQrEntity> execute({required QrCodeParams params}) async {
    return _repository.getPaymentQr(params);
  }
}

class QrCodeParams {
  final int amount;

  QrCodeParams({required this.amount});

  JSON toJson() {
    return {'amount': amount};
  }
}
