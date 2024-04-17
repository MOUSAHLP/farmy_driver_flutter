import 'package:flutter/material.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/font_app.dart';
import 'package:pharmy_driver/presentation/resources/values_app.dart';
import 'package:pharmy_driver/presentation/screens/order_details/widgets/order_details_row.dart';
import 'package:pharmy_driver/translations.dart';

import '../../../../models/order_details_model.dart';

class OrderInfoWidget extends StatelessWidget {
  final bool isHome;
  final OrderDetailsModel orderDetailsModel;

  const OrderInfoWidget({Key? key, this.isHome = false,required this.orderDetailsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: PaddingApp.p25),
      child: Column(
        children: [
          OrderDetailsRow(
              titleColor: ColorManager.grayForMessage,
              contentColor: ColorManager.grayForMessage,
              fontSize: FontSizeApp.s12,
              title: AppLocalizations.of(context)!.order_number,
              content: orderDetailsModel.orderNumber.toString()),
          OrderDetailsRow(
              titleColor: ColorManager.grayForMessage,
              contentColor: ColorManager.grayForMessage,
              fontSize: FontSizeApp.s12,
              title: AppLocalizations.of(context)!.order_date,
              content: orderDetailsModel.orderDate??""),
          OrderDetailsRow(
              titleColor: ColorManager.grayForMessage,
              contentColor: ColorManager.primaryGreen,
              fontSize: FontSizeApp.s12,
              title: AppLocalizations.of(context)!.order_time,
              content: orderDetailsModel.orderTime??""),
          OrderDetailsRow(
              titleColor: ColorManager.grayForMessage,
              contentColor: ColorManager.primaryGreen,
              fontSize: FontSizeApp.s12,
              title: AppLocalizations.of(context)!.order_status,
              content: orderDetailsModel.status??""),
          OrderDetailsRow(
              titleColor: ColorManager.grayForMessage,
              contentColor: ColorManager.grayForMessage,
              fontSize: FontSizeApp.s12,
              title: AppLocalizations.of(context)!.pay_method,
              content: orderDetailsModel.paymentMethod??""),
          OrderDetailsRow(
              titleColor: ColorManager.grayForMessage,
              contentColor: ColorManager.grayForMessage,
              fontSize: FontSizeApp.s12,
              title: AppLocalizations.of(context)!.order_location,
              content: orderDetailsModel.userAddress??""),
          if (!isHome) ...[
            OrderDetailsRow(
                titleColor: ColorManager.grayForMessage,
                contentColor: ColorManager.primaryGreen,
                fontSize: FontSizeApp.s12,
                title: AppLocalizations.of(context)!.the_value_of_the_request,
                content: orderDetailsModel.subTotal??""),
            OrderDetailsRow(
                titleColor: ColorManager.grayForMessage,
                contentColor: ColorManager.primaryGreen,
                fontSize: FontSizeApp.s12,
                title: AppLocalizations.of(context)!.delivery_value,
                content:orderDetailsModel.deliveryFee??""),
            OrderDetailsRow(
                titleColor: ColorManager.grayForMessage,
                contentColor: ColorManager.primaryGreen,
                fontSize: FontSizeApp.s12,
                title: AppLocalizations.of(context)!.total_invoice,
                content:orderDetailsModel.total.toString()??""),
            OrderDetailsRow(
                titleColor: ColorManager.grayForMessage,
                contentColor: ColorManager.primaryGreen,
                fontSize: FontSizeApp.s12,
                title: AppLocalizations.of(context)!.tax,
                content:orderDetailsModel.tax.toString()??""),
          ],
        ],
      ),
    );
  }
}
