import 'package:kyrgyz_tourism/modules/categories/domain/entities/contact_entity.dart';
import 'package:kyrgyz_tourism/modules/categories/domain/usecases/send_contact_use_case.dart';

abstract class ContactDomainRepository {
  Future<ContactEntity> getContact();
  Future<ContactEntity> sendContact(ContactParams params);
}
