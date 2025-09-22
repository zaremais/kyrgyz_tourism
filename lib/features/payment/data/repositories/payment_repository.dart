import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/features/payment/data/models/payment_model.dart';
import 'package:kyrgyz_tourism/features/payment/domain/repositories/payment_domain_repository.dart';
import 'package:kyrgyz_tourism/features/payment/domain/usecases/get_payment_qr_code_use_case.dart';

@LazySingleton(as: PaymentDomainRepository)
class PaymentRepository extends PaymentDomainRepository {
  final DioClient _dio;

  PaymentRepository({required DioClient dio}) : _dio = dio;

  @override
  Future<PaymentQrModel> getPaymentQr(QrCodeParams params) async {
    final response = await _dio.get(
      'http://34.18.76.114/v1/api/qr/mbank',
      queryParameters: params.toJson(),
      options: Options(responseType: ResponseType.bytes),
    );

    return PaymentQrModel.fromBytes(response.data);
  }
}
