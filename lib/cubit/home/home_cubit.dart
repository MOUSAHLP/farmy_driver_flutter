import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmy_driver/core/services/services_locator.dart';
import 'package:pharmy_driver/cubit/setting/setting_bloc.dart';

import '../../core/app_enum.dart';
import '../../data/repository/home_repo.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  int currentIndex = 2;
   GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Timer? _timer;

  HomeCubit() : super(HomeStates()) {
    _startTimer();
    print(sl<SettingBloc>().settingModel?.data?.phone??"");
  }

  void _startTimer() {

    _timer = Timer.periodic(Duration(minutes: state.time), (Timer timer) {
      getRefreshOrder();
    });
  }
  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
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

  getRefreshOrder()async {
    emit(state.copyWith(isLoading: true));
    final response = await HomeRepository.getLastOrder();
    response.fold((l) {
     // emit(state.copyWith(screenState: ScreenState.error,error:l));
    }, (r) {
      emit(state.copyWith(isLoading: false,orderList: r));
    });
  }
  acceptOrder(int id)async{
    emit(state.copyWith(isLoadingAccept: true));
    final response = await HomeRepository.acceptOrder(id);
    response.fold((l) {
    emit(state.copyWith(errorAccept: l));
    }, (r) {
      state.orderList.removeWhere((element) => element.id==id);
      emit(state.copyWith(isSuccess: true,orderList: state.orderList ));
    });
  }
  acceptOrderAssign(int id)async{
    emit(state.copyWith(isLoadingAssign: true));
    final response = await HomeRepository.acceptOrder(id);
    response.fold((l) {
    emit(state.copyWith(errorAssign: l));
    }, (r) {
      state.homeModel?.asignedOrders?.removeWhere((element) => element.id==id);
      emit(state.copyWith(isSuccessAssign: true ,homeModel:state.homeModel ));
    });
  }
  getHome(String x)async {
    emit(state.copyWith(screenState: ScreenState.loading,time: int.parse(x.toString())));
    final response = await HomeRepository.getHome();
    response.fold((l) {
       emit(state.copyWith(screenState: ScreenState.error,error:l));
    }, (r) {
      emit(state.copyWith(isSuccessHome:true,homeModel: r));
    });
  }

}