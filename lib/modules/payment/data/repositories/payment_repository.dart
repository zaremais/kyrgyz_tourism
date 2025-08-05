import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/modules/payment/data/models/payment_model.dart';
import 'package:kyrgyz_tourism/modules/payment/domain/repositories/payment_domain_repository.dart';
import 'package:kyrgyz_tourism/modules/payment/domain/usecases/applay_promocode_use_case.dart';

@LazySingleton(as: PaymentDomainRepository)
class PaymentRepository extends PaymentDomainRepository {
  final DioClient _dio;

  PaymentRepository({required DioClient dio}) : _dio = dio;

  @override
  Future<PaymentModel> getPaymentInfo() async {
    try {
      final result = await _dio.get(
        ApiUrls.getPayment,

        options: Options(headers: {'accept': 'image/png'}),
      );

      return PaymentModel.fromJson(result.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<PaymentModel> applyPromocode(PromocodeParams params) async {
    try {
      final result = await _dio.post(
        ApiUrls.promocode,
        data: params.toJson(),
        options: Options(
          headers: {
            // 'Content-Type': 'aplication/json',
            // 'accept': '*/*',
            // "id": 9007199254740991,
            // "code": "string",
            // "discountPercent": 0.1,
            // "validFrom": "string",
            // "validTo": "string",
            // "active": true,
          },
        ),
      );
      return PaymentModel.fromJson(result.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> confirmBooking() async {
    await _dio.post(ApiUrls.confirmBooked);
  }

  Future<Uint8List?> fetchQrCode(int amount) async {
    final dio = Dio();
    try {
      final response = await dio.get(
        'http://34.18.76.114/v1/api/qr/mbank',
        queryParameters: {'amount': amount},
        options: Options(
          responseType: ResponseType.bytes,
        ), // Получаем байты изображения
      );
      return response.data; // Возвращаем Uint8List (PNG)
    } catch (e) {
      print('Ошибка при загрузке QR-кода: $e');
      return null;
    }
  }
}
