import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/translations.dart';

import '../../../app_widgets/image_helper_svg.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_app.dart';
import '../../../resources/style_app.dart';
import '../../../resources/values_app.dart';
import '../widgets/order_table.dart';

class OrderDate extends StatelessWidget {
  const OrderDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: PaddingApp.p20, horizontal: PaddingApp.p32),
          child: Row(
            children: [
              Expanded(
                child: Text(AppLocalizations.of(context)!.more_details,
                    style: getBold800Style(
                        color: ColorManager.grayForMessage,
                        fontSize: FontSizeApp.s15)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(end: 20.w),
                  child: Container(
                    height: 40.h,
                    // width: 28.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorManager.primaryGreen, width: 1.3),
                        borderRadius: BorderRadius.circular(8)),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: PaddingApp.p4,
                            horizontal: PaddingApp.p10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.downloading_file,
                              style: getBold800Style(
                                color: ColorManager.primaryGreen,
                              ),
                            ),
                            const ImageSvgWidget(
                              url: IconsManager.pdfIcon,
                              // color: ColorFilter.mode(
                              //     ColorManager.primaryGreen, BlendMode.srcIn),
                            ).buildAssetSvgImage(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const OrderTable()
      ],
    );
  }
}
