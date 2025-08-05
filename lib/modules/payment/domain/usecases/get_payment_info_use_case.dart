import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/payment/domain/entities/payment_entity.dart';
import 'package:kyrgyz_tourism/modules/payment/domain/repositories/payment_domain_repository.dart';

@injectable
class GetPaymentInfoUseCase extends BaseUsecase<PaymentEntity, NoParams> {
  final PaymentDomainRepository _repository;

  GetPaymentInfoUseCase({required PaymentDomainRepository repository})
    : _repository = repository;

  @override
  Future<PaymentEntity> execute({required NoParams params}) async {
    return await _repository.getPaymentInfo();
  }
}
