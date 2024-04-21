import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmy_driver/cubit/all_orders_date/all_orders_date_state.dart';
import 'package:pharmy_driver/data/repository/all_orders_repo.dart';
import 'package:pharmy_driver/models/all_orders_model.dart';

class AllOrdersDateCubit extends Cubit<AllOrdersDateState> {
  AllOrdersDateCubit() : super(InitialState());

  static AllOrdersDateCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

 List<AllOrdersModel>? allOrdersModel;

  Future<void> getDriverTransactions() async {
    emit(LoadingState());

    (await AllOrdersRepo.getDriverAllOrders()).fold((l) {
      emit(ErrorState(l));
    }, (r) {
      allOrdersModel = r;
      emit(SuccessState());
    });
  }
}
