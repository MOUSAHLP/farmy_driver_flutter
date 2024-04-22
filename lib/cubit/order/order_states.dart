// abstract class HomeStates{}
// class InitialHomeState extends HomeStates{}

import 'package:equatable/equatable.dart';
import 'package:pharmy_driver/core/app_enum.dart';

import '../../models/order_details_model.dart';
import '../../models/order_model.dart';

class OrderStates extends Equatable {
  final int index;
  final ScreenState screenState;
  final String error;
  final String errorAccept;
  final String errorUpdate;
  final bool isLoading;
  final bool isLoadingAccept;
  final bool isLoadingUpdate;
  final bool isSuccessAccept;
  final bool isSuccessUpdate;
  final List<OrderModel> orderList;
  final OrderDetailsModel? orderDetailsModel;
  final String trackingUrl;

  const OrderStates({
    this.index = 0,
    this.screenState = ScreenState.initialized,
    this.error = '',
    this.errorAccept = '',
    this.errorUpdate = '',
    this.orderList = const [],
    this.isLoading = false,
    this.isLoadingAccept = false,
    this.isLoadingUpdate = false,
    this.isSuccessAccept = false,
    this.isSuccessUpdate = false,
    this.orderDetailsModel,
    this.trackingUrl = '',
  });

  OrderStates copyWith({
    int? index,
    ScreenState? screenState,
    String? error,
    String? errorAccept,
    String? errorUpdate,
    List<OrderModel>? orderList,
    bool? isLoading,
    bool? isLoadingAccept,
    bool? isLoadingUpdate,
    bool? isSuccess,
    OrderDetailsModel? orderDetailsModel,
    bool? isSuccessAccept,
    bool? isSuccessUpdate,
    String? trackingUrl,
  }) {
    return OrderStates(
      index: index ?? this.index,
      screenState: screenState ?? this.screenState,
      error: error ?? '',
      errorAccept: errorAccept ?? '',
      errorUpdate: errorUpdate ?? '',
      orderList: orderList ?? this.orderList,
      isLoading: isLoading ?? false,
      isLoadingAccept: isLoadingAccept ?? false,
      isLoadingUpdate: isLoadingUpdate ?? false,
      isSuccessAccept: isSuccessAccept ?? false,
      isSuccessUpdate: isSuccessUpdate ?? false,
      orderDetailsModel: orderDetailsModel ?? this.orderDetailsModel,
      trackingUrl: trackingUrl ?? this.trackingUrl,
    );
  }

  @override
  List<Object?> get props => [
        identityHashCode(this),
        index,
        screenState,
        error,
        errorAccept,
        errorUpdate,
        orderList,
        isLoading,
        isLoadingAccept,
        isLoadingUpdate,
        isSuccessAccept,
        isSuccessUpdate,
        orderDetailsModel,
        trackingUrl,
      ];
}
