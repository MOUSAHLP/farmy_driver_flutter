import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../core/app_enum.dart';
import '../../data/repository/home_repo.dart';
import '../../data/repository/order_repo.dart';
import 'order_states.dart';

class OrderCubit extends Cubit<OrderStates> {


  OrderCubit() : super(const OrderStates());
  getOrder()async {
    emit(state.copyWith(screenState: ScreenState.loading));
    final response = await OrderRepository.getOrder();
    response.fold((l) {
      emit(state.copyWith(screenState: ScreenState.error,error:l));
    }, (r) {
      emit(state.copyWith(screenState: ScreenState.success,orderList: r));
    });
  }
  getOrderDetails(int id)async {
    emit(state.copyWith(screenState: ScreenState.loading));
    final response = await OrderRepository.getOrderDetails(id);
    response.fold((l) {
      emit(state.copyWith(screenState: ScreenState.error,error:l));
    }, (r) {
      emit(state.copyWith(screenState: ScreenState.success,orderDetailsModel: r));
    });
  }


}