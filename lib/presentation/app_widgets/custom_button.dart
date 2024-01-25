import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/presentation/resources/font_app.dart';

import '../resources/color_manager.dart';
import '../resources/style_app.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.fillColor = ColorManager.primaryGreen,
    this.borderColor,
    this.isFilled = false,
    this.labelColor = Colors.white,
    this.height,
    this.width,
    required this.label,
    this.onTap, this.fontSize, this.styleText, this.paddingText,
  }) : super(key: key);
  final Color fillColor;
  final bool isFilled;
  final Color labelColor;
  final Color? borderColor;
  final double? height;
  final double? width;
  final double?  fontSize;
  final double?  paddingText;
  final String label;
  final TextStyle? styleText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 1.sw - 50,
        height: height ?? 47,
        decoration: BoxDecoration(
            color: isFilled ? fillColor : null,
            borderRadius: BorderRadius.circular(12),
            border:
            Border.all(color: borderColor ?? Colors.transparent, width: 2),
            gradient: !isFilled ? ColorManager.linearGradientPrimary : null
          // boxShadow: isFilled
          //     ?ColorManager.boxShadow
          //     : []
        ),
        child: Center(
          child: Padding(
            padding:  EdgeInsets.all(paddingText??10.0),
            child: Text(
              label,
              style:styleText?? getBoldStyle(
                color: labelColor,
                fontSize: fontSize??FontSizeApp.s12
              ),
            ),
          ),
        ),
      ),
    );
  }
}