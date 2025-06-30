import 'package:dio/dio.dart';

class ApiException {
  List<String> getExceptionMessage(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.badResponse:
        return [
          "Bad Response Error",
          "Check Api url or parameters are invalid",
        ];

      case DioExceptionType.connectionError:
        return ["Connection Error", "Check network Connectivity!"];

      case DioExceptionType.connectionTimeout:
        return ["Connection TimeOut", "Check network Connectivity!"];

      case DioExceptionType.cancel:
        return ["Request Cancelled", "Check API url or parameters are invalid"];

      case DioExceptionType.receiveTimeout:
        return [
          "Receive TimeOut",
          "Check API url, Network Connectivity or parameters are invalid",
        ];

      default:
        return ["Unknow Error", "Check API url or parameters are invalid"];
    }
  }
}
