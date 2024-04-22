import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmy_driver/cubit/privacy_bloc/privacy_state.dart';

import '../../data/repository/privacy_repo.dart';
import '../../models/privacy_model.dart';


class PrivacyBloc extends Cubit< PrivacyState> {
  PrivacyModel? privacyModel;

  PrivacyBloc() : super(PrivacyInit()) ;
  getPrivacy()async{
    emit(PrivacyLoading());
    var response = await PrivacyRepo.getPrivacy();
    response.fold((l) {
      emit(PrivacyError(l));
    }, (r) {
      privacyModel = r;
      emit(PrivacySuccess());
    });
  }
}
