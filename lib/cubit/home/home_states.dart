// abstract class HomeStates{}
// class InitialHomeState extends HomeStates{}


import 'package:equatable/equatable.dart';
import 'package:pharmy_driver/core/app_enum.dart';

import '../../models/order_model.dart';

class HomeStates extends Equatable {
 final int index;
 final ScreenState screenState;
 final String error;
final List<OrderModel> orderList;
const HomeStates({
   this.index=0,
  this.screenState=ScreenState.initialized,
  this.error='',
  this.orderList=const []
  });

 HomeStates copyWith({
   int? index,
   ScreenState? screenState,
   String? error,
   List<OrderModel>? orderList
  }) {
    return HomeStates(
       index: index??this.index,
    screenState: screenState??this.screenState,
      error: error??'',
      orderList: orderList??this.orderList
    );
  }

  @override
  List<Object?> get props => [
    identityHashCode(this),
    index,
    screenState,
    error,
    orderList
  ];
}
