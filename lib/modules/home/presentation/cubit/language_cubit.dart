import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<bool> {
  LanguageCubit() : super(false); 

  void toggleLanguage() {
    emit(!state);
  }
}