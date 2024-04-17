abstract class OrdersHistoryState {}

class InitialState extends OrdersHistoryState {}

class LoadingState extends OrdersHistoryState {}
class LoadingPdfState extends OrdersHistoryState {}

class SuccessState extends OrdersHistoryState {}
class SuccessPdfState extends OrdersHistoryState {
  String pdfUrl;
  SuccessPdfState(this.pdfUrl);
}

class UpdatingState extends OrdersHistoryState {}

class UpdatedState extends OrdersHistoryState {}

class ErrorState extends OrdersHistoryState {
  String error;
  ErrorState(this.error);
}
class ErrorPdfState extends OrdersHistoryState {
  String error;
  ErrorPdfState(this.error);
}
