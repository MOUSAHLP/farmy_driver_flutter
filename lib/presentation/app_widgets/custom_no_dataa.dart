import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_app.dart';
import '../resources/style_app.dart';

class CustomNoData extends StatelessWidget {
  final String noDataStatment;
  const CustomNoData({super.key, required this.noDataStatment});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         SizedBox(
          height: 1.sh*0.13,
        ),
        Image.asset(ImageManager.placeholderLogo,
        height:1.sh*0.24,
        width:1.sw*0.44 ),
        SizedBox(
          height:1.sh*0.02,
        ),
        Padding(
          padding:   EdgeInsets.symmetric(horizontal: 1.sw*0.24),
          child: Text(
            noDataStatment,
            style: getUnderBoldStyle(
                color: ColorManager.grayForSearch, fontSize: FontSizeApp.s16),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height:1.sh*0.02,
        ),
      ],
    );
  }
}
