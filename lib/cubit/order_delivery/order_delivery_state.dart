import 'package:equatable/equatable.dart';
import 'package:pharmy_driver/core/app_enum.dart';
import 'package:pharmy_driver/models/deliver_order_model.dart';

class OrderDeliveryState extends Equatable {
  final ScreenState screenState;
  bool? isDelivery;
  DeliverOrder? deliverOrder;

  OrderDeliveryState({
    this.isDelivery,
    this.screenState = ScreenState.initialized,
    this.deliverOrder,
  });

  OrderDeliveryState copyWith({
    bool? isDelivery,
    ScreenState? screenState,
    DeliverOrder? deliverOrder,
  }) {
    return OrderDeliveryState(
      isDelivery: isDelivery ?? this.isDelivery,
      screenState: screenState ?? this.screenState,
      deliverOrder: deliverOrder ?? this.deliverOrder,
    );
  }

  @override
  List<Object?> get props => [
        identityHashCode(this),
        isDelivery,
        screenState,
        deliverOrder,
      ];
}
