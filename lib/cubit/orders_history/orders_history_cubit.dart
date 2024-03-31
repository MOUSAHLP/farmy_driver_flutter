import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmy_driver/data/repository/orders_history_repo.dart';
import 'package:pharmy_driver/models/order_history_model.dart';
import 'orders_history_state.dart';

class OrdersHistoryCubit extends Cubit<OrdersHistoryState> {
  OrdersHistoryCubit() : super(InitialState());

  static OrdersHistoryCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  OrdersHistorymodel? ordersHistorymodel;

  Future<void> getDriverOrdersHistory(String date, String type) async {
    emit(LoadingState());

    (await OrderHistoryRepo.getDriverOrdersHistory(date, type)).fold((l) {
      emit(ErrorState(l));
    }, (r) {
      ordersHistorymodel = r;
      emit(SuccessState());
    });
  }

  // void earningsDate() {
  //   isOrderDate = false;

  //   emit(EarningsState());
  // }
}
