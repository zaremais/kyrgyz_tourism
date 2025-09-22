import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterSuccessCubit extends Cubit<void> {
  RegisterSuccessCubit() : super(null);

  Future<void> autoNavigate(Function onNavigate) async {
    await Future.delayed(const Duration(seconds: 3));
    onNavigate();
  }
}
