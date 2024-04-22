import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/font_app.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';
import 'package:pharmy_driver/presentation/resources/values_app.dart';
import 'package:pharmy_driver/translations.dart';

class ProgressLinearIndicatorWidget extends StatelessWidget {
final  int progress;
  const ProgressLinearIndicatorWidget({Key? key,required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  const BorderRadius.all(Radius.circular(RadiusApp.r6)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: PaddingApp.p12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                7.verticalSpace,
                Text(
                  AppLocalizations.of(context)!.accept_percent,
                  style: getRegularStyle(
                      color: ColorManager.grayForMessage,
                      fontSize: FontSizeApp.s15),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: PaddingApp.p4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Expanded(
                        child: LinearProgressIndicator(
                          value:progress/100,
                          minHeight: 9,
                          borderRadius:
                              BorderRadius.all(Radius.circular(RadiusApp.r18)),
                          backgroundColor: ColorManager.lightGray,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              ColorManager.primaryGreen),
                        ),
                      ),
                      const SizedBox(
                        width: SizeApp.s10,
                      ),
                      Text(
                        progress.toString(),
                        style: getBoldStyle(color: ColorManager.primaryGreen),
                      ),
                      Text(
                        "%",
                        style: getBoldStyle(color: ColorManager.primaryGreen),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
