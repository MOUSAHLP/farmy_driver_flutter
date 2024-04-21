part of 'contact_us_bloc.dart';

class ContactUsState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final String isError;

  const ContactUsState({
     this.isLoading=false,
     this.isSuccess=false,
     this.isError="",
  });

  ContactUsState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? isError,
  }) {
    return ContactUsState(
      isLoading: isLoading ?? false,
      isSuccess: isSuccess ?? false,
      isError: isError ??"",
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        isSuccess,
        isError,
      ];
}
