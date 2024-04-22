import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../cubit/home/home_cubit.dart';
import '../../../../cubit/home/home_states.dart';
import '../../../../models/order_model.dart';
import '../../../app_widgets/custom_alert.dart';
import '../../../app_widgets/dialog/error_dialog.dart';
import '../../../app_widgets/dialog/loading_dialog.dart';
import '../../../resources/values_app.dart';
import '../../my_orders/widgets/order_card.dart';

class ShowOrders extends StatelessWidget {
final  List<OrderModel> listOrder;
  const ShowOrders({super.key,required this.listOrder});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context,  state) {

        if (state.isLoadingAssign) {
          LoadingDialog().openDialog(context);
        } else {
          LoadingDialog().closeDialog(context);
        }
        if (state.errorAssign != "") {
           ErrorDialog.openDialog(context, state.errorAssign);
        }
        if (state.isSuccessAssign) {

        }
      },
      builder: (context,state) {
        return CustomAlert(
          content:SizedBox(
            // height: 400,
            width: 1.sw,
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                    vertical: PaddingApp.p12),
                shrinkWrap: true,
                itemBuilder: (context, index) => OrderCardWidget(
                    isHome: true, order: listOrder[index],
                  isAssign: true,
                ),
                separatorBuilder: (context, index) =>
                const SizedBox(
                  height: PaddingApp.p22,
                ),
                itemCount:listOrder.length),
          ) ,
        );
      },
    );
  }
}
