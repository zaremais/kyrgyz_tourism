import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

@module
abstract class CoreModule {
  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();
}

@lazySingleton
class TokenStorageService {
  final FlutterSecureStorage _s;
  TokenStorageService(this._s);

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _s.write(key: 'accessToken', value: accessToken);
    await _s.write(key: 'refreshToken', value: refreshToken);
  }

  Future<String?> getAccessToken() => _s.read(key: 'accessToken');
  Future<String?> getRefreshToken() => _s.read(key: 'refreshToken');
  Future<void> clear() => _s.deleteAll();
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

