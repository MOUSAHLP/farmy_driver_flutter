import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/presentation/app_widgets/custom_button.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/font_app.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';
import 'package:pharmy_driver/translations.dart';

import '../../../resources/values_app.dart';

class CompanyDuesCard extends StatelessWidget {
  const CompanyDuesCard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Container(
            width: 1.sw,
            height: 164,
            decoration: BoxDecoration(
                border: Border.all(color: ColorManager.redForFavorite,width: 2),
                color: Colors.white,borderRadius: BorderRadius.circular(6)),
            child: Column(
              children: [
                Container(
                  height: 64,
                  width: 1.sw,
                  decoration: const BoxDecoration(
                      color: ColorManager.redForFavorite,
                      borderRadius: BorderRadius.only(bottomRight:Radius.circular(6),bottomLeft: Radius.circular(6))
                  ),
                  child:  Center(child: Text(AppLocalizations.of(context)!.company_dues,style: getBoldStyle(color: Colors.white,fontSize: 17)),),
                ),

                Expanded(child: Center(child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(" 200,000",style: getBoldStyle(color: ColorManager.redForFavorite,fontSize: 30)),
                        Text("  ل.س",style: getBoldStyle(color: ColorManager.redForFavorite,fontSize: 16)),
                      ],
                    ),
                    CustomButton(
                      width: 0.33.sw,
                      height: 47,
                      paddingText: PaddingApp.p4,
                      label: AppLocalizations.of(context)!.pay_your_dues,
                      isFilled: true,
                      fillColor:ColorManager.redForFavorite ,
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
