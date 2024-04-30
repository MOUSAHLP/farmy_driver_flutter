import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmy_driver/data/repository/tracking_repo.dart';

import '../../core/app_enum.dart';
import '../../data/repository/order_repo.dart';
import 'order_states.dart';

class OrderCubit extends Cubit<OrderStates> {
  List<int> approvedProductsIds = [];
  List<int> canceledProductsIds = [];

  OrderCubit() : super(const OrderStates());

  getOrder() async {
    emit(state.copyWith(screenState: ScreenState.loading));
    final response = await OrderRepository.getOrder();
    response.fold((l) {
      emit(state.copyWith(screenState: ScreenState.error, error: l));
    }, (r) {
      emit(state.copyWith(screenState: ScreenState.success, orderList: r));
    });
  }

  getOrderDetails(int id) async {
    emit(state.copyWith(screenState: ScreenState.loading));
    final response = await OrderRepository.getOrderDetails(id);
    response.fold((l) {
      emit(state.copyWith(screenState: ScreenState.error, error: l));
    }, (r) {
      // for(int i=0;i<r.orderDetails!.length;i++) {
      //   approved_products_ids.add(r.orderDetails![i].id);
      // }
      emit(state.copyWith(
          screenState: ScreenState.success, orderDetailsModel: r));
    });
  }

  acceptOrder(int id) async {
    emit(state.copyWith(isLoadingAccept: true));
    final response = await OrderRepository.acceptOrder(id);
    response.fold((l) {
      emit(state.copyWith(errorAccept: l));
    }, (r) {
      emit(state.copyWith(isSuccessAccept: true));
    });
  }

  deleteProduct(int id) {
    // state.orderDetailsModel?.orderDetails
    //     ?.removeWhere((element) => element.id == id);
    canceledProductsIds.add(id);
    approvedProductsIds.removeWhere((element) => element == id);
    emit(state.copyWith(orderDetailsModel: state.orderDetailsModel));
  }

  addProduct(int id) {
    print("approvedProductsIds.any((element) => element==id)");
    print(approvedProductsIds.where((element) => element == id));
    print(approvedProductsIds.any((element) => element == id));
    print(approvedProductsIds);
    print(approvedProductsIds.contains((element) => element == id));
    if (approvedProductsIds.any((element) => element == id)) {
      print("yesss");
    } else {
      approvedProductsIds.add(id);
      canceledProductsIds.removeWhere((element) => element == id);
    }
    emit(state.copyWith(orderDetailsModel: state.orderDetailsModel));
  }

  // updateOrder(int id) async {
  //   emit(state.copyWith(isLoadingUpdate: true));
  //   final response = await OrderRepository.updateOrder(
  //     id,
  //     approvedProductsIds,
  //     canceledProductsIds,
  //   );
  //   response.fold((l) {
  //     emit(state.copyWith(errorUpdate: l));
  //   }, (r) {
  //     emit(state.copyWith(isSuccessUpdate: true));
  //   });
  // }

  moveToTheDeliveryStage(int idOrder) async {
    emit(state.copyWith(
      isLoadingUpdate: true,
    ));
    final response = await TrackingRepo.getTrackingUrl(
      idOrder,
      approvedProductsIds,
      canceledProductsIds,
    );
    response.fold((l) {
      emit(
        state.copyWith(screenState: ScreenState.error, error: l),
      );
    }, (r) {
      emit(
        state.copyWith(
          isSuccessUpdate: true,
          trackingUrl: r.data,
        ),
      );
    });
  }
}
