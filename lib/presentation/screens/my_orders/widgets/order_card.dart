import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmy_driver/core/app_router/app_router.dart';
import 'package:pharmy_driver/presentation/app_widgets/custom_button.dart';
import 'package:pharmy_driver/presentation/app_widgets/image_helper_svg.dart';
import 'package:pharmy_driver/presentation/resources/assets_manager.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/font_app.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';
import 'package:pharmy_driver/presentation/resources/values_app.dart';
import 'package:pharmy_driver/presentation/screens/order_details/screens/order_details.dart';
import 'package:pharmy_driver/translations.dart';
import 'order_card_row.dart';

class OrderCardWidget extends StatelessWidget {
  final bool isHome;
  const OrderCardWidget({Key? key,  this.isHome=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 225,
      decoration: BoxDecoration(
          color: Colors.white,
       borderRadius: const BorderRadius.all(Radius.circular(6)),
       boxShadow: [
            BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0,1),
          )]
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: ColorManager.primaryGreen,
              borderRadius: BorderRadius.vertical(bottom:Radius.circular(6))
            ),
            child:Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 14),
              child: Row(
                children: [
                  SizedBox(
                    width: 0.44.sw,
                    child: OrderCardRow(
                      title:AppLocalizations.of(context)!.order_date ,
                      content:'11/01/2024' ,
                      color:Colors.white ,fontSize:FontSizeApp.s14 ,),
                  ),
               const SizedBox(width: 4,),
                  SizedBox(
                    width: 0.34.sw,
                    child: OrderCardRow(
                      title:AppLocalizations.of(context)!.order_time ,
                      content:'5:30 pm' ,
                      color:Colors.white ,fontSize:FontSizeApp.s14 ,),
                  ),
                ],
              ),
            )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:PaddingApp.p14,horizontal:PaddingApp.p10 ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(IconsManager.queen,width:23,height:19),
                      Image.asset(IconsManager.logoAppLight,width:90,height:90),
                    ],
                  ),
               //   const ImageSvgWidget(url: ImageManager.orderLogo,width:90,height:90,fit: BoxFit.cover,).buildAssetSvgImage(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OrderCardRow(title:AppLocalizations.of(context)!.order_number ,content:'F1234564',color:ColorManager.grayForMessage ,fontSize:FontSizeApp.s14 ,),
                        const SizedBox(height: PaddingApp.p4,),
                        OrderCardRow(title:AppLocalizations.of(context)!.order_location ,content:'كورنيش التجارة, حلاق الهيبة..' ,color:ColorManager.grayForMessage,fontSize:FontSizeApp.s14 ,),
                        const SizedBox(height: PaddingApp.p4,),
                        OrderCardRow(title:AppLocalizations.of(context)!.order_status ,content:'طلب سريع خلال (30 دقيقة)' ,color:ColorManager.grayForMessage,fontSize:FontSizeApp.s14 ,),
                        const SizedBox(height: PaddingApp.p4,),
                        OrderCardRow(title:AppLocalizations.of(context)!.order_total_price ,content:'200,000 ل.س' ,color:ColorManager.grayForMessage,fontSize:FontSizeApp.s14 ,),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
              isHome
              ? Padding(
            padding: const EdgeInsets.symmetric(horizontal:PaddingApp.p32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: [
                Expanded(
                  child: CustomButton(
                    width: 0.33.sw,
                    height: 35,
                    paddingText: PaddingApp.p4,
                    label: AppLocalizations.of(context)!.order_accept,
                    fillColor:ColorManager.primaryGreen ,
                    labelColor:Colors.white ,
                    styleText: getUnderBoldStyle(color: Colors.white ,fontSize: FontSizeApp.s14),
                    onTap: () {

                    },

                  ),
                ),
                  SizedBox(width:0.05.sw,),
                  Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:PaddingApp.p10),
                    child: CustomButton(
                      width: 0.33.sw,
                      height: 35,
                      paddingText: PaddingApp.p4,
                      isFilled: true,
                      label: AppLocalizations.of(context)!.show_order,
                      fillColor: Colors.white,
                      labelColor:ColorManager.primaryGreen,
                      borderColor: ColorManager.primaryGreen,
                      styleText: getUnderBoldStyle(color: ColorManager.primaryGreen,fontSize: FontSizeApp.s14),
                      onTap: () {
                        AppRouter.push(context,  OrderDetailsScreen(isHome:isHome));
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
              : Padding(
            padding: const EdgeInsets.symmetric(horizontal:PaddingApp.p10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: [
                CustomButton(
                    width: 0.25.sw,
                    height: 35,
                    paddingText: PaddingApp.p4,
                    label: AppLocalizations.of(context)!.show_order,
                    fillColor:ColorManager.primaryGreen ,
                    labelColor:Colors.white ,
                     onTap: () {
                      AppRouter.push(context, const OrderDetailsScreen());
                     },

                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:PaddingApp.p10),
                  child: CustomButton(
                      width: 0.25.sw,
                      height: 35,
                      paddingText: PaddingApp.p4,
                      isFilled: true,
                      label: AppLocalizations.of(context)!.contact_client,
                      fillColor: Colors.white,
                      labelColor:ColorManager.primaryGreen,
                       borderColor: ColorManager.primaryGreen,
                       onTap: () {},
                  ),
                ),
                CustomButton(
                    width: 0.25.sw,
                    height: 35,
                    paddingText: PaddingApp.p4,
                    isFilled: true,
                    label: AppLocalizations.of(context)!.cancel,
                    fillColor:ColorManager.redForFavorite ,
                    labelColor:Colors.white ,
                     onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: PaddingApp.p16,)
        ],
      ),
    );
  }
}