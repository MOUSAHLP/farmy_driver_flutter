import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmy_driver/core/app_router/app_router.dart';
import 'package:pharmy_driver/core/launcher.dart';
import 'package:pharmy_driver/presentation/app_widgets/custom_button.dart';
import 'package:pharmy_driver/presentation/app_widgets/image_helper_svg.dart';
import 'package:pharmy_driver/presentation/resources/assets_manager.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/font_app.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';
import 'package:pharmy_driver/presentation/resources/values_app.dart';
import 'package:pharmy_driver/presentation/screens/order_details/screens/order_details.dart';
import 'package:pharmy_driver/translations.dart';
import '../../../../cubit/home/home_cubit.dart';
import '../../../../models/order_model.dart';
import 'order_card_row.dart';

class OrderCardWidget extends StatelessWidget {
  final bool isHome;
  final bool isAssign;
final OrderModel order;
   const OrderCardWidget({Key? key,
     this.isHome = false,
     this.isAssign = false,
     required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      // height: 220.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(6),
            bottomRight: Radius.circular(6),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 1),
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Container(
              decoration: const BoxDecoration(
                  color: ColorManager.primaryGreen,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(6))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 14),
                child: Row(
                  children: [
                    SizedBox(

                      width:isAssign?0.24.sw: 0.44.sw,
                      child: OrderCardRow(
                        title: AppLocalizations.of(context)!.order_date,
                        content: isHome?order.date.toString():order.orderDate.toString(),
                        color: Colors.white,
                        fontSize: FontSizeApp.s11,
                      ),
                    ),
                    const SizedBox(width: 4),
                    SizedBox(
                      width:isAssign?0.24.sw: 0.34.sw,
                      child: OrderCardRow(
                        title: AppLocalizations.of(context)!.order_time,
                        content:isHome? order.time.toString():order.orderTime.toString(),
                        color: Colors.white,
                        fontSize: FontSizeApp.s11,
                      ),
                    ),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: PaddingApp.p14, horizontal: PaddingApp.p10),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(IconsManager.queen, width: 23, height: 19),
                    Image.asset(IconsManager.logoAppLight,
                        width: 90, height: 81),
                    const SizedBox(height: 10,)
                  ],
                ),
                //   const ImageSvgWidget(url: ImageManager.orderLogo,width:90,height:90,fit: BoxFit.cover,).buildAssetSvgImage(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OrderCardRow(
                        title: AppLocalizations.of(context)!.order_number,
                        content: order.orderNumber.toString(),
                        color: ColorManager.grayForMessage,
                        fontSize: FontSizeApp.s14,
                      ),
                      const SizedBox(height: PaddingApp.p4),
                      OrderCardRow(
                        title: AppLocalizations.of(context)!.order_location,
                        content:isHome? order.location??"":order.userAddress??"",
                        color: ColorManager.grayForMessage,
                        fontSize: FontSizeApp.s14,
                      ),
                      const SizedBox(height: PaddingApp.p4),
                      OrderCardRow(
                        title: AppLocalizations.of(context)!.order_status,
                        content: order.status.toString(),
                        color: ColorManager.grayForMessage,
                        fontSize: FontSizeApp.s14,
                      ),
                      const SizedBox(height: PaddingApp.p4),
                      // OrderCardRow(title:AppLocalizations.of(context)!.order_total_price ,content:'200,000 ل.س' ,color:ColorManager.grayForMessage,fontSize:FontSizeApp.s14 ,),
                    ],
                  ),
                )
              ],
            ),
          ),
          isHome
              ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding:  const EdgeInsets.symmetric(horizontal: PaddingApp.p12),
                      child: CustomButton(
                        // width: 0.33.sw,
                        height: 35,
                        paddingText: PaddingApp.p4,
                        label: AppLocalizations.of(context)!.order_accept,
                        fillColor: ColorManager.primaryGreen,
                        labelColor: Colors.white,
                        styleText: getUnderBoldStyle(
                            color: Colors.white, fontSize: FontSizeApp.s14),
                        onTap: () {
                          if(isAssign==true) {
                              context
                                  .read<HomeCubit>()
                                  .acceptOrderAssign(order.id);
                            } else {
                            context.read<HomeCubit>().acceptOrder(order.id)
                          ;
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: PaddingApp.p12),
                      child: CustomButton(
                        // width: 0.33.sw,
                        height: 35,
                        paddingText: PaddingApp.p4,
                        isFilled: true,
                        label: AppLocalizations.of(context)!.show_order,
                        fillColor: Colors.white,
                        labelColor: ColorManager.primaryGreen,
                        borderColor: ColorManager.primaryGreen,
                        styleText: getUnderBoldStyle(
                            color: ColorManager.primaryGreen,
                            fontSize: FontSizeApp.s14),
                        onTap: () {
                          AppRouter.push(
                              context, OrderDetailsScreen(isHome: isHome,id: order.id,));
                        },
                      ),
                    ),
                  ),
                ],
              )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: PaddingApp.p10),
                        child: CustomButton(
                          // width: 0.25.sw,
                          height: 35,
                          paddingText: PaddingApp.p4,
                          label: AppLocalizations.of(context)!.show_order,
                          fillColor: ColorManager.primaryGreen,
                          labelColor: Colors.white,
                          onTap: () {
                            AppRouter.push(
                              context,
                              OrderDetailsScreen(
                                id: order.id,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: PaddingApp.p10),
                        child: CustomButton(
                          // width: 0.25.sw,
                          height: 35,
                          paddingText: PaddingApp.p4,
                          isFilled: true,
                          label: AppLocalizations.of(context)!.contact_client,
                          fillColor: Colors.white,
                          labelColor: ColorManager.primaryGreen,
                          borderColor: ColorManager.primaryGreen,
                          onTap: () {
                            launchPhoneCall(order.userPhone ?? "");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
          const SizedBox(
            height: PaddingApp.p16,
          )
        ],
      ),
    );
  }
}
