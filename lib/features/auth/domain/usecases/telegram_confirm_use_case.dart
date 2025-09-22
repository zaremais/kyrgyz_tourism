import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/features/auth/domain/entities/telegram_confirm_entity.dart';
import 'package:kyrgyz_tourism/features/auth/domain/repositories/auth_domain_telegram_repository.dart';

@injectable
class TelegramConfirmUseCase
    extends BaseUsecase<TelegramConfirmEntity, ConfirmOtpParams> {
  final AuthDomainTelegramRepository _repository;

  TelegramConfirmUseCase({required AuthDomainTelegramRepository repository})
    : _repository = repository;

  @override
  Future<TelegramConfirmEntity> execute({
    required ConfirmOtpParams params,
  }) async {
    return _repository.confirmOtp(params);
  }
}

class ConfirmOtpParams {
  // final String username;
  final String otp;
  final String phoneNumber;
  ConfirmOtpParams({
    // required this.username,
    required this.otp,
    required this.phoneNumber,
  });

  JSON toJson() => {
    // "username": username,
    'otp': otp,
    'phoneNumber': phoneNumber,
  };
}
