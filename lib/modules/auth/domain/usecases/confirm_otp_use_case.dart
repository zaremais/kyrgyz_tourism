import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/telegram_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_repository.dart';

@injectable
class ConfirmOtpUseCase extends BaseUsecase<void, ConfirmOtpParams> {
  final AuthDomainRepository _repository;

  ConfirmOtpUseCase({required AuthDomainRepository repository})
    : _repository = repository;

  @override
  Future<TelegramEntity> execute({required ConfirmOtpParams params}) async {
    return _repository.confirmOtp(params: params);
  }
}

class ConfirmOtpParams {
  final String username;
  final String otp;
  final String phoneNumber;
  ConfirmOtpParams({
    required this.username,
    required this.otp,
    required this.phoneNumber,
  });

  JSON toJson() => {
    "username": username,
    'otp': otp,
    'phoneNumber': phoneNumber,
  };
}
