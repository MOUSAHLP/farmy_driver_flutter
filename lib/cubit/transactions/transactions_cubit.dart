import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmy_driver/cubit/transactions/transactions_state.dart';
import 'package:pharmy_driver/data/repository/transactions_repo.dart';
import 'package:pharmy_driver/models/transactions_model.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  TransactionsCubit() : super(InitialState());

  static TransactionsCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  TransactionsModel? transactionsModel;

  Future<void> getDriverTransactions() async {
    emit(LoadingState());

    (await TransactionsRepo.getDriverDriverDues()).fold((l) {
      emit(ErrorState(l));
    }, (r) {
      transactionsModel = r;
      emit(SuccessState());
    });
  }
}
