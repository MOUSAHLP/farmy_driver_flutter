
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pharmy_driver/presentation/app_widgets/base_scaffold.dart';
import 'package:pharmy_driver/presentation/app_widgets/custom_button.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/font_app.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';
import 'package:pharmy_driver/presentation/resources/values_app.dart';
import 'package:pharmy_driver/presentation/screens/transactions/widgets/company_dues_card.dart';
import 'package:pharmy_driver/presentation/screens/transactions/widgets/current_balance_card.dart';
import 'package:pharmy_driver/presentation/screens/transactions/widgets/dues_card.dart';
import 'package:pharmy_driver/presentation/screens/transactions/widgets/order_date_card.dart';
import 'package:pharmy_driver/translations.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title:AppLocalizations.of(context)!.transactions,
      child:Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CurrentBalanceCard(),
              const Divider(endIndent: 10,indent: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27),
                child: Row(
                  children: [Text("${AppLocalizations.of(context)!.dues} :",style: getBoldStyle(color: ColorManager.grayForMessage,fontSize: 15),)],
                ),
              ),
              const DuesCard(),
              const CompanyDuesCard(),
              const SizedBox(height: 10,),
              const Divider(endIndent: 10,indent: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27),
                child: Row(
                  children: [Text("${AppLocalizations.of(context)!.order_date} :",style: getBoldStyle(color: ColorManager.grayForMessage,fontSize: 15),)],
                ),
              ),
              const OrderDateCard()  ],
          ),
        ),
      ),
      );
  }
}
