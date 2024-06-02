import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmy_driver/core/app_enum.dart';
import 'package:pharmy_driver/data/repository/tracking_repo.dart';

import 'order_delivery_state.dart';

class OrderDeliveryCubit extends Cubit<OrderDeliveryState> {
  OrderDeliveryCubit() : super(OrderDeliveryState());

  static OrderDeliveryCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  bool isDelivery = true;

  void delivery() {
    emit(state.copyWith(isDelivery: false));
  }

  deliverOrder({required int idOrder,String? code}) async {
    emit(state.copyWith(screenState: ScreenState.loading));
    final response = await TrackingRepo.deliverOrder(idOrder: idOrder,code: code);
    response.fold((l) {
      emit(state.copyWith(screenState: ScreenState.error,error: l));
    }, (r) {
      emit(
        state.copyWith(
          screenState: ScreenState.success,
          deliverOrder: r,
        ),
      );
    });
  }
}
