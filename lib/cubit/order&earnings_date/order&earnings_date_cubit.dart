import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'order&earnings_date_state.dart';

class Order_earnings_dateCubit extends Cubit<Order_earnings_dateState> {
  Order_earnings_dateCubit() : super(InitialOrder_earnings_dateState());

  static Order_earnings_dateCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  // bool isOrderDate = true;

  // void orderDate() {
  //   isOrderDate = true;

  //   emit(OrderState());
  // }

  // void earningsDate() {
  //   isOrderDate = false;

  //   emit(EarningsState());
  // }
}
