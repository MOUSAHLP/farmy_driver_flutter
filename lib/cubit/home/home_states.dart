import 'package:equatable/equatable.dart';
import 'package:pharmy_driver/core/app_enum.dart';

import '../../models/home_model.dart';
import '../../models/order_model.dart';

class HomeStates extends Equatable {
 final int index;
 final ScreenState screenState;
 final String error;
 final String errorAccept;
 final String errorAssign;
 final bool isLoading;
 final bool isLoadingAccept;
 final bool isLoadingAssign;
 final bool isSuccessAccept;
 final bool isSuccessHome;
 final bool isSuccessAssign;
final List<OrderModel> orderList;
 final HomeModel? homeModel;
 final int time;

const HomeStates({
   this.index=0,
   this.time=5,
  this.screenState=ScreenState.initialized,
  this.error='',
  this.errorAccept='',
  this.errorAssign='',
  this.orderList=const [],
  this.isLoading=false,
  this.isLoadingAccept=false,
  this.isLoadingAssign=false,
  this.isSuccessAccept=false,
  this.isSuccessHome=false,
  this.isSuccessAssign=false,
  this.homeModel
  });

 HomeStates copyWith({
   int? index,
   int? time,
   ScreenState? screenState,
   String? error,
   String? errorAccept,
   String? errorAssign,

   List<OrderModel>? orderList,
   bool? isLoading,
   bool? isLoadingAccept,
   bool? isLoadingAssign,
   bool? isSuccessHome,
   bool? isSuccess,
   bool? isSuccessAssign,
   HomeModel? homeModel
  }) {
    return HomeStates(
       index: index??this.index,
        time: time??this.time,
    screenState: screenState??this.screenState,
      error: error??'',
      errorAccept: errorAccept??'',
        errorAssign: errorAssign??'',
      orderList: orderList??this.orderList,
      isLoading: isLoading??false,
      isLoadingAccept: isLoadingAccept??false,
        isLoadingAssign: isLoadingAssign??false,
        isSuccessAssign: isSuccessAssign??false,
      isSuccessAccept: isSuccess??false,
        isSuccessHome: isSuccessHome??false,
      homeModel: homeModel??this.homeModel
    );
  }

  @override
  List<Object?> get props => [
    identityHashCode(this),
    index,
    time,
    screenState,
    error,
    errorAccept,
    errorAssign,
    orderList,
    isLoading,
    isLoadingAccept,
    isLoadingAssign,
    isSuccessAccept,
    isSuccessHome,
    isSuccessAssign,
    homeModel
  ];
}
