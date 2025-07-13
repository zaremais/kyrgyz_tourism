import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/telegram_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_repository.dart';

@injectable
class SendOtpUseCase extends BaseUsecase<void, SendOtpParams> {
  final AuthDomainRepository _repository;

  SendOtpUseCase({required AuthDomainRepository repository})
    : _repository = repository;

  @override
  Future<TelegramEntity> execute({required SendOtpParams params}) async {
    return _repository.sendOtp(params);
  }
}

class SendOtpParams {
  final int chatId;
  final String phoneNumber;

  SendOtpParams({required this.chatId, required this.phoneNumber});

  JSON toJson() => {"phoneNumber": phoneNumber, 'chatId': chatId};
}
