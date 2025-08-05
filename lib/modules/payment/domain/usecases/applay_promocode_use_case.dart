import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/payment/domain/entities/payment_entity.dart';
import 'package:kyrgyz_tourism/modules/payment/domain/repositories/payment_domain_repository.dart';

@injectable
class ApplayPromocodeUseCase
    extends BaseUsecase<PaymentEntity, PromocodeParams> {
  final PaymentDomainRepository _repository;

  ApplayPromocodeUseCase({required PaymentDomainRepository repository})
    : _repository = repository;

  @override
  Future<PaymentEntity> execute({required PromocodeParams params}) async {
    return await _repository.applyPromocode(params);
  }
}

class PromocodeParams {
  final int code;

  PromocodeParams({required this.code});

  JSON toJson() {
    return {'code': code};
  }
}
