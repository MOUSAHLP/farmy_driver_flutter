import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmy_driver/presentation/app_widgets/base_scaffold.dart';
import 'package:pharmy_driver/presentation/screens/orders_history/screens/earning_date.dart';
import 'package:pharmy_driver/translations.dart';
import '../../../../cubit/orders_history/orders_history_cubit.dart';
import '../../../../cubit/orders_history/orders_history_state.dart';
import 'order_date.dart';

class OrdersHistoryScreen extends StatelessWidget {
  const OrdersHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          OrdersHistoryCubit()..getDriverOrdersHistory("2024-03-28", "weekly"),
      child: BlocConsumer<OrdersHistoryCubit, OrdersHistoryState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          OrdersHistoryCubit cubit = OrdersHistoryCubit.get(context);
          return Scaffold(
            body: BaseScaffold(
              isBack: true,
              title: AppLocalizations.of(context)!.orders_date,
              child: Expanded(
                child: state is LoadingState
                    ? Center(
                        child: Text("data"),
                      )
                    : Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                cubit.getDriverOrdersHistory(
                                    "2024-03-28", "weekly");
                              },
                              child: Text("Request")),
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
