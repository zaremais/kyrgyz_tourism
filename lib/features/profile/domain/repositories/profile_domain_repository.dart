import 'dart:io';

import 'package:kyrgyz_tourism/features/profile/domain/entities/profile_entity.dart';
import 'package:kyrgyz_tourism/features/profile/domain/usecases/update_profile_use_case.dart';

abstract class ProfileDomainRepository {
  Future<ProfileEntity> getProfile();
  Future<ProfileEntity> updateProfile(ProfileParams params);
  Future<ProfileEntity> uploadProfilePhoto(File photo);
}
