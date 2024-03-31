import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/presentation/app_widgets/base_scaffold.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/font_app.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';
import 'package:pharmy_driver/presentation/screens/transactions/widgets/dues_card.dart';
import 'package:pharmy_driver/presentation/screens/transactions/widgets/order_date_card.dart';
import 'package:pharmy_driver/translations.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: AppLocalizations.of(context)!.transactions,
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27),
                child: Row(
                  children: [
                    Text(
                      "${AppLocalizations.of(context)!.dues} :",
                      style: getBoldStyle(
                          color: ColorManager.grayForMessage, fontSize: 15),
                    )
                  ],
                ),
              ),
              DuesCard(
                dues: int.parse("200000"),
                onTap: () {},
              ),
              SizedBox(
                height: 4.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 27.h),
                child: Row(
                  children: [
                    Text(
                      "${AppLocalizations.of(context)!.order_date} :",
                      style: getBoldStyle(
                          color: ColorManager.grayForMessage,
                          fontSize: FontSizeApp.s15),
                    )
                  ],
                ),
              ),
              const OrderDateCard()
            ],
          ),
        ),
      ),
    );
  }
}
