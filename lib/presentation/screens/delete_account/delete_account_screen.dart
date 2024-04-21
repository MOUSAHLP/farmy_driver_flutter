import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/presentation/screens/sign-in/sign_in_screen.dart';


import '../../../core/app_router/app_router.dart';
import '../../../core/app_validators.dart';
import '../../../cubit/authentication_bloc/authentication_state.dart';
import '../../../cubit/authentication_bloc/authertication_bloc.dart';
import '../../../models/params/delete_account_params.dart';
import '../../../translations.dart';
import '../../app_widgets/custom_button.dart';
import '../../app_widgets/dialog/error_dialog.dart';
import '../../app_widgets/dialog/loading_dialog.dart';
import '../../app_widgets/input_field_auth.dart';
import '../../app_widgets/screen_title.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_app.dart';
import '../../resources/style_app.dart';


class DeleteAccountScreen extends StatelessWidget {
  DeleteAccountScreen({super.key});

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: 1.sh,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                ScreenTitleWidget(
                  title: AppLocalizations.of(context)!.delete_account,
                  isBack: true,
                ),
                BlocConsumer<AuthenticationBloc, AuthenticationState>(
                  listener: (context, state) {
                    if (state.isLoading) {
                      LoadingDialog().openDialog(context);
                    } else {
                      LoadingDialog().closeDialog(context);
                    }
                    if (state.error != null) {
                      ErrorDialog.openDialog(context, state.error);
                    }
                    if(state.isDeleteAccount){
                      AppRouter.pushReplacement(context, SignInScreen());
                    }
                  },
                  builder: (context, state) => Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 19,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Text(
                                AppLocalizations.of(context)!
                                    .sorry_for_delete_account,
                                style: getUnderBoldStyle(
                                    color: ColorManager.grayForMessage,
                                    fontSize: FontSizeApp.s15)),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Text(
                                AppLocalizations.of(context)!
                                    .please_write_your_phone_and_password,
                                style: getBoldStyle(
                                    color: ColorManager.grayForMessage,
                                    fontSize: FontSizeApp.s15)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 19),
                            child: InputFieldAuth(
                              keyboardType: TextInputType.phone,
                                controller: phoneController,
                                angelRadios: const Radius.circular(6),
                                color: const Color.fromRGBO(228, 228, 228, 1),
                                textStyle: getUnderBoldStyle(
                                    color: ColorManager.grayForSearchProduct,
                                    fontSize: FontSizeApp.s14)!,
                                width: 1.sw,
                                hintText:
                                    AppLocalizations.of(context)!.hint_phone,
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: ColorManager.grayForSearchProduct,
                                    fontSize: FontSizeApp.s14),
                                isPhone: true,
                                icon: Image.asset(
                                  ImageManager.flagOfSyria,
                                  height: 20,
                                  width: 20,
                                ),
                                validator: (value) {
                                  return AppValidators.validatePhoneFields(
                                      context, phoneController.text);
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: InputFieldAuth(
                                controller: passwordController,
                                angelRadios: const Radius.circular(6),
                                color: const Color.fromRGBO(228, 228, 228, 1),
                                textStyle: getUnderBoldStyle(
                                    color: ColorManager.grayForSearchProduct,
                                    fontSize: FontSizeApp.s14)!,
                                width: 1.sw,
                                hintText: AppLocalizations.of(context)!
                                    .password_with_star,
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: ColorManager.grayForSearchProduct,
                                    fontSize: FontSizeApp.s14),
                                suffixIcon: const Text(" "),
                                // validator: (value) {
                                //   return AppValidators.validatePasswordFields(
                                //       context, passwordController.text);
                                // }
                                ),
                          ),
                          const SizedBox(
                            height: 99,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 72),
                            child: CustomButton(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthenticationBloc>().
                                        DeleteAccount(

                                              DeleteAccountParams(
                                                  phone: phoneController.text,
                                                  password:
                                                      passwordController.text,
                                                 ),

                                      );
                                }
                                // ConfirmDeleteAccountDialog.openDialog(
                                //     context,
                                //     AppLocalizations.of(context)!
                                //         .your_Account_Has_Been_Successfully_Deleted);
                              },
                              label:
                                  AppLocalizations.of(context)!.confirm_delete,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
