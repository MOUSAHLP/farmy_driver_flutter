import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/presentation/app_widgets/custom_button.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/font_app.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';
import 'package:pharmy_driver/presentation/resources/values_app.dart';
import 'package:pharmy_driver/translations.dart';

class DuesCard extends StatelessWidget {
  const DuesCard({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(vertical: 13,horizontal: 40),
      child: Column(
        children: [
          Container(
            width: 1.sw,
            height: 164,
            decoration: BoxDecoration(
                border: Border.all(color: ColorManager.primaryGreen,width: 2),
                color: Colors.white,borderRadius: BorderRadius.circular(6)),
            child: Column(
              children: [
                Container(
                  height: 64,
                  width: 1.sw,
                  decoration: const BoxDecoration(
                      color: ColorManager.primaryGreen,
                      borderRadius: BorderRadius.only(bottomRight:Radius.circular(6),bottomLeft: Radius.circular(6))
                  ),
                  child:  Center(child: Text(AppLocalizations.of(context)!.your_dues,style: getBoldStyle(color: Colors.white,fontSize: 17)),),
                ),

                Expanded(child: Center(child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(" 200,000",style: getBoldStyle(color: ColorManager.primaryGreen,fontSize: 30)),
                        Text("  ل.س",style: getBoldStyle(color: ColorManager.primaryGreen,fontSize: 16)),
                      ],
                    ),
                    CustomButton(
                      width: 0.33.sw,
                      height: 47,
                      paddingText: PaddingApp.p4,
                      label: AppLocalizations.of(context)!.request_your_benefits,
                      fillColor:ColorManager.primaryGreen ,
                      labelColor:Colors.white ,
                      styleText: getUnderBoldStyle(color: Colors.white ,fontSize: FontSizeApp.s14),
                      onTap: () {

                      },

                    ),
                    const SizedBox(height: 4,)
                  ],
                )))
              ],
            ),
          ),

        ],
      ),
    );
  }
}
