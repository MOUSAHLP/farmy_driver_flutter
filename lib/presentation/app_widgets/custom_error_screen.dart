

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../../translations.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/style_app.dart';
import 'custom_button.dart';

class CustomErrorScreen extends StatelessWidget {
  final Function()? onTap;
  final  String? titleError;
  const CustomErrorScreen({super.key, required this.onTap,this.titleError});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(IconsManager.logoApp,color: ColorManager.lightGray,height: 170,width: 170,fit: BoxFit.contain),
            const SizedBox(height: 10),
            Text(titleError??"لا يوجد اتصال الرجاء\n التحقق من إعدادات الانترنت لديك",style: getBoldStyle(color: ColorManager.primaryGreen,fontSize: 14),textAlign: TextAlign.center),
            const SizedBox(height: 10),
            CustomButton(label: AppLocalizations.of(context)!.try_again,onTap: (){
              onTap!();
            },)
          ],
        ),
      ),
    );
  }
}
