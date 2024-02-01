import 'package:flutter/material.dart';
import 'package:pharmy_driver/presentation/app_widgets/base_scaffold.dart';
import 'package:pharmy_driver/translations.dart';

class AllOrderHistoryScreen extends StatelessWidget {
  const AllOrderHistoryScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseScaffold(
        isBack: true,
          title:AppLocalizations.of(context)!.orders_date, child: Container(),),
    );
  }
}
