import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/profile/domain/entities/profile_entity.dart';
import 'package:kyrgyz_tourism/modules/profile/domain/repositories/profile_domain_repository.dart';

@injectable
class UpdateProfileUseCase extends BaseUsecase<ProfileEntity, ProfileParams> {
  final ProfileDomainRepository _repository;

  UpdateProfileUseCase({required ProfileDomainRepository repository})
    : _repository = repository;

  @override
  Future<ProfileEntity> execute({required params}) {
    return _repository.updateProfile(params);
  }
}

class ProfileParams {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;

  ProfileParams(this.name, this.email, this.phoneNumber, this.password);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }
}
