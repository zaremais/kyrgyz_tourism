import 'package:kyrgyz_tourism/core/network/storage_secure_storage/token_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsTokenStorage implements TokenStorageService {
  final SharedPreferences prefs;

  SharedPrefsTokenStorage(this.prefs);

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await prefs.setString('accessToken', accessToken);
    await prefs.setString('refreshToken', refreshToken);
  }

  @override
  Future<String?> getAccessToken() async {
    return prefs.getString('accessToken');
  }

  @override
  Future<String?> getRefreshToken() async {
    return prefs.getString('refreshToken');
  }

  @override
  Future<void> clearTokens() async {
    await prefs.remove('accessToken');
    await prefs.remove('refreshToken');
  }

  @override
  Future<void> saveAccessToken(String token) async {
    await prefs.setString('accessToken', token);
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    await prefs.setString('refreshToken', token);
  }
}
