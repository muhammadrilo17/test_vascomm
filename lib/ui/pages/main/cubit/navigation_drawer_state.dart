part of 'navigation_drawer_cubit.dart';

enum NavigationDrawerStatus { openDrawer, home, profile, settings, logout }

class NavigationDrawerState extends Equatable {
  final NavigationDrawerStatus status;
  const NavigationDrawerState({
    this.status = NavigationDrawerStatus.home,
  });

  @override
  List<Object?> get props => [status];

  NavigationDrawerState copyWith({
    NavigationDrawerStatus? status,
  }) {
    return NavigationDrawerState(
      status: status ?? this.status,
    );
  }
}
