import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/telegram_otp_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_telegram_repository.dart';

@injectable
class RegisterOtpUseCase
    extends BaseUsecase<TelegramOtpEntity, RegisterOtpParams> {
  final AuthDomainTelegramRepository _repository;

  RegisterOtpUseCase({required AuthDomainTelegramRepository repository})
    : _repository = repository;

  @override
  Future<TelegramOtpEntity> execute({required RegisterOtpParams params}) async {
    return _repository.registerOtp(params);
  }
}

class RegisterOtpParams {
  final int chatId;
  final String phoneNumber;

  RegisterOtpParams({required this.chatId, required this.phoneNumber});

  JSON toJson() => {"phoneNumber": phoneNumber, 'chatId': chatId};
}
