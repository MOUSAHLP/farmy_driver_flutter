import 'package:bloc/bloc.dart';

import '../../data/repository/faq_repo.dart';
import '../../models/faq_model.dart';
import 'faq_state.dart';

class FaqBloc extends Cubit< FAQState> {
  FAQModel? faqModel;

  FaqBloc() : super(FAQInit());
  getFAQ()async{
    emit(FAQLoading());
    var response = await FAQRepo.getFAQ();
    response.fold((l) {
      emit(FAQError(l));
    }, (r) {
      faqModel = r;
      emit(FAQSuccess());
    });

  }
}
