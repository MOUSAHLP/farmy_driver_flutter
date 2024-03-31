import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/presentation/screens/all_order_history/widgets/order_table_row.dart';
import 'package:pharmy_driver/translations.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_app.dart';
import '../../../resources/style_app.dart';
import '../../../resources/values_app.dart';

class OrderTable extends StatelessWidget {
  const OrderTable({Key? key}) : super(key: key);

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
                  orderNumber: "54545",
                  date: "01/01/2024",
                  total: "200000",
                ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 20),
      ],
    );
  }
}
