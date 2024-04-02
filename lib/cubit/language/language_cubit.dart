import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmy_driver/cubit/language/language_states.dart';

import 'package:pharmy_driver/data/data_resource/local_resource/data_store.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(InitialLanguageState());

  static LanguageCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  String lang = DataStore.instance.lang;
  void setLang(String newLang) {
    DataStore.instance.setLang(newLang);
    lang = newLang;
    emit(NewLanguage(newLang));
  }

  void updateLang(String newLang) {
    lang = newLang;
    emit(UpdateDialogState(newLang));
  }
}
