import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmy_driver/core/launcher.dart';
import 'package:pharmy_driver/cubit/order/order_cubit.dart';
import 'package:pharmy_driver/cubit/order/order_states.dart';
import 'package:pharmy_driver/cubit/setting/setting_bloc.dart';
import 'package:pharmy_driver/presentation/app_widgets/base_scaffold.dart';
import 'package:pharmy_driver/presentation/app_widgets/custom_button.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/font_app.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';
import 'package:pharmy_driver/presentation/resources/values_app.dart';
import 'package:pharmy_driver/presentation/screens/order_delivery/screens/order_deliveryscreen.dart';
import 'package:pharmy_driver/presentation/screens/order_details/widgets/order_expanded_card.dart';
import 'package:pharmy_driver/presentation/screens/order_details/widgets/user_info.dart';
import 'package:pharmy_driver/translations.dart';
import '../../../../core/app_enum.dart';
import '../../../../core/app_router/app_router.dart';
import '../../../../core/services/services_locator.dart';
import '../../../app_widgets/custom_error_screen.dart';
import '../../../app_widgets/dialog/error_dialog.dart';
import '../../../app_widgets/dialog/loading_dialog.dart';
import '../../home/widgets/cutsom_home_shimmer.dart';
import '../widgets/order_info_column.dart';

class OrderDetailsScreen extends StatelessWidget {
  final int id;
  final bool isHome;

  const OrderDetailsScreen({
    super.key,
    required this.id,
    this.isHome = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderCubit>(
      create: (context) => sl<OrderCubit>()..getOrderDetails(id),
      child: OrderDetailsBody(id: id, isHome: isHome),
    );
  }
}

class OrderDetailsBody extends StatelessWidget {
  final bool isHome;
  final int id;

  const OrderDetailsBody({Key? key, this.isHome = false, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseScaffold(
        isBack: true,
        title: AppLocalizations.of(context)!.order_details,
        child: BlocConsumer<OrderCubit, OrderStates>(
          listener: (context, state) {
            if (state.isLoadingAccept) {
              LoadingDialog().openDialog(context);
            } else {
              LoadingDialog().closeDialog(context);
            }
            if (state.errorAccept != "") {
              ErrorDialog.openDialog(context, state.errorAccept);
            }
            if (state.isSuccessAccept) {
              AppRouter.pop(context);
            }
            if (state.isLoadingUpdate) {
              LoadingDialog().openDialog(context);
            } else {
              LoadingDialog().closeDialog(context);
            }
            if (state.errorUpdate != "") {
              ErrorDialog.openDialog(context, state.errorUpdate);
            }
            if (state.isSuccessUpdate) {
              AppRouter.pop(context);
            }
          },
          builder: (context, state) {
            if (state.screenState == ScreenState.loading) {
              return const CustomHomeShimmer();
            }
            if (state.screenState == ScreenState.error) {
              return CustomErrorScreen(
                titleError: state.error,
                onTap: () {
                  sl<OrderCubit>().getOrderDetails(id);
                },
              );
            }
            if (state.screenState == ScreenState.success) {
              return Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: PaddingApp.p22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OrderInfoWidget(
                            isHome: isHome,
                            orderDetailsModel: state.orderDetailsModel!),
                        if (!isHome)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: PaddingApp.p25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    // width: 0.35.sw,
                                    label: AppLocalizations.of(context)!
                                        .contact_client,
                                    fillColor: ColorManager.primaryGreen,
                                    labelColor: Colors.white,
                                    onTap: () {

                                      launchPhoneCall(state.orderDetailsModel?.userPhone??"");
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: PaddingApp.p10),
                                    child: CustomButton(
                                      // width: 0.35.sw,
                                      isFilled: true,
                                      label: AppLocalizations.of(context)!
                                          .contact_pharmy_team,
                                      fillColor: Colors.white,
                                      labelColor: ColorManager.primaryGreen,
                                      borderColor: ColorManager.primaryGreen,
                                      onTap: () {
                                        launchPhoneCall(context.read<SettingBloc>().settingModel?.data?.phone??"");
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        UserInfoWidget(isHome: isHome),
                        OrderExpandedCard(
                            isHome: isHome,
                            orderDetailsModel:
                                state.orderDetailsModel?.orderDetails ?? []),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: PaddingApp.p16),
                          child: Center(
                              child: Text(
                            AppLocalizations.of(context)!.order_info3,
                            style: getUnderBoldStyle(
                                color: ColorManager.grayForMessage,
                                fontSize: FontSizeApp.s12),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: PaddingApp.p25),
                          child: CustomButton(
                              height: 44,
                              label: isHome
                                  ? AppLocalizations.of(context)!.order_accept
                                  : AppLocalizations.of(context)!
                                      .go_to_delivery,
                              isFilled: true,
                              fillColor: ColorManager.primaryGreen,
                              onTap: () {
                                if (isHome) {
                                  context
                                      .read<OrderCubit>()
                                      .acceptOrder(state.orderDetailsModel!.id);
                                }
                                else{
                                  context
                                      .read<OrderCubit>()
                                      .updateOrder(state.orderDetailsModel!.id);
                                }
                              },
                              styleText: getUnderBoldStyle(
                                color: Colors.white,
                                fontSize: FontSizeApp.s14,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
