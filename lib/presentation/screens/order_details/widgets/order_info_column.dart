import 'package:flutter/material.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/font_app.dart';
import 'package:pharmy_driver/presentation/resources/values_app.dart';
import 'package:pharmy_driver/presentation/screens/order_details/widgets/order_details_row.dart';
import 'package:pharmy_driver/translations.dart';

class OrderInfoWidget extends StatelessWidget {
  const OrderInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric( horizontal: PaddingApp.p25),
      child: Column(
        children: [
          OrderDetailsRow(
              titleColor:  ColorManager.grayForMessage,
              contentColor:  ColorManager.grayForMessage,
              fontSize: FontSizeApp.s12,
              title: AppLocalizations.of(context)!.order_number,
              content: 'F123457'),
          OrderDetailsRow(
              titleColor:  ColorManager.grayForMessage,
              contentColor:  ColorManager.grayForMessage,
              fontSize: FontSizeApp.s12,
              title: AppLocalizations.of(context)!.order_date,
              content: '11/11/2024'),
          OrderDetailsRow(
              titleColor:  ColorManager.grayForMessage,
              contentColor:  ColorManager.primaryGreen,
              fontSize: FontSizeApp.s12,
              title: AppLocalizations.of(context)!.order_time,
              content: '5:30 pm'),
          OrderDetailsRow(
              titleColor:  ColorManager.grayForMessage,
              contentColor:  ColorManager.primaryGreen,
              fontSize: FontSizeApp.s12,
              title: AppLocalizations.of(context)!.order_status,
              content: 'طلب سريع خلال (30 دقيقة)'),
          OrderDetailsRow(
              titleColor:  ColorManager.grayForMessage,
              contentColor:  ColorManager.grayForMessage,
              fontSize: FontSizeApp.s12,
              title: AppLocalizations.of(context)!.pay_method,
              content: 'دفع عند الاستلام'),
          OrderDetailsRow(
              titleColor:  ColorManager.grayForMessage,
              contentColor:  ColorManager.grayForMessage,
              fontSize: FontSizeApp.s12,
              title: AppLocalizations.of(context)!.order_location,
              content: ' كورنيش التجارة, حلاق الهيبة, بناء 25و طابق 12'),
          OrderDetailsRow(
              titleColor:  ColorManager.grayForMessage,
              contentColor:  ColorManager.primaryGreen,
              fontSize: FontSizeApp.s12,
              title: AppLocalizations.of(context)!.order_total_price,
              content: ' 200,000 ل.س'),
        ],
      ),
    );
  }
}
