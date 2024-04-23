import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/cubit/order/order_cubit.dart';
import 'package:pharmy_driver/presentation/app_widgets/image_helper_svg.dart';
import 'package:pharmy_driver/presentation/resources/assets_manager.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/font_app.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';
import 'package:pharmy_driver/presentation/resources/values_app.dart';
import '../../../../models/order_details_model.dart';
import '../../../../translations.dart';

class CardBasket extends StatelessWidget {
  final bool isHome ;
  final OrderDetail orderDetail ;
  const CardBasket({super.key,  this.isHome=false,required this.orderDetail });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 12),
      child: Container(
        height: 115,
        width: 1.sw,
        decoration: BoxDecoration(
            boxShadow: [ColorManager.shadowGaryDown],
            color: Colors.white,
            borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if(isHome==false)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(boxShadow: [
                        ColorManager.shadowGaryDown,
                      ], color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const ImageSvgWidget(url: IconsManager.checkIcon).buildAssetSvgImage(),
                      )
                    ),
                    onTap: (){
                      context.read<OrderCubit>().addProduct(orderDetail.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration:
                          const Duration(seconds: 1),
                          content: Container(
                            alignment: Alignment.center,
                            child: Text(
                              AppLocalizations.of(context)!.add_product,
                              style: getRegularStyle(
                                color: ColorManager.white,
                                fontSize: FontSizeApp.s14,
                              ),
                            ),
                          ),
                          backgroundColor:
                          ColorManager.primaryGreen,
                        ),
                      );
                    },
                  ),
                  InkWell(
                    onTap: (){
                      context.read<OrderCubit>().deleteProduct(orderDetail.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration:
                          const Duration(seconds: 1),
                          content: Container(
                            alignment: Alignment.center,
                            child: Text(
                           AppLocalizations.of(context)!.remove_product,
                              style: getRegularStyle(
                                color: ColorManager.white,
                                fontSize: FontSizeApp.s14,
                              ),
                            ),
                          ),
                          backgroundColor:
                          ColorManager.primaryGreen,
                        ),
                      );
                    },
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(boxShadow: [
                        ColorManager.shadowGaryDown,
                      ], color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: const ImageSvgWidget(url: IconsManager.closeIcon).buildAssetSvgImage(),
                      )
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(orderDetail.name??"",
                  style: getBoldStyle(
                          color: ColorManager.black, fontSize: FontSizeApp.s10)
                      ?.copyWith(height: 1),
                ),
                const SizedBox(height: 5,),
                orderDetail.attributes.isNotEmpty? SizedBox(
                  height: 25,

                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount:  orderDetail.attributes.length,
                    physics: const NeverScrollableScrollPhysics(),

                    itemBuilder: (context, index) =>Padding(
                        padding: const EdgeInsets.symmetric(vertical:2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              orderDetail
                                  .attributes[index].value??"",
                              style: getRegularStyle(
                                color: ColorManager.grayForMessage,
                                fontSize: FontSizeApp.s15,
                              )!
                                  .copyWith(height: 1),
                            ),
                            orderDetail
                                .attributes.length-1!=index?Text(
                              "/",
                              style: getRegularStyle(
                                color: ColorManager.grayForMessage,
                                fontSize: FontSizeApp.s15,
                              )!
                                  .copyWith(height: 1),
                            ):const SizedBox()

                          ],
                        )) ,),
                ):const SizedBox(),
               const SizedBox(height: 5,),
                Row(
                  children: [

                      Text(orderDetail.price??"",
                          style: getBoldStyle(
                              color: ColorManager.primaryGreen,
                              fontSize: FontSizeApp.s15)!
                              .copyWith(height: 1)),
                    const SizedBox(
                      width: 1,
                    ),
                    //todo caruncy
                   // if (productAddedToBasketDetails.price != null)
                      Text(AppLocalizations.of(context)!.currency,
                          style: getBoldStyle(
                              color: ColorManager.primaryGreen,
                              fontSize: FontSizeApp.s10)!
                              .copyWith(height: 1))
                  ],
                ),
              ],
            ),
             SizedBox(
              width: 0.03.sw,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                height: 115,
                width: 115,
                color: ColorManager.grayForPlaceholde,
                child: Padding(
                  padding: const EdgeInsets.all(PaddingApp.p22),
                  child: const ImageSvgWidget(
                    url: IconsManager.logoApp,
                    color: ColorFilter.mode(
                        Colors.grey, BlendMode.srcIn),).buildAssetSvgImage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
