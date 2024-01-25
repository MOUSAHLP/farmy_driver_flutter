import 'package:flutter/material.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/font_app.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';
import 'package:pharmy_driver/translations.dart';

class ProgressCircleIndicatorWidget extends StatelessWidget {
  const ProgressCircleIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
       alignment: Alignment.center,
      children: [
        const CircularProgressIndicator(
          value: 0.7,
          strokeWidth: 12,
          strokeCap:StrokeCap.round ,
          strokeAlign: 10,
          backgroundColor: ColorManager.grayForSearch,
          valueColor: AlwaysStoppedAnimation<Color>(ColorManager.primaryGreen),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10,),
            Text(AppLocalizations.of(context)!.total_your_points,style: getBold800Style(color: ColorManager.grayForMessage,fontSize: FontSizeApp.s12)),
            Text('500',style: getBold800Style(color: ColorManager.primaryGreen,fontSize: FontSizeApp.s36)),
            Text(AppLocalizations.of(context)!.point,style: getBold800Style(color: ColorManager.grayForMessage,fontSize: FontSizeApp.s12)),
            const SizedBox(height: 10,),
          ],
        ),
      ],
    );
  }
}
