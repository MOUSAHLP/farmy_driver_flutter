import 'package:flutter/material.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/font_app.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';
import 'package:pharmy_driver/presentation/resources/values_app.dart';
import 'package:pharmy_driver/presentation/screens/order_details/widgets/card_basket.dart';

import '../../../../models/order_details_model.dart';

bool isExpanded=false;
class OrderExpandedCard extends StatefulWidget {
  final bool isHome ;
  final List<OrderDetail> orderDetailsModel;
  const OrderExpandedCard({Key? key,  this.isHome=false,required this.orderDetailsModel}) : super(key: key);

  @override
  State<OrderExpandedCard> createState() => _OrderExpandedCardState();
}

class _OrderExpandedCardState extends State<OrderExpandedCard> {
  @override
  Widget build(BuildContext context) {
    return  Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ListTileTheme(
        tileColor: ColorManager.primaryGreen,
        contentPadding: EdgeInsets.zero,
        dense: true,
        horizontalTitleGap: 0.0,
        minLeadingWidth: 0,
        minVerticalPadding: 0,
        child: ExpansionTile(
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero,
          onExpansionChanged: (value) =>
          setState(() {
            isExpanded=value ;
          }),
          trailing:  Padding(
            padding:  const EdgeInsetsDirectional.only(end: 22.0),
            child: Container(
              color: ColorManager.primaryGreen,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(RadiusApp.r6)),
                    ),
                    child:  Icon(isExpanded?Icons.keyboard_arrow_up_rounded:Icons.keyboard_arrow_down_rounded)),
              ),
            ),
          ),
          title:Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: ColorManager.primaryGreen,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Row(
                children: [
                  Text('المتطلبات',style: getUnderBoldStyle(color: Colors.white,fontSize: FontSizeApp.s20,),),
                ],
              ),
            ),
          ),
          children: <Widget>[
            ListView.separated(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => CardBasket(isHome: widget.isHome,orderDetail: widget.orderDetailsModel[index]),
                separatorBuilder: (context, index) =>const SizedBox(height: 6,) ,
                itemCount: widget.orderDetailsModel.length),
          ],
        ),
      ),
    );
  }
}
