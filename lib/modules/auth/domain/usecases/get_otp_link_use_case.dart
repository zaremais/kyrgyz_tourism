import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/telegram_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_repository.dart';

class GetOtpLinkUseCase extends BaseUsecase<TelegramEntity, void> {
  final AuthDomainRepository _repository;

  GetOtpLinkUseCase({required AuthDomainRepository repository})
    : _repository = repository;

  @override
  Future<TelegramEntity> execute({required void params}) {
    return _repository.getOtpLink();
  }
}
