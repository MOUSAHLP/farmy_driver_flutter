import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_app.dart';
import '../../../resources/style_app.dart';
import '../../../resources/values_app.dart';

Widget circularContainer({
  required String text,
  Color color =const Color.fromARGB(255, 253, 249, 254),
  Color textColor= ColorManager.primaryGreen,
   double circular=5
}) =>
    Container(
        padding: const EdgeInsets.symmetric(
            vertical: PaddingApp.p5, horizontal: PaddingApp.p25),
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: ColorManager.primaryGreen, width: 1.5),
            borderRadius: BorderRadius.circular(circular)),
        child: Text(text,
            style: getBold800Style(
                color: textColor, fontSize: FontSizeApp.s13)));
