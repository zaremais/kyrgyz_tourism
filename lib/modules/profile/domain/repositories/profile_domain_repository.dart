import 'package:kyrgyz_tourism/modules/profile/domain/entities/profile_entity.dart';
import 'package:kyrgyz_tourism/modules/profile/domain/usecases/update_profile_use_case.dart';

abstract class ProfileDomainRepository {
  Future<ProfileEntity> getProfile();
  Future<void> updateProfile(ProfileParams params);
}
