import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_repository.dart';

class GetOtpLinkUseCase extends BaseUsecase<String, dynamic> {
  final AuthDomainRepository _repository;

  GetOtpLinkUseCase({required AuthDomainRepository repository})
    : _repository = repository;

  @override
  Future<String> execute({required params}) {
    return _repository.getTelegramBotLink();
  }
}
