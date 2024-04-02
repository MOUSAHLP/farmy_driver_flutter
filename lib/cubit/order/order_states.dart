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
 final bool isLoading;
 final bool isLoadingAccept;
 final bool isSuccessAccept;
final List<OrderModel> orderList;
 final OrderDetailsModel? orderDetailsModel;

const OrderStates({
   this.index=0,
  this.screenState=ScreenState.initialized,
  this.error='',
  this.errorAccept='',
  this.orderList=const [],
  this.isLoading=false,
  this.isLoadingAccept=false,
  this.isSuccessAccept=false,
  this.orderDetailsModel
  });

 OrderStates copyWith({
   int? index,
   ScreenState? screenState,
   String? error,
   String? errorAccept,
   List<OrderModel>? orderList,
   bool? isLoading,
   bool? isLoadingAccept,
   bool? isSuccess,
   OrderDetailsModel? orderDetailsModel
  }) {
    return OrderStates(
       index: index??this.index,
    screenState: screenState??this.screenState,
      error: error??'',
      errorAccept: errorAccept??'',
      orderList: orderList??this.orderList,
      isLoading: isLoading??false,
      isLoadingAccept: isLoadingAccept??false,
      isSuccessAccept: isSuccess??false,
      orderDetailsModel: orderDetailsModel??this.orderDetailsModel
    );
  }

  @override
  List<Object?> get props => [
    identityHashCode(this),
    index,
    screenState,
    error,
    errorAccept,
    orderList,
    isLoading,
    isLoadingAccept,
    isSuccessAccept,
    orderDetailsModel
  ];
}
