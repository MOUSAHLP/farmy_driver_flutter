
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/notification_repository.dart';
import '../../models/notification_model.dart';
import 'notification_state.dart';

class NotificationBloc extends Cubit<NotificationState> {
  late TabController tabController;
  List<NotificationModel> listNotification=[];
  int index =0;
  NotificationBloc() : super(NotificationLoading()) ;
  getNotificationList()async {
    emit(NotificationLoading());
    listNotification.clear();
    final response = await NotificationRepository.getNotifications();
    response.fold((l) {
      emit(NotificationError(l));
    }, (r) {
      listNotification=r;
      emit(NotificationSuccess(r));
    });
  }




}
