import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordConfirmCubit extends Cubit<bool> {
  PasswordConfirmCubit() : super(false);

  void showHidePassword() {
    emit(!state);
  }
}