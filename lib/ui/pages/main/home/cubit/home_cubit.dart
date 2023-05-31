import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final List<String> productItems = [
    'All Product',
    'Layanan Kesehatan',
    'Alat Kesehatan',
    'Product Kesehatan',
    'Manfaat Kesehatan',
  ];
}
