import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/core/services/services_locator.dart';
import 'package:pharmy_driver/cubit/location/location_cubit.dart';
import 'package:pharmy_driver/cubit/order/order_cubit.dart';
import 'package:pharmy_driver/presentation/app_widgets/base_scaffold.dart';
import 'package:pharmy_driver/presentation/app_widgets/google_map2.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/screens/home/screens/home_screen.dart';
import 'package:pharmy_driver/presentation/screens/main_screen/screen/main_screen.dart';
import 'package:pharmy_driver/presentation/screens/order_details/screens/order_details.dart';
import 'package:pharmy_driver/presentation/screens/orders_history/widgets/circular_container.dart';
import 'package:pharmy_driver/translations.dart';
import '../../../../core/app_router/app_router.dart';
import '../../../../cubit/order_delivery/order_delivery_cubit.dart';
import '../../../../cubit/order_delivery/order_delivery_state.dart';
import '../../../app_widgets/google_map.dart';
import 'package:slide_to_act/slide_to_act.dart';
import '../../../resources/font_app.dart';
import '../../../resources/style_app.dart';

class OrderDeliveryScreen extends StatefulWidget {
  final int idOrder;
  final OrderCubit orderCubit;

  const OrderDeliveryScreen(
      {Key? key, required this.idOrder, required this.orderCubit})
      : super(key: key);

  @override
  State<OrderDeliveryScreen> createState() => _OrderDeliveryScreenState();
}

class _OrderDeliveryScreenState extends State<OrderDeliveryScreen> {
  @override
  void initState() {
    sl<LocationCubit>().getLatAndLng();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OrderDeliveryCubit(),
      child: BlocConsumer<OrderDeliveryCubit, OrderDeliveryState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          OrderDeliveryCubit cubit = OrderDeliveryCubit.get(context);
          return Scaffold(
            body: BaseScaffold(
              isBack: true,
              title: AppLocalizations.of(context)!.order_delivery,
              child: Expanded(
                child: Stack(
                  children: [
                    MapGoogle2(
                      orderCubit: widget.orderCubit,
                      trackingUrl: widget.orderCubit.state.trackingUrl,
                      id: widget.idOrder,
                    ),
                    PositionedDirectional(
                      bottom: 100.h,
                      child: Container(
                        width: 1.sw,
                        height: 45.h,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SlideAction(
                          enabled: true,
                          sliderButtonIconPadding: 6,
                          sliderButtonIcon: const Icon(
                            Icons.double_arrow_outlined,
                            color: ColorManager.primaryGreen,
                          ),
                          text: '${AppLocalizations.of(context)?.delivered}',
                          textStyle: getBold800Style(
                            color: ColorManager.white,
                            fontSize: FontSizeApp.s15.sp,
                          ),
                          outerColor: cubit.isDelivery
                              ? const Color(0xFFFF7E7E)
                              : Colors.green,
                          sliderRotate: false,
                          borderRadius: 10,
                          onSubmit: () {
                            cubit.delivery();
                            return showDialog(
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
                                          color: ColorManager.grayForMessage,
                                          fontSize: FontSizeApp.s15,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        " 200,000 ل.س",
                                        style: getBoldStyle(
                                          color: ColorManager.primaryGreen,
                                          fontSize: FontSizeApp.s26.sp,
                                        ),
                                      ),
                                      Text(
                                        "اضغط تم الدفع بعد الانتهاء من عملية الدفع",
                                        style: getBold800Style(
                                          color: ColorManager.grayForMessage,
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
                                                              FontSizeApp.s15),
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
                                                        // context.read<HomeCubit>().currentIndex = 2;
                                                        // context.read<HomeCubit>().scaffoldKey = GlobalKey<ScaffoldState>();
                                                        //  AppRouter.pushReplacement(context, MainScreen());
                                                        sl<OrderCubit>().getOrder();
                                                        AppRouter.pop(context);
                                                        AppRouter.pop(context);
                                                        AppRouter.pop(context);


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
                          },
                        ),
                      ),
                    ),
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
