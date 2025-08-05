import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_telegram_repository.dart';

@injectable
class GetOtpLinkUseCase extends BaseUsecase<String, NoParams> {
  final AuthDomainTelegramRepository _repository;

  GetOtpLinkUseCase({required AuthDomainTelegramRepository repository})
    : _repository = repository;

  @override
  Future<String> execute({required params})async {
    return _repository.getTelegramBotLink();
  }
}
