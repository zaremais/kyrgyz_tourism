import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/modules/profile/domain/entities/profile_entity.dart';
import 'package:kyrgyz_tourism/modules/profile/domain/usecases/get_profile_use_case.dart';
import 'package:kyrgyz_tourism/modules/profile/domain/usecases/update_profile_use_case.dart';

@injectable
class ProfileCubit extends Cubit<BaseState<ProfileEntity>> {
  final GetProfileUseCase _getProfileUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;

  ProfileCubit({
    required GetProfileUseCase getProfileUseCase,
    required UpdateProfileUseCase updateProfileUseCase,
  }) : _getProfileUseCase = getProfileUseCase,
       _updateProfileUseCase = updateProfileUseCase,
       super(BaseState(status: StateStatus.init));

  Future<void> getProfile() async {
    emit(BaseState(status: StateStatus.loading));
    try {
      final result = await _getProfileUseCase.execute(params: state.model);
      emit(BaseState(status: StateStatus.success, model: result));
    } catch (e) {
      emit(BaseState(status: StateStatus.error));
    }
  }

  Future<void> updateProfile() async {
    emit(BaseState(status: StateStatus.loading));
    try {
      await _updateProfileUseCase.execute(params: state.model);
    } catch (e) {
      emit(BaseState(status: StateStatus.error));
    }
  }

  Future<void> saveProfile(ProfileParams updateProfile) async {
    emit(BaseState(status: StateStatus.success));
  }
}
