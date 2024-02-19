import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/core/app_router/app_router.dart';
import 'package:pharmy_driver/presentation/app_widgets/custom_button.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/font_app.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';
import 'package:pharmy_driver/presentation/resources/values_app.dart';
import 'package:pharmy_driver/translations.dart';

import '../../all_order_history/screens/order&earnings_date_screen.dart';

class OrderDateCard extends StatelessWidget {
  const OrderDateCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [ColorManager.shadowGaryDown],
                borderRadius: BorderRadius.circular(6)),
            child: Column(
              children: [
                Container(
                  height: 44,
                  width: 1.sw,
                  decoration: const BoxDecoration(
                      color: ColorManager.primaryGreen,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6))),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Center(
                                child: Text(
                          AppLocalizations.of(context)!.order_number,
                          style:
                              getBoldStyle(color: Colors.white, fontSize: 15),
                        ))),
                        Expanded(
                            child: Center(
                                child: Text(
                          AppLocalizations.of(context)!.date,
                          style:
                              getBoldStyle(color: Colors.white, fontSize: 15),
                        ))),
                        Expanded(
                            child: Center(
                                child: Text(
                          AppLocalizations.of(context)!.total,
                          style:
                              getBoldStyle(color: Colors.white, fontSize: 15),
                        ))),
                      ],
                    ),
                  ),
                ),
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        vertical: PaddingApp.p12, horizontal: 1),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Center(
                                    child: Text(
                              "54545",
                              style: getRegularStyle(
                                  color: ColorManager.grayForMessage,
                                  fontSize: 15),
                            ))),
                            Expanded(
                                child: Center(
                                    child: Text(
                              "01/01/2024",
                              style: getRegularStyle(
                                  color: ColorManager.grayForMessage,
                                  fontSize: 15),
                            ))),
                            Expanded(
                                child: Center(
                                    child: Text(
                              "200,000 ل.س",
                              style: getRegularStyle(
                                  color: ColorManager.grayForMessage,
                                  fontSize: 15),
                            ))),
                          ],
                        ),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: 3),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: CustomButton(
                  width: 0.33.sw,
                  height: 47,
                  paddingText: PaddingApp.p4,
                  label: AppLocalizations.of(context)!.all_order_history,
                  fillColor: ColorManager.primaryGreen,
                  labelColor: Colors.white,
                  styleText: getUnderBoldStyle(
                      color: Colors.white, fontSize: FontSizeApp.s12.sp),
                  onTap: () {
                    AppRouter.push(context, const AllOrderHistoryScreen());
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomButton(
                  isIcon: true,
                  width: 0.33.sw,
                  height: 47,
                  paddingText: PaddingApp.p4,
                  isFilled: true,
                  label: AppLocalizations.of(context)!.more_details,
                  fillColor: Colors.white,
                  labelColor: ColorManager.primaryGreen,
                  borderColor: ColorManager.primaryGreen,
                  styleText: getUnderBoldStyle(
                      color: ColorManager.primaryGreen,
                      fontSize: FontSizeApp.s12.sp),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
