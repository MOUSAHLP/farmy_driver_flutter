abstract class OrdersHistoryState {}

class InitialState extends OrdersHistoryState {}

class LoadingState extends OrdersHistoryState {}

class SuccessState extends OrdersHistoryState {}

class UpdatingState extends OrdersHistoryState {}

class UpdatedState extends OrdersHistoryState {}

class ErrorState extends OrdersHistoryState {
  String error;
  ErrorState(this.error);
}
