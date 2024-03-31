import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmy_driver/presentation/app_widgets/base_scaffold.dart';
import 'package:pharmy_driver/presentation/screens/all_order_history/screens/earning_date.dart';
import 'package:pharmy_driver/translations.dart';
import '../../../../cubit/order&earnings_date/order&earnings_date_cubit.dart';
import '../../../../cubit/order&earnings_date/order&earnings_date_state.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_app.dart';
import '../../../resources/style_app.dart';
import '../../../resources/values_app.dart';
import 'order_date.dart';
import 'package:pharmy_driver/translations.dart';

class AllOrderHistoryScreen extends StatelessWidget {
  const AllOrderHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Order_earnings_dateCubit(),
      child: BlocConsumer<Order_earnings_dateCubit, Order_earnings_dateState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          Order_earnings_dateCubit cubit =
              Order_earnings_dateCubit.get(context);
          return Scaffold(
            body: BaseScaffold(
              isBack: true,
              title: AppLocalizations.of(context)!.orders_date,
              child: const Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            EarningsDate(),
                            OrderDate(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
