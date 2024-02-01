import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/presentation/app_widgets/custom_button.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/font_app.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';
import 'package:pharmy_driver/presentation/resources/values_app.dart';
import 'package:pharmy_driver/translations.dart';

class CurrentBalanceCard extends StatelessWidget {
  const CurrentBalanceCard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.symmetric(vertical: 13,horizontal: 40),
      child: Column(
        children: [
          Container(
            width: 1.sw,
            height: 160,
            decoration: BoxDecoration(
                boxShadow: [ColorManager.shadowGaryUp40],
                color: ColorManager.primaryGreen,borderRadius: BorderRadius.circular(6)),
            child: Column(
              children: [
                Container(
                  height: 64,
                  width: 1.sw,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(bottomRight:Radius.circular(20),bottomLeft: Radius.circular(20))
                  ),
                  child:  Center(child: Text(AppLocalizations.of(context)!.your_current_balance,style: getBoldStyle(color: ColorManager.primaryGreen,fontSize: 17)),),
                ),

                Expanded(child: Center(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(" 100,000",style: getBoldStyle(color: Colors.white,fontSize: 33)),
                    Text("  ل.س",style: getBoldStyle(color: Colors.white,fontSize: 16)),
                  ],
                )))
              ],
            ),
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround ,
            children: [
              Expanded(
                child: CustomButton(
                  width: 0.33.sw,
                  height: 47,
                  paddingText: PaddingApp.p4,
                  label: AppLocalizations.of(context)!.add_balance,
                  fillColor:ColorManager.primaryGreen ,
                  labelColor:Colors.white ,
                  styleText: getUnderBoldStyle(color: Colors.white ,fontSize: FontSizeApp.s14),
                  onTap: () {

                  },

                ),
              ),
              const SizedBox(width:10,),
              Expanded(
                child: CustomButton(
                  width: 0.33.sw,
                  height: 47,
                  paddingText: PaddingApp.p4,
                  isFilled: true,
                  label: AppLocalizations.of(context)!.enter_current_balance,
                  fillColor: Colors.white,
                  labelColor:ColorManager.primaryGreen,
                  borderColor: ColorManager.primaryGreen,
                  styleText: getUnderBoldStyle(color: ColorManager.primaryGreen,fontSize: FontSizeApp.s14),
                  onTap: () {
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
