import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_enum.dart';
import '../../data/repository/home_repo.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  int currentIndex = 2;
   GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  HomeCubit() : super(HomeStates());

  changeIndex(int index) {
    currentIndex = index;
    emit(state.copyWith(index: index));
  }
  getLastOrder()async {
    emit(state.copyWith(screenState: ScreenState.loading));
    final response = await HomeRepository.getLastOrder();
    response.fold((l) {
      emit(state.copyWith(screenState: ScreenState.error,error:l));
    }, (r) {
      emit(state.copyWith(screenState: ScreenState.success,orderList: r));
    });

  }

}