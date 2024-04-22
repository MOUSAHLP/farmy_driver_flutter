import 'package:equatable/equatable.dart';
import 'package:pharmy_driver/core/app_enum.dart';
import '../../models/order_model.dart';

class HomeStates extends Equatable {
 final int index;
 final ScreenState screenState;
 final String error;
 final String errorAccept;
 final bool isLoading;
 final bool isLoadingAccept;
 final bool isSuccessAccept;
final List<OrderModel> orderList;

const HomeStates({
   this.index=0,
  this.screenState=ScreenState.initialized,
  this.error='',
  this.errorAccept='',
  this.orderList=const [],
  this.isLoading=false,
  this.isLoadingAccept=false,
  this.isSuccessAccept=false,
  });

 HomeStates copyWith({
   int? index,
   ScreenState? screenState,
   String? error,
   String? errorAccept,
   List<OrderModel>? orderList,
   bool? isLoading,
   bool? isLoadingAccept,
   bool? isSuccess,
  }) {
    return HomeStates(
       index: index??this.index,
    screenState: screenState??this.screenState,
      error: error??'',
      errorAccept: errorAccept??'',
      orderList: orderList??this.orderList,
      isLoading: isLoading??false,
      isLoadingAccept: isLoadingAccept??false,
      isSuccessAccept: isSuccess??false,
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
    isSuccessAccept
  ];
}
