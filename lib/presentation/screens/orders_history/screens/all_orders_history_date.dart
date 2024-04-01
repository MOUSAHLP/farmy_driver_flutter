import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/cubit/orders_history/orders_history_cubit.dart';
import 'package:pharmy_driver/presentation/app_widgets/custom_button.dart';
import 'package:pharmy_driver/translations.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_app.dart';
import '../../../resources/style_app.dart';
import '../../../resources/values_app.dart';
import '../widgets/order_table.dart';

class AllOrdersHistoryDate extends StatelessWidget {
  const AllOrdersHistoryDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersHistoryCubit cubit = OrdersHistoryCubit.get(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: PaddingApp.p20, horizontal: PaddingApp.p32),
          child: Row(
            children: [
              Text(AppLocalizations.of(context)!.more_details,
                  style: getBold800Style(
                      color: ColorManager.grayForMessage,
                      fontSize: FontSizeApp.s15)),
              const SizedBox(width: 10),
              Expanded(
                child: CustomButton(
                  isIcon: true,
                  // width: 0.33.sw,
                  height: 47,
                  paddingText: PaddingApp.p4,
                  isFilled: true,
                  label: AppLocalizations.of(context)!.downloading_file,
                  fillColor: Colors.white,
                  labelColor: ColorManager.primaryGreen,
                  borderColor: ColorManager.primaryGreen,
                  styleText: getUnderBoldStyle(
                      color: ColorManager.primaryGreen,
                      fontSize: FontSizeApp.s14.sp),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
        OrderTable(listData: cubit.ordersHistorymodel!.driverOrders!)
      ],
    );
  }
}
