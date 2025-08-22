import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/modules/payment/data/models/payment_model.dart';
import 'package:kyrgyz_tourism/modules/payment/domain/repositories/payment_domain_repository.dart';
import 'package:kyrgyz_tourism/modules/payment/domain/usecases/get_payment_qr_code_use_case.dart';

@LazySingleton(as: PaymentDomainRepository)
class PaymentRepository extends PaymentDomainRepository {
  final DioClient _dio;

  PaymentRepository({required DioClient dio}) : _dio = dio;

  @override
  Future<PaymentQrModel> getPaymentQr(QrCodeParams params) async {
    final response = await _dio.get(
      ApiUrls.getQrCode,
      queryParameters: params.toJson(),
      options: Options(responseType: ResponseType.bytes),
    );

    return PaymentQrModel.fromBytes(response.data);
  }
}
