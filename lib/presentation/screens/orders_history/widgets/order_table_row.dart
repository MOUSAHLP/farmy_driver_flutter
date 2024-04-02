import 'package:flutter/material.dart';
import 'package:pharmy_driver/core/utils/formatter.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';
import 'package:pharmy_driver/translations.dart';

class OrderTableRow extends StatelessWidget {
  final String orderNumber;
  final String date;
  final String total;
  const OrderTableRow(
      {Key? key,
      required this.orderNumber,
      required this.date,
      required this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Center(
                child: Text(
          orderNumber,
          style:
              getRegularStyle(color: ColorManager.grayForMessage, fontSize: 15),
        ))),
        Expanded(
            child: Center(
                child: Text(
          date,
          style:
              getRegularStyle(color: ColorManager.grayForMessage, fontSize: 15),
        ))),
        Expanded(
            child: Center(
                child: Text(
          "${Formatter.formatNumber(int.parse(total))} ${AppLocalizations.of(context)!.syrian_pound}",
          style:
              getRegularStyle(color: ColorManager.grayForMessage, fontSize: 15),
        ))),
      ],
    );
  }
}
