import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_drawer_state.dart';

class NavigationDrawerCubit extends Cubit<NavigationDrawerState> {
  NavigationDrawerCubit()
      : super(
          const NavigationDrawerState(status: NavigationDrawerStatus.home),
        );

  void changeDrawer(NavigationDrawerStatus navigationDrawerStatus) {
    emit(state.copyWith(status: navigationDrawerStatus));
  }
}
