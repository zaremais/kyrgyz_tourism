import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/constants/api_urls.dart';
import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/modules/categories/data/models/contact_model.dart';
import 'package:kyrgyz_tourism/modules/categories/domain/repositories/contact_domain_repository.dart';
import 'package:kyrgyz_tourism/modules/categories/domain/usecases/send_contact_use_case.dart';

@LazySingleton(as: ContactDomainRepository)
class ContactRepository extends ContactDomainRepository {
  final DioClient _dio;

  ContactRepository({required DioClient dio}) : _dio = dio;

  @override
  Future<ContactModel> getContact() async {
    try {
      final response = await _dio.get(
        ApiUrls.getContact,
        options: Options(headers: {'accept': '*/*'}),
      );
      return ContactModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Ошибка запроса на обратную связь');
    }
  }

  @override
  Future<ContactModel> sendContact(ContactParams params) async {
    try {
      final response = await _dio.post(
        ApiUrls.createContact,
        data: params.toJson(),
        options: Options(
          headers: {'accept': '*/*', 'Content-Type': 'application/json'},
        ),
      );

      return ContactModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Ошибка в запросе');
    }
  }
}
