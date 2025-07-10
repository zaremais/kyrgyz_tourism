import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_repository.dart';

@injectable
class OtpConfirmUseCase extends BaseUsecase<void, OtpConfirmParams> {
  final AuthDomainRepository _repository;

  OtpConfirmUseCase({required AuthDomainRepository repository})
    : _repository = repository;

  @override
  Future<void> execute({required OtpConfirmParams params}) {
    return _repository.verifyOtp(params);
  }
}

class OtpConfirmParams {
  final String phoneNumber;
  final String otpCode;

  OtpConfirmParams({required this.phoneNumber, required this.otpCode});
  Map<String, dynamic> toJson() => {
    "phoneNumber": phoneNumber,
    "otpCode": otpCode,
  };
}
