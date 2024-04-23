import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/presentation/screens/contact_us/widgets/custom_contact_continer.dart';

import '../../../core/app_validators.dart';
import '../../../core/launcher.dart';
import '../../../core/services/services_locator.dart';
import '../../../cubit/contact_us/contact_us_bloc.dart';
import '../../../cubit/setting/setting_bloc.dart';
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

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: true,
      create: (BuildContext context) => sl<ContactUsBloc>(),
      child: BlocConsumer<ContactUsBloc, ContactUsState>(

        builder: (context, state) => SafeArea(
          child: Scaffold(
            body: Form(
              key: _formKey,
              child: Column(
                children: [
                  ScreenTitleWidget(title:  AppLocalizations.of(context)!.contact_us,isBack:true),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 29.w,
                            ),
                            child: Text(
                              AppLocalizations.of(context)!
                                  .leave_message_to_contact,
                              style: getUnderBoldStyle(
                                color: ColorManager.grayForMessage,
                                fontSize: FontSizeApp.s15.sp,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 10.h,
                            ),
                            child: InputFieldAuth(
                              controller: emailController,
                              textAlign: TextAlign.start,
                              angelRadios: Radius.circular(
                                6.r,
                              ),
                              color: const Color.fromRGBO(228, 228, 228, 1),
                              textStyle: getUnderBoldStyle(
                                  color: ColorManager.grayForSearchProduct,
                                  fontSize: FontSizeApp.s14)!,
                              width: 1.sw,
                              height: 44.h,
                              hintText:
                              AppLocalizations.of(context)!.email_with_at,
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: ColorManager.grayForSearchProduct,
                                fontSize: FontSizeApp.s14.sp,
                              ),
                              suffixIcon: const Text(" "),
                              validator: (value) {
                                return AppValidators.validateEmailFields(
                                    context, value);
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                            ),
                            child: InputFieldAuth(
                              controller: notesController,
                              maxLines: 5,
                              minLines: 5,
                              height: .30.sw,
                              width: 1.sw,
                              color: ColorManager.lightGray,
                              hintText: AppLocalizations.of(context)!
                                  .write_message_notes_question_here,
                              hintStyle: getRegularStyle(
                                color: ColorManager.grayForMessage,
                              ),
                              validator: (value) {
                                return AppValidators.validateNameFields(
                                    context, value);
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 139.w,
                              vertical: 14.h,
                            ),
                            child: CustomButton(
                              onTap: () {
                                if (_formKey.currentState!.validate()){
                                  context.read<ContactUsBloc>()
                                      .  sentInfo(
                                    emailController.text,
                                    notesController.text,

                                  );
                                }

                              },
                              label: AppLocalizations.of(context)!.sent,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 32.w,
                            ),
                            child: Text(
                              AppLocalizations.of(context)!
                                  .you_can_connect_directly,
                              style: getBoldStyle(
                                color: ColorManager.grayForMessage,
                                fontSize: FontSizeApp.s15.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            AppLocalizations.of(context)!.on_the_next_number,
                            style: getBoldStyle(
                              color: ColorManager.grayForMessage,
                              fontSize: FontSizeApp.s15.sp,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 12.h,
                            ),
                            child: InkWell(
                              onTap: () {
                                launchPhoneCall(context.read<SettingBloc>().settingModel?.data?.phone??"");
                              },
                              child: const CustomContactContainer(
                                contactImage: ImageManager.contactLogo,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 10.h,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        listener: (context, state) {
          if(state.isLoading){
            LoadingDialog().openDialog(context);
          } else {
            LoadingDialog().closeDialog(context);
          }
          if(state.isError!=""){
            ErrorDialog.openDialog(context, state.isError);
          }
          if (state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 1),
                content: Container(
                  alignment: Alignment.center,
                  child: Text(
                   "تم الارسال بنجاح",
                    style: getRegularStyle(
                      color: ColorManager.white,
                      fontSize: FontSizeApp.s14,
                    ),
                  ),
                ),
                backgroundColor: ColorManager.primaryGreen,
              ),
            );
          }
        },
      ),
    );
  }
}
// class ContactUsScreen extends StatelessWidget {
//   const ContactUsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             ScreenTitleWidget(title:  AppLocalizations.of(context)!.contact_us,isBack:true),
//             // CustomAppBarScreen(
//             //     sectionName: AppLocalizations.of(context)!.contact_us),
//             Expanded(
//               child: SingleChildScrollView(
//                   child: Column(
//                 children: [
//                   const SizedBox(height: 10,),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 29),
//                     child: Text(
//                       AppLocalizations.of(context)!.leave_message_to_contact,
//                       style: getUnderBoldStyle(
//                           color: ColorManager.grayForMessage,
//                           fontSize: FontSizeApp.s15),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 20, vertical: 10),
//                     child: InputFieldAuth(
//                       textAlign: TextAlign.start,
//                       angelRadios: const Radius.circular(6),
//                       color: const Color.fromRGBO(228, 228, 228, 1),
//                       textStyle: getUnderBoldStyle(
//                           color: ColorManager.grayForSearchProduct,
//                           fontSize: FontSizeApp.s14)!,
//                       width: 1.sw,
//                       height: 44,
//                       hintText: AppLocalizations.of(context)!.email_with_at,
//                       hintStyle: const TextStyle(
//                           fontWeight: FontWeight.w700,
//                           color: ColorManager.grayForSearchProduct,
//                           fontSize: FontSizeApp.s14),
//                       suffixIcon: const Text(" "),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: InputFieldAuth(
//                       maxLines: 5,
//                       minLines: 5,
//                       height: .30.sw,
//                       width: 1.sw,
//                       color: ColorManager.lightGray,
//                       hintText: AppLocalizations.of(context)!
//                           .write_message_notes_question_here,
//                       hintStyle:
//                           getRegularStyle(color: ColorManager.grayForMessage),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 139, vertical: 14),
//                     child: CustomButton(
//                       onTap: () {},
//                       label: AppLocalizations.of(context)!.sent,
//                     ),
//                   ),
//
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 32),
//                     child: Text(
//                       AppLocalizations.of(context)!.you_can_connect_directly,
//                       style: getBoldStyle(
//                           color: ColorManager.grayForMessage,
//                           fontSize: FontSizeApp.s15),
//
//                     textAlign: TextAlign.center),
//                   ),
//                   Text(
//                     AppLocalizations.of(context)!.on_the_next_number,
//                     style: getBoldStyle(
//                         color: ColorManager.grayForMessage,
//                         fontSize: FontSizeApp.s15),
//                   ),
//                    Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                     child: InkWell(
//                       onTap: (){
//                         launchPhoneCall("0962225868");
//                       },
//                       child: const CustomContactContainer(
//                         contactImage: ImageManager.contactLogo,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     AppLocalizations.of(context)!.or_via_whatsup,
//                     style: getBoldStyle(
//                         color: ColorManager.grayForMessage,
//                         fontSize: FontSizeApp.s15),
//                   ),
//                    Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 20),
//                     child: InkWell(
//                       onTap: (){
//                         openWhatsApp("0962225868", context);
//                       },
//                       child: const CustomContactContainer(
//                         contactImage: ImageManager.whatsUpLogo,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10,)
//                 ],
//               )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
