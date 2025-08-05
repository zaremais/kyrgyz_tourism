import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/sign_in_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_sign_in_repository.dart';

@injectable
class RefreshTokenUseCase extends BaseUsecase<SignInEntity, RefreshParams> {
  final AuthDomainSignInRepository _repository;

  RefreshTokenUseCase({required AuthDomainSignInRepository repository})
    : _repository = repository;

  @override
  Future<SignInEntity> execute({required RefreshParams params}) async {
    return await _repository.refreshToken(params);
  }
}

class RefreshParams {
  final String accessToken;
  final String refreshToken;

  RefreshParams({required this.accessToken, required this.refreshToken});

  JSON toJson() {
    return {'accessToken': accessToken, 'refreshToken': refreshToken};
  }
}
