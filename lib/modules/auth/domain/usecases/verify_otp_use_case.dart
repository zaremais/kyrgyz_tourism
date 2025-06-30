import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_repository.dart';

@injectable
class VerifyOtpUseCase extends BaseUsecase<void, VerifyOtpParams> {
  final AuthDomainRepository _repository;

  VerifyOtpUseCase({required AuthDomainRepository repository})
    : _repository = repository;

  @override
  Future<void> execute({required VerifyOtpParams params}) {
    return _repository.verifyOtp(params);
  }
}

class VerifyOtpParams {
  final String phoneNumber;
  final String otpCode;

  VerifyOtpParams({required this.phoneNumber, required this.otpCode});
  Map<String, dynamic> toJson() => {
    "phoneNumber": phoneNumber,
    "otpCode": otpCode,
  };
}
