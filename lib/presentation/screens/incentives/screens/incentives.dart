import 'package:flutter/material.dart';
import 'package:pharmy_driver/presentation/app_widgets/base_scaffold.dart';
import 'package:pharmy_driver/presentation/app_widgets/custom_button.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/font_app.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';
import 'package:pharmy_driver/presentation/resources/values_app.dart';
import 'package:pharmy_driver/presentation/screens/home/widgets/progress_linear_indicator.dart';
import 'package:pharmy_driver/presentation/screens/incentives/widgets/progress_circle_indicator.dart';
import 'package:pharmy_driver/translations.dart';

class IncentivesScreen extends StatelessWidget {
  const IncentivesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title:AppLocalizations.of(context)!.incentives,
      child: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding:  const EdgeInsets.symmetric(horizontal: PaddingApp.p14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 58,),
                const Center(child: ProgressCircleIndicatorWidget()),
                const SizedBox(height: 44,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('1500 نقطة ',style: getUnderBoldStyle(color: ColorManager.primaryGreen,fontSize: FontSizeApp.s12)),
                    Text(AppLocalizations.of(context)!.get_promotion,style: getRegularStyle(color: ColorManager.grayForMessage,fontSize: FontSizeApp.s12)),
                    Text('02/04/2024',style: getRegularStyle(color: ColorManager.redForFavorite,fontSize: FontSizeApp.s12)),
                  ],
                ),
                const SizedBox(height: 22,),
                const ProgressLinearIndicatorWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: PaddingApp.p10),
                  child: Text(AppLocalizations.of(context)!.incentives_info1,style: getRegularStyle(color: ColorManager.grayForMessage,fontSize: FontSizeApp.s12)),
                ),
                const ProgressLinearIndicatorWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: PaddingApp.p10),
                  child: Text(AppLocalizations.of(context)!.incentives_info2,style: getRegularStyle(color: ColorManager.grayForMessage,fontSize: FontSizeApp.s12)),
                ),
               const SizedBox(height: SizeApp.s12,),
               Center(
                 child: CustomButton(
                    width: 128,
                    isFilled: true,
                   fillColor: ColorManager.primaryGreen,
                   styleText:getUnderBoldStyle(color: Colors.white,fontSize: FontSizeApp.s14) ,
                   label: AppLocalizations.of(context)!.bonus_guid,),
               ),
                const SizedBox(height: SizeApp.s26,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
