import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/modules/auth/data/api_service/auth_api_service.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/telegram_confirm_model.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/telegram_otp_model.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_telegram_repository.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/telegram_confirm_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/register_otp_use_case.dart';

@LazySingleton(as: AuthDomainTelegramRepository)
class AuthTelegramRepository extends AuthDomainTelegramRepository {
  final AuthApiService _api;

  AuthTelegramRepository({required AuthApiService api}) : _api = api;

  @override
  Future<TelegramConfirmModel> confirmOtp(ConfirmOtpParams params) async {
    final response = await _api.confirmOtp(params);
    return response;
  }

  @override
  Future<String> getTelegramBotLink() async {
    final response = await _api.getOtpLink('link');
    return response;
  }

  @override
  Future<TelegramOtpModel> registerOtp(RegisterOtpParams params) async {
    final response = await _api.registerOtp(params);
    return response;
  }
}
