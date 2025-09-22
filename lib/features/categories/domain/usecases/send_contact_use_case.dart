import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/core/constants/typedefs.dart';
import 'package:kyrgyz_tourism/features/categories/domain/entities/contact_entity.dart';
import 'package:kyrgyz_tourism/features/categories/domain/repositories/contact_domain_repository.dart';

@injectable
class SendContactUseCase extends BaseUsecase<ContactEntity, ContactParams> {
  final ContactDomainRepository _repository;

  SendContactUseCase({required ContactDomainRepository repository})
    : _repository = repository;

  @override
  Future<ContactEntity> execute({required ContactParams params}) async {
    return await _repository.sendContact(params);
  }
}

class ContactParams {
  final String fullName;
  final String phoneNumber;
  final String email;
  final String comment;

  ContactParams({
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.comment,
  });

  JSON toJson() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'comment': comment,
    };
  }
}
