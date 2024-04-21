import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../translations.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_app.dart';
import '../resources/style_app.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImageManager.placeholderLogo,
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            AppLocalizations.of(context)!.loading,
            style: getBoldStyle(
                color: ColorManager.primaryGreen, fontSize: FontSizeApp.s20),
          )
        ],
      ),
    );
  }
}
