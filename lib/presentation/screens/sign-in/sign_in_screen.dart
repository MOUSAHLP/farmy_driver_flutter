import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmy_driver/presentation/screens/sign-in/widgets/background_auth.dart';
import 'package:pharmy_driver/presentation/screens/sign-in/widgets/button_auth.dart';
import 'package:pharmy_driver/presentation/screens/sign-in/widgets/password_input_field_auth.dart';
import '../../../core/app_router/app_router.dart';
import '../../../core/app_validators.dart';
import '../../../core/services/services_locator.dart';
import '../../../cubit/authentication_bloc/authentication_state.dart';
import '../../../cubit/authentication_bloc/authertication_bloc.dart';
import '../../../models/params/login_params.dart';
import '../../../translations.dart';
import '../../app_widgets/dialog/error_dialog.dart';
import '../../app_widgets/dialog/loading_dialog.dart';
import '../../app_widgets/dialog/will_pop_scope_handler.dart';
import '../../app_widgets/input_field_auth.dart';
import '../../resources/assets_manager.dart';
import '../../resources/style_app.dart';

import '../main_screen/screen/main_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => WillPopScopeHandler.handle(context),
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state.isLoading) {
              LoadingDialog().openDialog(context);
            } else {
              LoadingDialog().closeDialog(context);
            }
            if (state.error != null) {
              ErrorDialog.openDialog(context, state.error);
            }
            if (state.login) {
              AppRouter.pushReplacement(context, const MainScreen());
            }
          },
          child: SignInBody()),
    );
  }
}

class SignInBody extends StatelessWidget {
  SignInBody({super.key});

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BackGroundAuth(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 93,
            ),
            Text(AppLocalizations.of(context)!.sign_in,
                style: getBoldStyle(color: Colors.white, fontSize: 29)),
            const SizedBox(
              height: 58,
            ),
            InputFieldAuth(
              icon: Image.asset(
                ImageManager.flagOfSyria,
                height: 20,
                width: 20,
              ),
              keyboardType: TextInputType.phone,
              isPhone: true,
              controller: phoneController,
              hintText: AppLocalizations.of(context)!.hint_phone,
              validator: (value) {
                return AppValidators.validatePhoneFields(
                    context, phoneController.text);
              },
            ),
            const SizedBox(
              height: 24,
            ),
            PasswordInputFieldAuth(
              controller: passwordController,
              hintText: AppLocalizations.of(context)!.password,
              // validator: (value) {
              //   return AppValidators.validatePasswordFields(
              //       context, passwordController.text);
              // },
            ),
            const SizedBox(
              height: 31,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context)!.forget_password,
                    style: getSemiBoldStyle(color: Colors.white)),
                SizedBox(width: 4,),
                InkWell(
                  onTap: () {
                    // context
                    //     .read<AuthenticationBloc>()
                    //     .add(TapOnPressed(ScreensAuth.phoneNumberScreen));
                  },
                  child: Text(AppLocalizations.of(context)!.reset_password,
                      style: getSemiBoldStyle(color: Colors.yellow)),
                ),
              ],
            ),
            const SizedBox(height: 64),
            ButtonAuth(
                label: AppLocalizations.of(context)!.sign_in,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    sl<AuthenticationBloc>().logIn(
                       LoginParams(
                          phone: phoneController.text,
                          password: passwordController.text,
                        ),
                    );
                  }
                  // AppRouter.push(context, const MainScreen(),);
                }),
            const SizedBox(height: 13),

          ],
        ),
      ),
    );
  }
}
