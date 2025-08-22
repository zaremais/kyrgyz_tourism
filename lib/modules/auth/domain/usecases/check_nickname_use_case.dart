import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_sign_up_repository.dart';

@injectable
class CheckNicknameUseCase extends BaseUsecase<bool, CheckNickNameParams> {
  final AuthDomainSignUpRepository _repository;

  CheckNicknameUseCase({required AuthDomainSignUpRepository repository})
    : _repository = repository;

  @override
  Future<bool> execute({required CheckNickNameParams params}) async {
    return _repository.checkNickname(params);
  }
}

class CheckNickNameParams {
  final String nickname;

  CheckNickNameParams({required this.nickname});

  JSON toJson() {
    return {'nickname': nickname};
  }
}
