import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/payment/domain/repositories/payment_domain_repository.dart';

@injectable
class ConfirmBookedUseCase extends BaseUsecase<void, NoParams> {
  final PaymentDomainRepository _repository;

  ConfirmBookedUseCase({required PaymentDomainRepository repository})
    : _repository = repository;

  @override
  Future<void> execute({required NoParams params}) async {
    return await _repository.confirmBooking();
  }
}
