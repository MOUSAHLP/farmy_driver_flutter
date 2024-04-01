import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/cubit/orders_history/orders_history_cubit.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_app.dart';
import '../../../resources/style_app.dart';
import '../../../resources/values_app.dart';

//import 'package:d_chart/d_chart.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:pharmy_driver/translations.dart';

class AllOrdersStatistics extends StatelessWidget {
  const AllOrdersStatistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersHistoryCubit cubit = OrdersHistoryCubit.get(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Divider(
            color: ColorManager.grayForMessage,
            endIndent: 20.w,
            indent: 20.w,
            thickness: 0.8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: PaddingApp.p16, horizontal: PaddingApp.p20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
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
                        '${cubit.ordersHistorymodel!.driverOrders!.length} ${AppLocalizations.of(context)!.order}',
                        style: getBold800Style(
                            color: ColorManager.grayForMessage,
                            fontSize: FontSizeApp.s15),
                      )
                    ],
                  ),
                ),
                6.horizontalSpace,
              ],
            ),
          ),
          Divider(
            color: ColorManager.grayForMessage,
            endIndent: 20.w,
            indent: 20.w,
            thickness: 0.8,
          ),
        ],
      ),
    );
  }
}
