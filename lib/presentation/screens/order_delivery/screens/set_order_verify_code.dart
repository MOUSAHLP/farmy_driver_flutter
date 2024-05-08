import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmy_driver/presentation/app_widgets/dialog/error_dialog.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../../core/app_enum.dart';
import '../../../../core/app_router/app_router.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/formatter.dart';
import '../../../../cubit/home/home_cubit.dart';
import '../../../../cubit/order/order_cubit.dart';
import '../../../../cubit/order_delivery/order_delivery_cubit.dart';
import '../../../../cubit/order_delivery/order_delivery_state.dart';
import '../../../../translations.dart';
import '../../../app_widgets/custom_button.dart';
import '../../../app_widgets/dialog/loading_dialog.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_app.dart';
import '../../../resources/style_app.dart';
import '../../orders_history/widgets/circular_container.dart';

class OrderVerifyCode extends StatefulWidget {
  final int orderId;

  OrderVerifyCode({Key? key, required this.orderId}) : super(key: key);

  @override
  _OrderVerifyCodeState createState() => _OrderVerifyCodeState();
}

class _OrderVerifyCodeState extends State<OrderVerifyCode> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // trackingBloc.add(GetVerifyCode(orderId: widget.orderId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryGreen,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1.sh,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: ColorManager.primaryGreen,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "فارمي",
                              style: getBoldStyle(
                                  color: Colors.white,
                                  fontSize: FontSizeApp.s24),
                            ),
                            const SizedBox(width: 6),
                            SvgPicture.asset(
                              IconsManager.logoApp,
                              height: 31,
                              width: 31,
                            ),
                          ],
                        ),
                      ),
                      Text(AppLocalizations.of(context)!.order_verify_code,
                          style: getBoldStyle(
                              color: ColorManager.white,
                              fontSize: FontSizeApp.s20)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(AppLocalizations.of(context)!.order_verify_code_desc,
                          textAlign: TextAlign.center,
                          style: getSemiBoldStyle(
                            color: ColorManager.white,
                            fontSize: FontSizeApp.s15,
                          ))
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 0.6.sh,
                    color: ColorManager.white,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 25.h),
                          child: Image.asset(
                            IconsManager.successIcon,
                            width: 100.w,
                            height: 100.w,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: PinFieldAutoFill(
                            controller: textEditingController,
                            decoration: BoxLooseDecoration(
                              strokeColorBuilder: const FixedColorBuilder(
                                  ColorManager.primaryGreen),
                              bgColorBuilder:
                                  const FixedColorBuilder(Colors.white),
                              textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: ColorManager.primaryGreen),
                            ),
                            currentCode: textEditingController.text,
                            codeLength: 6,
                            enabled: true,
                            onCodeChanged: (String? code) {
                              if (code != null) {
                                textEditingController.text = code;
                                if (code.length == 6) {}
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 70.h,
                        ),
                        BlocProvider(
                          create: (BuildContext context) =>
                              OrderDeliveryCubit(),
                          child: BlocConsumer<OrderDeliveryCubit,
                              OrderDeliveryState>(
                            listener: (BuildContext context, state) {
                              if (state.screenState == ScreenState.loading) {
                                LoadingDialog().openDialog(context);
                              } else if (state.screenState ==
                                  ScreenState.error) {
                                AppRouter.pop(context);
                                AppRouter.pop(context);
                                ErrorDialog.openDialog(context, state.error);
                              } else if (state.screenState ==
                                  ScreenState.success) {
                                LoadingDialog().closeDialog(context);
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            '${AppLocalizations.of(context)?.total_bill}',
                                            style: getBoldStyle(
                                              color:
                                                  ColorManager.grayForMessage,
                                              fontSize: FontSizeApp.s15,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            Formatter.formatPrice(state
                                                    .deliverOrder!
                                                    .data
                                                    .orderTotal ??
                                                0),
                                            style: getBoldStyle(
                                              color: ColorManager.primaryGreen,
                                              fontSize: FontSizeApp.s26.sp,
                                            ),
                                          ),
                                          Text(
                                            "اضغط تم الدفع بعد الانتهاء من عملية الدفع",
                                            style: getBold800Style(
                                              color:
                                                  ColorManager.grayForMessage,
                                              fontSize: FontSizeApp.s14.sp,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 18,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Text(
                                                          'تمت العملية بنجاح :)',
                                                          style: getBoldStyle(
                                                              color: ColorManager
                                                                  .primaryGreen,
                                                              fontSize:
                                                                  FontSizeApp
                                                                      .s15),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                            "يمكنك رؤية جميع الطلبات التي قمت بإتمامها من قائمة تاريخ الطلبات في المنيو",
                                                            style: getBold800Style(
                                                                color: ColorManager
                                                                    .grayForMessage,
                                                                fontSize:
                                                                    FontSizeApp
                                                                        .s14)),
                                                        const SizedBox(
                                                          height: 18,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            context
                                                                .read<
                                                                    HomeCubit>()
                                                                .getRefreshOrder();
                                                            context.read<OrderCubit>().getOrder();
                                                            AppRouter.pop(
                                                                context);
                                                            AppRouter.pop(
                                                                context);
                                                            AppRouter.pop(
                                                                context);
                                                            AppRouter.pop(
                                                                context);
                                                            AppRouter.pop(
                                                                context);
                                                          },
                                                          child: circularContainer(
                                                              circular: 15,
                                                              text: "تم",
                                                              color: ColorManager
                                                                  .primaryGreen,
                                                              textColor:
                                                                  Colors.white),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: circularContainer(
                                              circular: 15,
                                              text: "تم الدفع",
                                              color: ColorManager.primaryGreen,
                                              textColor: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                            builder: (context, state) {
                              OrderDeliveryCubit cubit =
                                  OrderDeliveryCubit.get(context);
                              return CustomButton(
                                label: AppLocalizations.of(context)!.next,
                                onTap: () {
                                  if (textEditingController.text.length == 6) {
                                    cubit.deliverOrder(
                                        idOrder: widget.orderId,
                                        code: textEditingController.text);
                                    cubit.delivery();
                                  }
                                },
                              );
                            },
                          ),
                        ),
                        // hasFocus?
                        // SizedBox(
                        //   height: 270.h,
                        // ):SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
