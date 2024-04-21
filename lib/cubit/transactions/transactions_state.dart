abstract class TransactionsState {}

class InitialState extends TransactionsState {}

class LoadingState extends TransactionsState {}

class SuccessState extends TransactionsState {}

class ErrorState extends TransactionsState {
  String error;
  ErrorState(this.error);
}
