import 'package:bloc/bloc.dart';

import '../../data/repository/faq_repo.dart';
import '../../models/faq_model.dart';
import 'about_state.dart';

class AboutBloc extends Cubit< AboutState> {
  FAQModel? faqModel;

  AboutBloc() : super(AboutInit());
  GetAbout()async{
    emit(AboutLoading());
    var response = await FAQRepo.getAbout();
    response.fold((l) {
      emit(AboutError(l));
    }, (r) {
      faqModel = r;
      emit(AboutSuccess());
    });

  }
}
