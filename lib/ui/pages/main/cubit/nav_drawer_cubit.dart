import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_vascomm/ui/pages.dart';

class NavDrawerCubit extends Cubit<bool> {
  NavDrawerCubit() : super(false);

  void openHideDrawer() {
    emit(!state);
  }

  void logout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      Pages.login,
      (route) => false,
    );
    emit(!state);
  }
}
