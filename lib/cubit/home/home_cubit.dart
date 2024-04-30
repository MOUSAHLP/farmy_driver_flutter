import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmy_driver/core/app_enum.dart';
import 'package:pharmy_driver/data/repository/home_repo.dart';

import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  int currentIndex = 2;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Timer? _timer;

  HomeCubit() : super(const HomeStates()) {
    _startTimer();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  _startTimer() {
    _timer = Timer.periodic(Duration(minutes: state.time), (Timer timer) {
      getRefreshOrder();
    });
  }

  changeIndex(int index) {
    currentIndex = index;
    emit(state.copyWith(index: index));
  }

  getLastOrder() async {
    emit(state.copyWith(screenState: ScreenState.loading));
    final response = await HomeRepository.getLastOrder();
    response.fold((l) {
      emit(state.copyWith(screenState: ScreenState.error, error: l));
    }, (r) {
      emit(state.copyWith(screenState: ScreenState.success, orderList: r));
    });
  }

  getRefreshOrder() async {
    emit(state.copyWith(isLoading: true));
    final response = await HomeRepository.getLastOrder();
    response.fold((l) {
      // emit(state.copyWith(screenState: ScreenState.error,error:l));
    }, (r) {
      emit(state.copyWith(isLoading: false, orderList: r));
    });
  }

  acceptOrder(int id) async {
    emit(state.copyWith(isLoadingAccept: true));
    final response = await HomeRepository.acceptOrder(id);
    response.fold((l) {
      emit(state.copyWith(errorAccept: l));
    }, (r) {
      state.orderList.removeWhere((element) => element.id == id);
      emit(state.copyWith(isSuccess: true, orderList: state.orderList));
    });
  }

  acceptOrderAssign(int id) async {
    emit(state.copyWith(isLoadingAssign: true));
    final response = await HomeRepository.acceptOrderAssign(id);
    response.fold((l) {
      emit(state.copyWith(errorAssign: l));
    }, (r) {
      state.homeModel?.asignedOrders
          ?.removeWhere((element) => element.id == id);
      emit(state.copyWith(isSuccessAssign: true, homeModel: state.homeModel));
    });
  }

  getHome(String x) async {
    emit(state.copyWith(
        screenState: ScreenState.loading, time: int.parse(x.toString())));
    final response = await HomeRepository.getHome();
    response.fold((l) {
      emit(state.copyWith(screenState: ScreenState.error, error: l));
    }, (r) {
      emit(state.copyWith(
          isSuccessHome: true, homeModel: r, isActive: r.isActive));
    });
  }

  changeActive(bool isActive) async {
    emit(state.copyWith(isLoadingAccept: true));
    final response = await HomeRepository.chengActive(isActive);
    response.fold((l) {
      emit(state.copyWith(errorAccept: l));
    }, (r) {
      emit(
        state.copyWith(isSuccess: true, isActive: !state.isActive),
      );
    });
  }
}
