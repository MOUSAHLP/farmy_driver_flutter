import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmy_driver/presentation/resources/values_app.dart';
import 'package:pharmy_driver/presentation/screens/my_orders/widgets/order_card.dart';
import 'package:pharmy_driver/translations.dart';

import '../../../../core/app_enum.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../cubit/home/home_cubit.dart';
import '../../../../cubit/home/home_states.dart';
import '../../../../cubit/order/order_cubit.dart';
import '../../../../cubit/order/order_states.dart';
import '../../../app_widgets/base_scaffold.dart';
import '../../../app_widgets/custom_error_screen.dart';
import '../../../app_widgets/custom_no_dataa.dart';
import '../../home/widgets/cutsom_home_shimmer.dart';
// class MyOrdersScreen extends StatelessWidget {
//
//   const MyOrdersScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(create: create);
//   }
// }


class MyOrdersBody extends StatelessWidget {
  const MyOrdersBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<  OrderCubit>(
      create:(context) =>  sl<OrderCubit>()..getOrder() ,
      child: BaseScaffold(
        title:AppLocalizations.of(context)!.my_orders,
        child: BlocBuilder<OrderCubit, OrderStates>(

          builder:(context, state)  {
            if (state.screenState == ScreenState.loading) {
              return const CustomHomeShimmer();
            }
            if (state.screenState == ScreenState.error) {
              return CustomErrorScreen(titleError: state.error,onTap: (){
                sl<OrderCubit>().getOrder();
              },);
            }
            if (state.screenState == ScreenState.success) {
            return Expanded(
              child: state.orderList.isNotEmpty?ListView.separated(
                  padding: const EdgeInsets.symmetric(
                      vertical: PaddingApp.p22, horizontal: PaddingApp.p22),
                  itemBuilder: (context, index) =>  OrderCardWidget(order: state.orderList[index]),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: PaddingApp.p22,
                      ),
                  itemCount:state.orderList.length): Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomNoData(noDataStatment: "no order"),
                ],
              ),
            );
          }
            else{
              return SizedBox();
            }
        }
        ),
      ),
    );
  }
}
