import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/telegram_confirm_model.dart';
import 'package:kyrgyz_tourism/modules/auth/data/models/telegram_otp_model.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/repositories/auth_domain_telegram_repository.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/telegram_confirm_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/send_otp_use_case.dart';

@LazySingleton(as: AuthDomainTelegramRepository)
class AuthTelegramRepository extends AuthDomainTelegramRepository {
  final DioClient _dio;

  AuthTelegramRepository({required DioClient dio}) : _dio = dio;

  @override
  Future<TelegramConfirmModel> confirmOtp(ConfirmOtpParams params) async {
    final result = await _dio.post(
      ApiUrls.confirmOtp,
      data: params.toJson(),
      options: Options(
        headers: {'accept': '*/*', 'Content-Type': 'application/json'},
      ),
    );

    return TelegramConfirmModel.fromJson(result.data);
  }

  @override
  Future<String> getTelegramBotLink() async {
    final result = await _dio.get(ApiUrls.getOtpLink);
    return result.data['link'];
  }

  @override
  Future<TelegramOtpModel> sendOtp(SendOtpParams params) async {
    final result = await _dio.post(
      ApiUrls.registerAndSendOtp,
      data: params.toJson(),
      options: Options(
        headers: {'accept': '*/*', 'Content-Type': 'application/json'},
      ),
    );

    return TelegramOtpModel.fromJson(result.data);
  }
}
