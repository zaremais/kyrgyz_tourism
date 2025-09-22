import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/features/categories/data/api_service/contact_api_service.dart';
import 'package:kyrgyz_tourism/features/categories/data/models/contact_model.dart';
import 'package:kyrgyz_tourism/features/categories/domain/repositories/contact_domain_repository.dart';
import 'package:kyrgyz_tourism/features/categories/domain/usecases/send_contact_use_case.dart';

@LazySingleton(as: ContactDomainRepository)
class ContactRepository extends ContactDomainRepository {
  final ContactApiService _contactApi;

  ContactRepository({required ContactApiService contactApi})
    : _contactApi = contactApi;

  @override
  Future<ContactModel> getContact() async {
    return await _contactApi.getContact();
  }

  @override
  Future<ContactModel> sendContact(ContactParams params) async {
    return await _contactApi.sendContact(params);
  }
}
