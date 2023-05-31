import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_vascomm/core/domain/usecase/login_usecase.dart';
import 'package:test_vascomm/core/utils/payload/login_payload.dart';
import 'package:test_vascomm/ui/pages.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _useCase;
  LoginCubit(this._useCase)
      : super(
          const LoginState(status: LoginStatus.initial),
        );

  void login(String email, String password) async {
    emit(state.copyWith(status: LoginStatus.loading));
    print('object :cubit $email $password');
    LoginPayload loginPayload = LoginPayload(email, password);

    final response = await _useCase.login(loginPayload);
    if (response.data != null) {
      final result = response.data as bool;
      if (result) {
        print('object : SUKSES');
        emit(state.copyWith(status: LoginStatus.success));
      }
    } else {
      print('object : FAIL $response.message');
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          message: response.message,
        ),
      );
    }
  }

  void moveToMainPage(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      Pages.home,
      (route) => false,
    );
  }

  void moveToRegisterPage(BuildContext context) {
    Navigator.pushNamed(context, Pages.register);
  }
}
