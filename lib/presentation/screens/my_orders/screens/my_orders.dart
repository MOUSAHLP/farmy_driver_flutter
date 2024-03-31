import 'package:flutter/material.dart';
import 'package:pharmy_driver/presentation/resources/values_app.dart';
import 'package:pharmy_driver/presentation/screens/my_orders/widgets/order_card.dart';
import 'package:pharmy_driver/translations.dart';

import '../../../app_widgets/base_scaffold.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title:AppLocalizations.of(context)!.my_orders,
      child: Expanded(
        child: Text("k")
        // ListView.separated(
        //   padding: const EdgeInsets.symmetric(vertical: PaddingApp.p22,   horizontal: PaddingApp.p22),
        //     shrinkWrap: true,
        //     itemBuilder: (context, index) =>const OrderCardWidget(),
        //     separatorBuilder: (context, index) =>const SizedBox(height: PaddingApp.p22,),
        //     itemCount: 3),
      ),
    );
  }
}
