import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmy_driver/cubit/profile/profile_state.dart';
import '../../core/services/services_locator.dart';
import '../../data/data_resource/local_resource/data_store.dart';
import '../../data/repository/user_repository.dart';
import '../../models/login_response.dart';
import '../../models/profile_model.dart';
import '../authentication_bloc/authertication_bloc.dart';

class ProfileBloc extends Cubit< ProfileState> {
  ProfileModel profileModel = ProfileModel();
  TextEditingController fNameController =
      TextEditingController(text: DataStore.instance.userInfo?.firstName);
  TextEditingController lNameController =
      TextEditingController(text: DataStore.instance.userInfo?.lastName);
  TextEditingController phoneController =
      TextEditingController(text: DataStore.instance.userInfo?.phone);
  TextEditingController emailController =
      TextEditingController(text: DataStore.instance.userInfo?.email);

  DateTime? birthday=DataStore.instance.userInfo?.birthday;
  File? imagePick;

  ProfileBloc() : super(ProfileInit());
  updateProfile()async{
    emit(ProfileLoading());
    profileModel.fName = fNameController.text;
    profileModel.lName = lNameController.text;
    profileModel.email = emailController.text;
    profileModel.phone = phoneController.text;
    profileModel.birthday = birthday;

    var response = await UserRepository.editProfile(profileModel);
    response.fold((l) {
      emit(ProfileError(l));
    }, (r) {
      LoginResponse result = LoginResponse(
          id: r.id ,
          firstName: r.firstName,
          phone: r.phone,
          email: r.email,
          lastName: r.lastName,
          birthday:r. birthday
      );
      DataStore.instance.userInfo?.birthday=r.birthday;
      sl<AuthenticationBloc>().loginResponse = result;
      DataStore.instance.setUserInfo(result);
      emit(ProfileSuccessUpdate());
    });
  }
  editBirthDay( DateTime birthDay){
    birthday =birthDay;
    emit(EditBirthDayState());
  }

}
