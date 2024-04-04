abstract class AboutState {}

class AboutInit extends AboutState {}

class AboutSuccess extends AboutState {}

class AboutLoading extends AboutState {}

class AboutError extends AboutState {
  String error;
  AboutError(this.error);
}
