import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/models/order_history_model.dart';
import 'package:pharmy_driver/presentation/screens/orders_history/widgets/order_table_row.dart';
import 'package:pharmy_driver/translations.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_app.dart';
import '../../../resources/style_app.dart';
import '../../../resources/values_app.dart';

class OrderTable extends StatelessWidget {
  final List<DriverOrders> listData;
  const OrderTable({Key? key, required this.listData,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 40.h,
          color: ColorManager.primaryGreen,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(AppLocalizations.of(context)!.order_number,
                  style: getBold800Style(
                      color: ColorManager.white, fontSize: FontSizeApp.s15)),
              Text(
                AppLocalizations.of(context)!.date,
                style: getBold800Style(
                    color: ColorManager.white, fontSize: FontSizeApp.s15),
              ),
              Text(
                AppLocalizations.of(context)!.total,
                style: getBold800Style(
                    color: ColorManager.white, fontSize: FontSizeApp.s15),
              ),
            ],
          ),
        ),
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
                vertical: PaddingApp.p12, horizontal: 1),
            shrinkWrap: true,
            itemBuilder: (context, index) => OrderTableRow(
                  orderNumber: listData[index].orderNumber.toString(),
                  date: listData[index].orderDate!,
                  total: listData[index].total!.toString(),
                ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: listData.length),
      ],
    );
  }
}
