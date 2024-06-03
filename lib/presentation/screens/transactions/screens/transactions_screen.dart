import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/cubit/transactions/transactions_cubit.dart';
import 'package:pharmy_driver/cubit/transactions/transactions_state.dart';
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
    TransactionsCubit cubit = TransactionsCubit.get(context);
    return BaseScaffold(
      title: AppLocalizations.of(context)!.transactions,
      child: Expanded(
        child: SingleChildScrollView(
          child: BlocConsumer<TransactionsCubit, TransactionsState>(
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
                }
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 27),
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         "${AppLocalizations.of(context)!.dues} :",
                    //         style: getBoldStyle(
                    //             color: ColorManager.grayForMessage,
                    //             fontSize: 15),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // DuesCard(
                    //   dues: int.parse(
                    //       cubit.transactionsModel!.driverDues.toString()),
                    //   onTap: () {},
                    // ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 27.h),
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.order_date_last_5,
                            style: getBoldStyle(
                                color: ColorManager.grayForMessage,
                                fontSize: FontSizeApp.s15),
                          )
                        ],
                      ),
                    ),
                    OrderDateCard(
                      listData: cubit.transactionsModel!.orders!,
                      pdfUrl: cubit.transactionsModel!.pdfUrl!,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
