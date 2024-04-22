import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pharmy_driver/models/params/login_params.dart';
import '../../core/app_enum.dart';
import '../../data/data_resource/local_resource/data_store.dart';

import '../../data/repository/user_repository.dart';
import '../../models/login_response.dart';
import '../../models/params/delete_account_params.dart';
import '../../models/reset_password_params.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Cubit< AuthenticationState> {
   UserRepository userRepository;
  LoginResponse? loginResponse;

  AuthenticationBloc(this.userRepository) : super(AuthenticationState());

  appStarted()async{
    final PackageInfo info = await PackageInfo.fromPlatform();
    DataStore.instance.setVersion(info.version);
    final bool hasToken = await userRepository.hasToken();
    await Future.delayed(const Duration(seconds: 4)).then((value) {
      /// he logged in -> go to home page
      if (hasToken) {

        loginResponse = DataStore.instance.userInfo;
        emit(state.copyWith(
            authenticationScreenStates:
            AuthenticationScreenStates.authenticationAuthenticated));
      }

      /// he did not login -> go {as guest or see if he logged out or start from start}
      else {


        /// want to enter { from on boarding or to login if he already logged out }

          emit(state.copyWith(
              authenticationScreenStates:

              AuthenticationScreenStates.authenticationUnauthenticated));

      }
    });

  }
  loggedOut()async{
    emit(state.copyWith(authenticationScreenStates: AuthenticationScreenStates.authenticationInitialized));
    await userRepository.logout().then((value) {
      userRepository.deleteToken();
      DataStore.instance.deleteUserInfo();
      emit(state.copyWith(authenticationScreenStates: AuthenticationScreenStates.authenticationLoggedOut));
    });
  }
  logIn(LoginParams loginParams)async{
    emit(state.copyWith(isLoading: true));
    final response = await userRepository.logIn(
      loginParams: loginParams,
    );
    response.fold((l) {
      emit(state.copyWith(error: l, signUp: true));
    }, (r) async {

      loginResponse = r;
      DataStore.instance.setUserInfo(loginResponse!);
      DataStore.instance.setToken(loginResponse!.token ?? "");

      // FirebaseNotificationsHandler().refreshFcmToken().then((value) async {
      //   userRepository.saveFCMToken(value);
      //
      // });
      emit(state.copyWith(
          authenticationScreenStates:
          AuthenticationScreenStates.authenticationAuthenticated,
          login: true));
    });
  }
   deleteAccount(DeleteAccountParams deleteAccountParams)async{
     emit(state.copyWith(isLoading: true));
     final response =
     await userRepository.deleteAccount(deleteAccountParams);
     response.fold((l) {
       emit(state.copyWith(error: l));
     }, (r) {
       userRepository.deleteToken();
       DataStore.instance.deleteUserInfo();
       emit(state.copyWith(
           authenticationScreenStates:
           AuthenticationScreenStates.authenticationLoggedOut,
           isDeleteAccount: true));
     });
   }
   resetPassword(ResetPasswordParams resetPasswordParams)async{
     emit(state.copyWith(isLoading: true));

     ResetPasswordParams forgetPasswordParams = ResetPasswordParams(

         password: resetPasswordParams.password,
         repeatPassword: resetPasswordParams.repeatPassword,
         oldPassword: resetPasswordParams.oldPassword);
     var response = await userRepository.resetPassword(forgetPasswordParams);
     response.fold((l) {
       emit(state.copyWith(error: l));
     }, (r) {
       userRepository.deleteToken();
       DataStore.instance.deleteUserInfo();
       emit(state.copyWith(resetPassword: true,authenticationScreenStates: AuthenticationScreenStates.authenticationLoggedOut));
     });
   }


}
