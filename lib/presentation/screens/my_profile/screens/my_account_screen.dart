import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/presentation/app_widgets/base_scaffold.dart';
import 'package:pharmy_driver/presentation/app_widgets/custom_button.dart';
import 'package:pharmy_driver/presentation/app_widgets/input_field_auth.dart';
import 'package:pharmy_driver/presentation/resources/assets_manager.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';
import 'package:pharmy_driver/translations.dart';

import '../../../../core/app_validators.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../cubit/profile/pofile_bloc.dart';
import '../../../../cubit/profile/profile_state.dart';
import '../../../app_widgets/custom_error_screen.dart';
import '../widgets/shimmer_profile.dart';
class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (BuildContext context) => sl<ProfileBloc>(),
      child: const MyAccountBody(),
    );
  }
}
class MyAccountBody extends StatelessWidget {
  const MyAccountBody({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseScaffold(
        title:AppLocalizations.of(context)!.personal_Details ,
        child: Expanded(
          child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return const BuildShimmerProfile();
                } else if (state is ProfileError) {
                  return CustomErrorScreen(
                    onTap: () {
                      context.read<ProfileBloc>().updateProfile();
                    },
                    titleError: state.error,
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: InputFieldAuth(
                                    controller: context
                                        .read<ProfileBloc>()
                                        .fNameController,
                                    color: ColorManager.grayForm,
                                    width: 1.sw,
                                    hintText:
                                    AppLocalizations.of(context)!.fName,
                                    validator: (value) {
                                      return AppValidators
                                          .validateFirstNameFields(
                                          context, value);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 13,
                                ),
                                Expanded(
                                  child: InputFieldAuth(
                                    controller: context
                                        .read<ProfileBloc>()
                                        .lNameController,
                                    color: ColorManager.grayForm,
                                    width: 1.sw,
                                    hintText:
                                    AppLocalizations.of(context)!.lName,
                                    validator: (value) {
                                      return AppValidators
                                          .validateLastNameFields(
                                          context, value);
                                    },
                                    // readOnly:
                                    //     !context.read<ProfileBloc>().isEditing,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.birthday,
                                  style: getBoldStyle(
                                      color: ColorManager.grayForMessage,
                                      fontSize: 14),
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
                            BlocBuilder<ProfileBloc, ProfileState>(
                              builder: (context, state) => InkWell(
                                onTap: () async {
                                  DateTime? selectedTime = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime(
                                        DateTime.now().year,
                                        1,
                                        1,
                                      ),
                                      firstDate: DateTime.now().subtract(
                                          const Duration(days: 365000)),
                                      lastDate: DateTime.now(),
                                      builder: (context, child) {
                                        return Theme(
                                            data: Theme.of(context).copyWith(
                                                colorScheme:
                                                const ColorScheme.light(
                                                  primary:
                                                  ColorManager.primaryGreen,
                                                  onPrimary: Colors.white,
                                                  onSurface: Colors.black,
                                                )),
                                            child: child!);
                                      });
                                  if (selectedTime != null) {
                                    context.read<ProfileBloc>().
                                        editBirthDay( selectedTime);
                                  }
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: ColorManager.grayForm,
                                              borderRadius:
                                              BorderRadius.circular(12)),
                                          child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    vertical: 18.0),
                                                child: context
                                                    .read<ProfileBloc>()
                                                    .birthday !=
                                                    null
                                                    ? Text(
                                                  context
                                                      .read<ProfileBloc>()
                                                      .birthday!
                                                      .day
                                                      .toString(),
                                                  style: getRegularStyle(
                                                      color: ColorManager
                                                          .primaryGreen),
                                                )
                                                    : Text(
                                                    AppLocalizations.of(
                                                        context)!
                                                        .today,
                                                    style: getUnderBoldStyle(
                                                        color: ColorManager
                                                            .grayForMessage)),
                                              ))),
                                    ),
                                    const SizedBox(
                                      width: 13,
                                    ),
                                    Expanded(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: ColorManager.grayForm,
                                              borderRadius:
                                              BorderRadius.circular(12)),
                                          child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    vertical: 18.0),
                                                child: context
                                                    .read<ProfileBloc>()
                                                    .birthday !=
                                                    null
                                                    ? Text(
                                                  context
                                                      .read<ProfileBloc>()
                                                      .birthday!
                                                      .month
                                                      .toString(),
                                                  style: getRegularStyle(
                                                      color: ColorManager
                                                          .primaryGreen),
                                                )
                                                    : Text(
                                                    AppLocalizations.of(
                                                        context)!
                                                        .month,
                                                    style: getUnderBoldStyle(
                                                        color: ColorManager
                                                            .grayForMessage)),
                                              ))),
                                    ),
                                    const SizedBox(
                                      width: 13,
                                    ),
                                    Expanded(
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: ColorManager.grayForm,
                                              borderRadius:
                                              BorderRadius.circular(12)),
                                          child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    vertical: 18.0),
                                                child: context
                                                    .read<ProfileBloc>()
                                                    .birthday !=
                                                    null
                                                    ? Text(
                                                  context
                                                      .read<ProfileBloc>()
                                                      .birthday!
                                                      .year
                                                      .toString(),
                                                  style: getRegularStyle(
                                                      color: ColorManager
                                                          .primaryGreen),
                                                )
                                                    : Text(
                                                    AppLocalizations.of(
                                                        context)!
                                                        .year,
                                                    style: getUnderBoldStyle(
                                                        color: ColorManager
                                                            .grayForMessage)),
                                              ))),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.phone,
                                  style: getBoldStyle(
                                      color: ColorManager.grayForMessage,
                                      fontSize: 14),
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
                            InputFieldAuth(
                                readOnly: true,
                                controller:
                                context.read<ProfileBloc>().phoneController,
                                color: ColorManager.grayForm,
                                width: 1.sw,
                                hintText: AppLocalizations.of(context)!.phone,
                                isPhone: true,
                                icon: Image.asset(
                                  ImageManager.flagOfSyria,
                                  height: 20,
                                  width: 20,
                                )),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.email_option,
                                  style: getBoldStyle(
                                      color: ColorManager.grayForMessage,
                                      fontSize: 14),
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
//email_option
                            InputFieldAuth(
                              controller:
                              context.read<ProfileBloc>().emailController,
                              color: ColorManager.grayForm,
                              width: 1.sw,
                              hintText:
                              AppLocalizations.of(context)!.email_with_at,
                              // readOnly: !context.read<ProfileBloc>().isEditing,
                            ),
                            const SizedBox(height: 50),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 70, vertical: 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [

                                  CustomButton(
                                    label: AppLocalizations.of(context)!
                                        .save_Changes,
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        context
                                            .read<ProfileBloc>()
                                            .updateProfile();
                                      }
                                    },
                                    fillColor: Colors.white,
                                    borderColor: ColorManager.primaryGreen,
                                    labelColor: ColorManager.primaryGreen,
                                    isFilled: true,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}