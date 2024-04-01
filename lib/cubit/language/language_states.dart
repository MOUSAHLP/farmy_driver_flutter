abstract class LanguageState {}

class InitialLanguageState extends LanguageState {}

class UpdateDialogState extends LanguageState {
  String language = "ar";
  UpdateDialogState(this.language);
}

class NewLanguage extends LanguageState {
  String language = "ar";
  NewLanguage(this.language);
}
