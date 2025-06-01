import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/network/dio_client.dart';
import 'package:kyrgyz_tourism/modules/profile/data/models/profile_model.dart';
import 'package:kyrgyz_tourism/modules/profile/domain/repositories/profile_domain_repository.dart';
import 'package:kyrgyz_tourism/modules/profile/domain/usecases/update_profile_use_case.dart';

@LazySingleton(as: ProfileDomainRepository)
class ProfileRepository extends ProfileDomainRepository {
  final DioClient _dio;

  ProfileRepository({required DioClient dio}) : _dio = dio;

  @override
  Future<ProfileModel> getProfile() async {
    final result = await _dio.get('/profile');
    return ProfileModel.fromJson(result.data);
  }

  @override
  Future<void> updateProfile(ProfileParams params) async {
    await _dio.put('/profile', data: params.toJson());
  }
}
