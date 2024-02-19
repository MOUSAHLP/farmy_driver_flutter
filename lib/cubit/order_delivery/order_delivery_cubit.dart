import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_delivery_state.dart';
class OrderDeliveryCubit extends Cubit<OrderDeliveryState> {
  OrderDeliveryCubit() : super(InitialOrderDeliveryState());

  static OrderDeliveryCubit get(BuildContext context) {
    return BlocProvider.of(context);

  }
  bool isDelivery = true;
  void delivery() {
    isDelivery = false;
    emit(DeliveryState());
  }
}