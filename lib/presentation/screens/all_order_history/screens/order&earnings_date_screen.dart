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
  const AllOrderHistoryScreen({
    Key? key,
  }) : super(key: key);

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
              child: Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: PaddingApp.p10, horizontal: PaddingApp.p22),
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.19),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        )
                      ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              cubit.orderDate();
                            },
                            child: Text(
                                '${AppLocalizations.of(context)!.order_history} ',
                                style: cubit.isOrderDate
                                    ? getUnderLineBoldStyle(
                                        color: ColorManager.primaryGreen,
                                      )
                                    : getBold800Style(
                                        fontSize: FontSizeApp.s15,
                                        color: ColorManager.grayForMessage)),
                          ),
                          const Text('|',
                              style: TextStyle(
                                  color: Color(0xff727272),
                                  fontSize: FontSizeApp.s17)),
                          InkWell(
                            onTap: () {
                              cubit.earningsDate();
                            },
                            child: Text(
                                '${AppLocalizations.of(context)!.history_of_your_earnings} ',
                                style: !cubit.isOrderDate
                                    ? getUnderLineBoldStyle(
                                        color: ColorManager.primaryGreen,
                                      )
                                    : getBold800Style(
                                        fontSize: FontSizeApp.s15,
                                        color: ColorManager.grayForMessage)),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: SingleChildScrollView(child: Column(children: [cubit.isOrderDate ? const OrderDate() : const EarningsDate()],)))

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
