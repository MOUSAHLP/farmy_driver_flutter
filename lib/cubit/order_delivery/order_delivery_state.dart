import 'package:equatable/equatable.dart';
import 'package:pharmy_driver/core/app_enum.dart';
import 'package:pharmy_driver/models/deliver_order_model.dart';

class OrderDeliveryState extends Equatable {
  final ScreenState screenState;
  bool? isDelivery;
  bool wasMadePaid;
  DeliverOrder? deliverOrder;
  String error;

  OrderDeliveryState(
      {this.isDelivery,
      this.wasMadePaid = false,
      this.screenState = ScreenState.initialized,
      this.deliverOrder,
      this.error = ''});

  OrderDeliveryState copyWith(
      {bool? isDelivery,
      bool? wasMadePaid,
      ScreenState? screenState,
      DeliverOrder? deliverOrder,
      String? error}) {
    return OrderDeliveryState(
        isDelivery: isDelivery ?? this.isDelivery,
        wasMadePaid: wasMadePaid ?? this.wasMadePaid,
        screenState: screenState ?? this.screenState,
        deliverOrder: deliverOrder ?? this.deliverOrder,
        error: error ?? "");
  }

  @override
  List<Object?> get props => [
        identityHashCode(this),
        isDelivery,
        wasMadePaid,
        screenState,
        deliverOrder,
        error
      ];
}
