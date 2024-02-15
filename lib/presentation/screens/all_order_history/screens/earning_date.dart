import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/presentation/screens/all_order_history/widgets/chart.dart';
import 'package:pharmy_driver/presentation/screens/all_order_history/widgets/circular_container.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_app.dart';
import '../../../resources/style_app.dart';
import '../../../resources/values_app.dart';
//import 'package:d_chart/d_chart.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:pharmy_driver/translations.dart';

class EarningsDate extends StatelessWidget {
  const EarningsDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: PaddingApp.p18, horizontal: PaddingApp.p25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularContainer(
                    text: AppLocalizations.of(context)!.daily),
                CircularContainer(
                    text: AppLocalizations.of(context)!.weekly,
                    color: ColorManager.primaryGreen,
                    textColor: ColorManager.white),
                CircularContainer(
                    text: AppLocalizations.of(context)!.monthly),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: PaddingApp.p5, horizontal: PaddingApp.p25),
            child: Text(
              AppLocalizations.of(context)!.date_of_your_weekly_earnings,
              style: getBoldStyle(
                  fontSize: FontSizeApp.s15, color: ColorManager.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: PaddingApp.p14, horizontal: PaddingApp.p32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: () {},
                    child: const Icon(Icons.arrow_back_ios_rounded,
                        color: ColorManager.grayForMessage, size: 20)),
                Text(
                  'كانون الثاني ( 1 - 7 )',
                  style: getBold800Style(
                      color: ColorManager.grayForMessage,
                      fontSize: FontSizeApp.s15),
                ),
                InkWell(
                    onTap: () {},
                    child: const Icon(Icons.arrow_forward_ios_rounded,
                        color: ColorManager.grayForMessage, size: 20)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: PaddingApp.p10, horizontal: PaddingApp.p22),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 253, 249, 254),
                  boxShadow: [ColorManager.shadowGaryDown]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: PaddingApp.p25),
                child: Text(
                  '500,000 ل.س',
                  style: getBoldStyle(
                      color: ColorManager.primaryGreen,
                      fontSize: FontSizeApp.s26),
                ),
              ),
            ),
          ),
          const Chart(),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: PaddingApp.p16, horizontal: PaddingApp.p20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    // width: 35.w,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 253, 249, 254),
                        boxShadow: [ColorManager.shadowGaryDownSoft]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.number_of_all_orders,
                          style: getBold800Style(
                              color: ColorManager.grayForMessage,
                              fontSize: FontSizeApp.s15),
                        ),
                        Text(
                          '200 ${AppLocalizations.of(context)!.order}',
                          style: getBold800Style(
                              color: ColorManager.grayForMessage,
                              fontSize: FontSizeApp.s15),
                        )
                      ],
                    ),
                  ),
                ),
                6.horizontalSpace,
                Expanded(
                  child: Container(
                      // width: 135.w,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 253, 249, 254),
                          boxShadow: [ColorManager.shadowGaryDownSoft]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.your_connection_time,
                            style: getBold800Style(
                                color: ColorManager.grayForMessage,
                                fontSize: FontSizeApp.s15),
                          ),
                          Text(
                            '5${AppLocalizations.of(context)!.days}12${AppLocalizations.of(context)!.hour}',
                            style: getBold800Style(
                                color: ColorManager.grayForMessage,
                                fontSize: FontSizeApp.s15),
                          )
                        ],
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
