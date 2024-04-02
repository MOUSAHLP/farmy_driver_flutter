import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/cubit/all_orders_date/all_orders_date_cubit.dart';
import 'package:pharmy_driver/cubit/all_orders_date/all_orders_date_state.dart';
import 'package:pharmy_driver/presentation/app_widgets/base_scaffold.dart';
import 'package:pharmy_driver/presentation/app_widgets/custom_button.dart';
import 'package:pharmy_driver/presentation/screens/transactions/widgets/order_date_row.dart';
import 'package:pharmy_driver/translations.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_app.dart';
import '../../../resources/style_app.dart';
import '../../../resources/values_app.dart';

class AllOrdersDate extends StatelessWidget {
  const AllOrdersDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AllOrdersDateCubit cubit = AllOrdersDateCubit.get(context);
    return Scaffold(
      body: BaseScaffold(
        isBack: true,
        title: AppLocalizations.of(context)!.all_order_history,
        child: Expanded(
          child: BlocConsumer<AllOrdersDateCubit, AllOrdersDateState>(
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: PaddingApp.p20, horizontal: PaddingApp.p32),
                      child: Row(
                        children: [
                          Text(AppLocalizations.of(context)!.more_details,
                              style: getBold800Style(
                                  color: ColorManager.grayForMessage,
                                  fontSize: FontSizeApp.s15)),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomButton(
                              isIcon: true,
                              // width: 0.33.sw,
                              height: 47,
                              paddingText: PaddingApp.p4,
                              isFilled: true,
                              label: AppLocalizations.of(context)!
                                  .downloading_file,
                              fillColor: Colors.white,
                              labelColor: ColorManager.primaryGreen,
                              borderColor: ColorManager.primaryGreen,
                              styleText: getUnderBoldStyle(
                                  color: ColorManager.primaryGreen,
                                  fontSize: FontSizeApp.s14.sp),
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 44,
                      width: 1.sw,
                      decoration: const BoxDecoration(
                          color: ColorManager.primaryGreen,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6))),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Center(
                                    child: Text(
                              AppLocalizations.of(context)!.order_number,
                              style: getBoldStyle(
                                  color: Colors.white,
                                  fontSize: FontSizeApp.s15),
                            ))),
                            Expanded(
                                child: Center(
                                    child: Text(
                              AppLocalizations.of(context)!.date,
                              style: getBoldStyle(
                                  color: Colors.white,
                                  fontSize: FontSizeApp.s15),
                            ))),
                            Expanded(
                                child: Center(
                                    child: Text(
                              AppLocalizations.of(context)!.total,
                              style: getBoldStyle(
                                  color: Colors.white,
                                  fontSize: FontSizeApp.s15),
                            ))),
                          ],
                        ),
                      ),
                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          vertical: PaddingApp.p12, horizontal: 1),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => OrderDateRow(
                        orderNumber:
                            cubit.allOrdersModel![index].orderNumber.toString(),
                        date: cubit.allOrdersModel![index].orderDate!,
                        total: cubit.allOrdersModel![index].total!.toString(),
                      ),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: cubit.allOrdersModel!.length,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
