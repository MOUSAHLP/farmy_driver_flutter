abstract class AllOrdersDateState {}

class InitialState extends AllOrdersDateState {}

class LoadingState extends AllOrdersDateState {}

class SuccessState extends AllOrdersDateState {}

class ErrorState extends AllOrdersDateState {
  String error;
  ErrorState(this.error);
}
