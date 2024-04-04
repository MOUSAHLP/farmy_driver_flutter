import 'package:bloc/bloc.dart';
import '../../data/repository/conditions_repo.dart';
import '../../models/condition_model.dart';
import 'conditions_state.dart';


class ConditionsBloc extends Cubit< ConditionsState> {
  ConditionModel? conditionModel;

  ConditionsBloc() : super(ConditionsInit()) ;
  GetConditions()async{
    emit(ConditionsLoading());
    var response = await ConditionsRepo.getConditions();
    response.fold((l) {
      emit(ConditionsError(l));
    }, (r) {
      conditionModel = r;
      emit(ConditionsSuccess());
    });
  }

}
