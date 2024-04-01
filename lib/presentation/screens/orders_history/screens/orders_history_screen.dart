import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/presentation/app_widgets/base_scaffold.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/font_app.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';
import 'package:pharmy_driver/presentation/resources/values_app.dart';
import 'package:pharmy_driver/presentation/screens/orders_history/screens/earning_date.dart';
import 'package:pharmy_driver/presentation/screens/orders_history/widgets/chart.dart';
import 'package:pharmy_driver/translations.dart';
import '../../../../cubit/orders_history/orders_history_cubit.dart';
import '../../../../cubit/orders_history/orders_history_state.dart';
import 'all_orders_history_date.dart';

class OrdersHistoryScreen extends StatelessWidget {
  const OrdersHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersHistoryCubit cubit = OrdersHistoryCubit.get(context);
    return Scaffold(
      body: BaseScaffold(
        isBack: true,
        title: AppLocalizations.of(context)!.orders_date,
        child: Expanded(
          child: BlocConsumer<OrdersHistoryCubit, OrdersHistoryState>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, state) {
              if (state is ErrorState) {
                return Expanded(
                  child: Center(child: Text("Error${state.error}")),
                );
              } else if (state is LoadingState) {
                return const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else {
                return Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              // state is UpdatingState
                              //     ? const CircularProgressIndicator()
                              //     : const EarningsDate(),

                              // Padding(
                              //   padding: const EdgeInsets.symmetric(
                              //       vertical: PaddingApp.p18, horizontal: PaddingApp.p25),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //     children: [
                              //       CircularContainer(text: AppLocalizations.of(context)!.daily),
                              //       CircularContainer(
                              //           text: AppLocalizations.of(context)!.weekly,
                              //           color: ColorManager.primaryGreen,
                              //           textColor: ColorManager.white),
                              //       CircularContainer(text: AppLocalizations.of(context)!.monthly),
                              //     ],
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: PaddingApp.p10,
                                    horizontal: PaddingApp.p25),
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .daily_orders_percentage,
                                  style: getBoldStyle(
                                      fontSize: FontSizeApp.s15,
                                      color: ColorManager.black),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: PaddingApp.p14,
                                    horizontal: PaddingApp.p32),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          cubit.addDays(7);
                                        },
                                        child: const Icon(
                                            Icons.arrow_back_ios_rounded,
                                            color: ColorManager.grayForMessage,
                                            size: 20)),
                                    Text(
                                      cubit.getDate(context),
                                      style: getBold800Style(
                                          color: ColorManager.grayForMessage,
                                          fontSize: FontSizeApp.s15),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          cubit.subtractDays(7);
                                          cubit.getDriverOrdersStatistics();
                                        },
                                        child: const Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: ColorManager.grayForMessage,
                                            size: 20)),
                                  ],
                                ),
                              ),
                              if (state is UpdatingState)
                                SizedBox(
                                  height: 120.h,
                                  child: const Center(
                                      child: CircularProgressIndicator()),
                                )
                              else
                                Chart(
                                    data: cubit.ordersHistorymodel!
                                        .statisticsdata!.weekData!),

                              const AllOrdersStatistics(),

                             const AllOrdersHistoryDate(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
