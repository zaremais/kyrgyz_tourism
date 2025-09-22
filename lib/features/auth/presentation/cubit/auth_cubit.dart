import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kyrgyz_tourism/core/base/base_state.dart';
import 'package:kyrgyz_tourism/core/enums/state_status.dart';
import 'package:kyrgyz_tourism/features/auth/domain/usecases/is_logged_in_use_case.dart';

@injectable
class AuthCubit extends Cubit<BaseState<bool>> {
  final IsLoggedInUseCase _isLoggedInUseCase;

  AuthCubit({required IsLoggedInUseCase isLoggedInUseCase})
    : _isLoggedInUseCase = isLoggedInUseCase,
      super(BaseState(status: StateStatus.init));

  Future<void> appStarted({params}) async {
    emit(BaseState(status: StateStatus.loading));

    try {
      final isLoggedIn = await _isLoggedInUseCase.execute(params: params);

      emit(BaseState(status: StateStatus.success, model: isLoggedIn));
    } catch (e) {
      emit(BaseState(status: StateStatus.failure));
    }
  }
}


// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';
// import 'package:kyrgyz_tourism/core/base/base_state.dart';
// import 'package:kyrgyz_tourism/core/enums/state_status.dart';
// import 'package:kyrgyz_tourism/modules/auth/domain/entities/user_entity.dart';
// import 'package:kyrgyz_tourism/modules/auth/domain/usecases/get_current_user_use_case.dart';
// import 'package:kyrgyz_tourism/modules/auth/domain/usecases/login_use_case.dart';
// import 'package:kyrgyz_tourism/modules/auth/domain/usecases/logout_use_case.dart';
// import 'package:kyrgyz_tourism/modules/auth/domain/usecases/register_use_case.dart';

// @injectable
// class AuthCubit extends Cubit<BaseState<UserEntity>> {
//   final LoginUsecase _loginUsecase;
//   final RegisterUseCase _registerUseCase;
//   final LogoutUseCase _logoutUseCase;
//   final GetCurrentUserUseCase _getCurrentUserUseCase;

//   AuthCubit({
//     required LoginUsecase loginUsecase,
//     required RegisterUseCase registerUseCase,
//     required LogoutUseCase logoutUseCase,
//     required GetCurrentUserUseCase getCurrentUserUseCase,
//   }) : _loginUsecase = loginUsecase,
//        _registerUseCase = registerUseCase,
//        _logoutUseCase = logoutUseCase,
//        _getCurrentUserUseCase = getCurrentUserUseCase,

//        super(BaseState(status: StateStatus.init));

//   Future<void> login({required params}) async {
//     emit(BaseState(status: StateStatus.loading));
//     try {
//       final user = await _loginUsecase.execute(
//         params: params);
      
//       emit(BaseState(status: StateStatus.success, model: user));
//     } catch (e) {
//       emit(BaseState(status: StateStatus.error, error: e.toString()));
//     }
//   }

//   Future<void> register(RegisterParams registerParams, {required params}) async {
//     emit(BaseState(status: StateStatus.loading));
//     try {
//       final user = await _registerUseCase.execute(params: params);
//       emit(BaseState(status: StateStatus.success, model: user));
//     } catch (e) {
//       emit(BaseState(status: StateStatus.error));
//     }
//   }

//   Future<void> logout() async {
//     emit(BaseState(status: StateStatus.loading));
//     try {
//       await _logoutUseCase.execute(params: state.model);
//       emit(BaseState(status: StateStatus.init));
//     } catch (e) {
//       emit(BaseState(status: StateStatus.error));
//     }
//   }

//   Future<void> loadCurrentUser() async {
//     final user = await _getCurrentUserUseCase.execute(params: state.model);
//     if (user != null) {
//       emit(BaseState(status: StateStatus.success, model: user));
//     }
//   }
// }
