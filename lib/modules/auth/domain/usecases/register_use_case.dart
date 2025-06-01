import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/user_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_repository.dart';

@injectable
class RegisterUseCase extends BaseUsecase {
  final AuthDomainRepository _repository;

  RegisterUseCase({required AuthDomainRepository repository})
    : _repository = repository;

  @override
  Future<UserEntity> execute({required params}) async {
    return _repository.register(params);
  }
}

@injectable
class RegisterParams {
  final String telegramPhone;
  final String code;

  RegisterParams({required this.telegramPhone, required this.code});

  Map<String, dynamic> toJson() {
    return {'telegramPhone': telegramPhone, 'code': code};
  }
}
