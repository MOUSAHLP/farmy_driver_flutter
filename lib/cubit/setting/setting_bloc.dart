import 'package:bloc/bloc.dart';

import 'package:pharmy_driver/cubit/setting/setting_state.dart';

import '../../data/repository/setting_repo.dart';
import '../../models/setting_model.dart';

class SettingBloc extends Cubit<SettingState> {
    SettingModel? settingModel;

  SettingBloc() : super(SettingInit()) ;

  getSetting()async{
    {
      emit(SettingLoading());
      var response = await SettingRepo.getSetting();
      response.fold(
            (l) {
          emit(SettingError(l));
        },
            (r) {
          settingModel = r;
          emit(SettingSuccess());
        },
      );
    }
  }

}
