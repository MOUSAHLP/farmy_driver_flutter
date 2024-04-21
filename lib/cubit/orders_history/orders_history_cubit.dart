import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pharmy_driver/core/app_enum.dart';
import 'package:pharmy_driver/data/data_resource/local_resource/data_store.dart';
import 'package:pharmy_driver/data/repository/orders_history_repo.dart';
import 'package:pharmy_driver/models/order_history_model.dart';
import 'orders_history_state.dart';

class OrdersHistoryCubit extends Cubit<OrdersHistoryState> {
  OrdersHistoryCubit() : super(InitialState());

  static OrdersHistoryCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  Map<String, String> weekDays = {
    "Sunday": "الأحد",
    "Monday": "الإتنين",
    "Tuesday": "الثلاثاء",
    "Wednesday": "الأربعاء",
    "Thursday": "الخميس",
    "Friday": "الجمعة",
    "Saturday": "السبت",
  };
  Map<String, String> months = {
    "January": "يناير",
    "February": "فبراير",
    "March": "مارس",
    "April": "أبريل",
    "May": "مايو",
    "June": "يونيو",
    "July": "يوليو",
    "August": "أغسطس",
    "September": "سبتمبر",
    "October": "أكتوبر",
    "November": "نوفمبر",
    "December": "ديسمبر",
  };

  DateTime now = DateTime.now();
  OrdersHistorymodel? ordersHistorymodel;


  Future<void> getDriverOrdersHistory({String? date, String? type}) async {
    emit(LoadingState());

    date ??= now.toString();
    type ??= getType(OrdersHistoryEnums.weekly);

    (await OrderHistoryRepo.getDriverOrdersHistory(date, type)).fold((l) {
      emit(ErrorState(l));
    }, (r) {
      ordersHistorymodel = r;
      emit(SuccessState());
    });
  }

  Future<void> getDriverOrdersStatistics({String? date, String? type}) async {
    emit(UpdatingState());

    date ??= now.toString();
    type ??= getType(OrdersHistoryEnums.weekly);

    (await OrderHistoryRepo.getDriverOrdersStatistics(date, type)).fold((l) {
      emit(ErrorState(l));
    }, (r) {
      ordersHistorymodel!.statisticsdata = r;
      emit(UpdatedState());
    });
  }

  Future<void> addDays(int days) async {
    now = now.add(Duration(days: days));
    await getDriverOrdersStatistics();
  }

  Future<void> subtractDays(int days) async {
    now = now.subtract(Duration(days: days));
    await getDriverOrdersStatistics();
  }

  String getDate(context) {
    int preDays = now.subtract(const Duration(days: 7)).day;
    String month = DateFormat('MMMM').format(DateTime(now.year, now.month));

    if (DataStore.instance.isArabic) {
      month = months[month] ?? "";
    }

    return '$month ( ${now.day} - $preDays )';
  }

}
