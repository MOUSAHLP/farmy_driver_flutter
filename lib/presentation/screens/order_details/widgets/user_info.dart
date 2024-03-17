import 'package:flutter/material.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/font_app.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';
import 'package:pharmy_driver/presentation/resources/values_app.dart';
import 'package:pharmy_driver/translations.dart';

class UserInfoWidget extends StatelessWidget {
  final bool isHome;

  const UserInfoWidget({Key? key, this.isHome = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: PaddingApp.p25, vertical: PaddingApp.p8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isHome)
            Text(
              AppLocalizations.of(context)!.order_info1,
              style: getRegularStyle(
                  color: ColorManager.grayForMessage,
                  fontSize: FontSizeApp.s12),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: PaddingApp.p5),
            child: Text(
              '${AppLocalizations.of(context)!.order}:',
              style: getUnderBoldStyle(
                  color: ColorManager.grayForMessage,
                  fontSize: FontSizeApp.s22),
            ),
          ),
          if (!isHome) ...[
            Text(
              AppLocalizations.of(context)!.order_info2,
              style: getRegularStyle(
                  color: ColorManager.grayForMessage,
                  fontSize: FontSizeApp.s12),
            ),
            const SizedBox(height: SizeApp.s8),
          ],
        ],
      ),
    );
  }
}
