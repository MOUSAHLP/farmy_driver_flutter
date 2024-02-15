import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/core/app_router/app_router.dart';
import 'package:pharmy_driver/presentation/app_widgets/base_scaffold.dart';
import 'package:pharmy_driver/presentation/app_widgets/custom_button.dart';
import 'package:pharmy_driver/presentation/app_widgets/image_helper_svg.dart';
import 'package:pharmy_driver/presentation/app_widgets/input_field_auth.dart';
import 'package:pharmy_driver/presentation/app_widgets/screen_title.dart';
import 'package:pharmy_driver/presentation/resources/assets_manager.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';
import 'package:pharmy_driver/presentation/resources/values_app.dart';
import 'package:pharmy_driver/translations.dart';
import 'package:sms_autofill/sms_autofill.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseScaffold(
        child: Column(
          children: [
            ScreenTitleWidget(
                title: AppLocalizations.of(context)!.personal_Details),
            const SizedBox(height: 20),
            SizedBox(
              height: 0.62.sh,
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 22.0),
                      child: Text(
                        "مرحبا قمر",
                        style: getBoldStyle(
                            color: ColorManager.primaryGreen, fontSize: 15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: PaddingApp.p41),
                    child: Column(
                      children: [
                        const SizedBox(height: 14),
                        const ImageSvgWidget(url: IconsManager.crownIcon)
                            .buildAssetSvgImage(),
                        const SizedBox(height: 4),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: ColorManager.lightGray,
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Center(
                                  child: const ImageSvgWidget(
                                url: IconsManager.logoApp,
                                width: 50,
                                height: 50,
                                color: ColorFilter.mode(
                                    Color(0xff99B990), BlendMode.srcIn),
                              ).buildAssetSvgImage())),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          AppLocalizations.of(context)!.edit_Picture,
                          style: getBold800Style(
                              color: ColorManager.primaryGreen, fontSize: 12),
                        ),
                        const SizedBox(height: 30),
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            AppLocalizations.of(context)!.personal_Details,
                            style: getBold800Style(
                                color: ColorManager.black, fontSize: 13),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: InputFieldAuth(
                                color: ColorManager.grayForm,
                                width: 1.sw,
                                hintText: AppLocalizations.of(context)!.fName,
                              ),
                            ),
                            const SizedBox(width: 13),
                            Expanded(
                              child: InputFieldAuth(
                                color: ColorManager.grayForm,
                                width: 1.sw,
                                hintText: AppLocalizations.of(context)!.lName,
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
                        Row(
                          children: [
                            Expanded(
                              child: InputFieldAuth(
                                color: ColorManager.grayForm,
                                width: 1.sw,
                                hintText: AppLocalizations.of(context)!.today,
                              ),
                            ),
                            const SizedBox(width: 13),
                            Expanded(
                              child: InputFieldAuth(
                                color: ColorManager.grayForm,
                                width: 1.sw,
                                hintText: AppLocalizations.of(context)!.month,
                              ),
                            ),
                            const SizedBox(width: 13),
                            Expanded(
                              child: InputFieldAuth(
                                color: ColorManager.grayForm,
                                width: 1.sw,
                                hintText: AppLocalizations.of(context)!.year,
                              ),
                            ),
                          ],
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
                            color: ColorManager.grayForm,
                            width: 1.sw,
                            hintText: AppLocalizations.of(context)!.phone,
                            suffixIcon: const CountryCodePicker(
                              padding: EdgeInsets.zero,
                              showCountryOnly: true,
                              flagWidth: 20,
                              enabled: false,
                              initialSelection: 'SY',
                            )),
                        SizedBox(height: 40),
                        CustomButton(
                            label:
                                AppLocalizations.of(context)!.change_Number,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Material(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      color: Colors.transparent,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                AppLocalizations.of(
                                                        context)!
                                                    .change_Number,
                                                style: getBoldStyle(
                                                    color: ColorManager
                                                        .grayForMessage,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 27),
                                            child: InputFieldAuth(
                                                color:
                                                    ColorManager.grayForm,
                                                width: 1.sw,
                                                keyboardType:
                                                    TextInputType.phone,
                                                hintText:
                                                    AppLocalizations.of(
                                                            context)!
                                                        .phone,
                                                suffixIcon:
                                                    const CountryCodePicker(
                                                  showCountryOnly: true,
                                                  flagWidth: 20,
                                                  enabled: false,
                                                  initialSelection: 'SY',
                                                )),
                                          ),
                                          SizedBox(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: CustomButton(
                                                    label:
                                                        AppLocalizations.of(
                                                                context)!
                                                            .confirm,
                                                    fillColor: ColorManager
                                                        .primaryGreen,
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder:
                                                            (BuildContext
                                                                context) {
                                                          return AlertDialog(
                                                            backgroundColor:
                                                                Colors
                                                                    .white,
                                                            title: Material(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        25.0),
                                                              ),
                                                              child:
                                                                  Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        10),
                                                                child:
                                                                    Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment.start,
                                                                      children: [
                                                                        Text(
                                                                          AppLocalizations.of(context)!.confirmNumber,
                                                                          style: getBoldStyle(color: ColorManager.grayForMessage, fontSize: 15),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          vertical: 20),
                                                                      child:
                                                                          PinFieldAutoFill(
                                                                        decoration:
                                                                            BoxLooseDecoration(
                                                                          strokeColorBuilder: const FixedColorBuilder(
                                                                            ColorManager.grayForm,
                                                                          ),
                                                                          bgColorBuilder: const FixedColorBuilder(
                                                                            ColorManager.grayForm,
                                                                          ),
                                                                          textStyle: const TextStyle(fontSize: 20, color: ColorManager.primaryGreen),
                                                                        ),
                                                                        //   currentCode: textEditingController.text,
                                                                        codeLength:
                                                                            6,
                                                                        onCodeChanged:
                                                                            (String? code) {},
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Expanded(
                                                                            child: CustomButton(
                                                                              label: AppLocalizations.of(context)!.confirm,
                                                                              fillColor: ColorManager.primaryGreen,
                                                                              onTap: () {},
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            width: 28,
                                                                          ),
                                                                          Expanded(
                                                                            child: CustomButton(
                                                                              label: AppLocalizations.of(context)!.back,
                                                                              fillColor: Colors.white,
                                                                              onTap: () {
                                                                                AppRouter.pop(context);
                                                                              },
                                                                              isFilled: true,
                                                                              labelColor: ColorManager.primaryGreen,
                                                                              borderColor: ColorManager.primaryGreen,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 28,
                                                ),
                                                Expanded(
                                                  child: CustomButton(
                                                    label:
                                                        AppLocalizations.of(
                                                                context)!
                                                            .back,
                                                    fillColor: Colors.white,
                                                    onTap: () {
                                                      AppRouter.pop(
                                                          context);
                                                    },
                                                    isFilled: true,
                                                    labelColor: ColorManager
                                                        .primaryGreen,
                                                    borderColor:
                                                        ColorManager
                                                            .primaryGreen,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }),
                        const SizedBox(height: 16),
                        CustomButton(
                          label: AppLocalizations.of(context)!.save_Changes,
                          onTap: () {},
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
          ],
        ),
      ),
    );
  }
}