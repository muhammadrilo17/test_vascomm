import 'package:flutter_bloc/flutter_bloc.dart';

class NavDrawerCubit extends Cubit<bool> {
  NavDrawerCubit() : super(false);

  void openHideDrawer() {
    emit(!state);
  }
}
