import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_usecase.dart';
import 'package:kyrgyz_tourism/modules/profile/domain/repositories/profile_domain_repository.dart';

@injectable
class UpdateProfileUseCase extends BaseUsecase {
  final ProfileDomainRepository _repository;

  UpdateProfileUseCase({required ProfileDomainRepository repository})
    : _repository = repository;

  @override
  Future<void> execute({required params}) {
    return _repository.updateProfile(params);
  }
}

class ProfileParams {
  final String name;
  final String nickname;
  final String email;
  final String phone;
  final String location;

  ProfileParams(
    this.name,
    this.nickname,
    this.email,
    this.phone,
    this.location,
  );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nickname': nickname,
      'email': email,
      'phone': phone,
      'location': location,
    };
  }
}
