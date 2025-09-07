import 'dart:io';
import 'package:injectable/injectable.dart';

@injectable
class ConnectivityService {
  Future<bool> hasConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<bool> hasConnectionToHost(String host) async {
    try {
      final result = await InternetAddress.lookup(host);
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  Stream<bool> get connectionStream async* {
    while (true) {
      yield await hasConnection();
      await Future.delayed(const Duration(seconds: 5));
    }
  }
}
