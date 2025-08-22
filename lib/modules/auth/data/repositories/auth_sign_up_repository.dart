import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/modules/auth/data/api_service/auth_api_service.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/sign_up_model.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_sign_up_repository.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/check_nickname_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/sign_up_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/verify_code_use_case.dart';

@LazySingleton(as: AuthDomainSignUpRepository)
class AuthSignUpRepository extends AuthDomainSignUpRepository {
  final AuthApiService _api;

  AuthSignUpRepository({required AuthApiService api}) : _api = api;

  @override
  Future<bool> checkNickname(CheckNickNameParams params) async {
    final isTaken = await _api.checkNickname(params.nickname);
    return isTaken;
  }

  @override
  Future<bool> verifyCode(VerifyCodeParams params) async {
    try {
      await _api.verifyCode(params.code);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<SignUpModel> signup(SignUpParams params) async {
    final response = await _api.signup(params);
    return response;
  }
}
  

  // Future<bool> isLoggedIn() async {
  //   final accessToken = await _tokenStorage.getAccessToken();
  //   return accessToken != null && accessToken.isNotEmpty;
  // }jjj