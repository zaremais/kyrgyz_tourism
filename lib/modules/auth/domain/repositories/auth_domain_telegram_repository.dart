import 'package:kyrgyz_tourism/modules/auth/domain/entities/telegram_confirm_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/entities/telegram_otp_entity.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/telegram_confirm_use_case.dart';
import 'package:kyrgyz_tourism/modules/auth/domain/usecases/register_otp_use_case.dart';

abstract class AuthDomainTelegramRepository {
  Future<TelegramOtpEntity> registerOtp(RegisterOtpParams params);
  Future<TelegramConfirmEntity> confirmOtp(ConfirmOtpParams params);
  Future<String> getTelegramBotLink();
}
