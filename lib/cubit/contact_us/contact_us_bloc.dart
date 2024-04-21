
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/contact_us_repo.dart';
part 'contact_us_state.dart';

class ContactUsBloc extends Cubit< ContactUsState> {
  ContactUsBloc()
      : super(const ContactUsState(
          isLoading: false,
          isSuccess: false,
          isError: '',
        ));
  SentInfo(email,notes)async{
    emit(state.copyWith(isLoading: true));
    var response = await ContactUsRepo.contactUs(
      email: email,
      notes: notes,
    );

    response.fold(
          (l) => emit(
        state.copyWith(isError: l),
      ),
          (r) => emit(
        state.copyWith(isSuccess: true, ),
      ),
    );
  }


  }

