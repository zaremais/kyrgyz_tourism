import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_repository.dart';

@injectable
class SendPhoneUseCase extends BaseUsecase<void, SendOtpParams> {
  final AuthDomainRepository _repository;

  SendPhoneUseCase({required AuthDomainRepository repository})
    : _repository = repository;

  @override
  Future<void> execute({required SendOtpParams params}) async {
    return _repository.sendOtp(params);
  }
}

class SendOtpParams {
  final String phoneNumber;

  SendOtpParams({required this.phoneNumber});

  JSON toJson() => {"phoneNumber": phoneNumber};
}
