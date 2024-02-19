import 'package:flutter/material.dart';
import 'package:pharmy_driver/core/app_router/app_router.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/font_app.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';
import 'package:pharmy_driver/presentation/resources/values_app.dart';

class ScreenTitleWidget extends StatelessWidget {
  final String title;
  final bool isBack;

  const ScreenTitleWidget({Key? key, required this.title, this.isBack = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.19),
          spreadRadius: 0,
          blurRadius: 5,
          offset: const Offset(0, 2),
        )
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: PaddingApp.p10, horizontal: PaddingApp.p22),
        child: Row(
          children: [
            Text(
              title,
              style: getBold800Style(
                  color: ColorManager.grayForMessage,
                  fontSize: FontSizeApp.s15),
            ),
            const Spacer(),
            InkWell(
                onTap: () {
                  isBack ? AppRouter.pop(context) : null;
                },
                child: const Icon(Icons.arrow_forward_ios_rounded,
                    color: ColorManager.grayForMessage, size: 20)),
          ],
        ),
      ),
    );
  }
}
