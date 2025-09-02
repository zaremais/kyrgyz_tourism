import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class TokenStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const _accessTokenKey = 'accessToken';
  static const _refreshTokenKey = 'refreshToken';

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }

  Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  Future<void> clearTokens() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }
}

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class TokenStorageService {
//   final _storage = const FlutterSecureStorage();

//   Future<void> saveTokens({required String accessToken, required String refreshToken}) async {
//     await _storage.write(key: 'accessToken', value: accessToken);
//     await _storage.write(key: 'refreshToken', value: refreshToken);
//   }

//   Future<String?> getAccessToken() async {
//     return await _storage.read(key: 'accessToken');
//   }

//   Future<String?> getRefreshToken() async {
//     return await _storage.read(key: 'refreshToken');
//   }

//   Future<void> clearTokens() async {
//     await _storage.deleteAll();
//   }
// }
