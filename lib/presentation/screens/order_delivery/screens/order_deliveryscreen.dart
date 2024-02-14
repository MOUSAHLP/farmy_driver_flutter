import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:pharmy_driver/presentation/app_widgets/base_scaffold.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/screens/Order_delivery/widgets/google_map.dart';
import 'package:pharmy_driver/translations.dart';
// import 'package:flutter_swipe_button/flutter_swipe_button.dart';
// import 'package:lite_rolling_switch/lite_rolling_switch.dart';
//import 'package:slide_action/slide_action.dart';

class Order_deliveryScreen extends StatelessWidget {
  const Order_deliveryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseScaffold(
          isBack: true,
          title: AppLocalizations.of(context)!.order_delivery,
          child: Expanded(
              child: Stack(
                  // alignment: AlignmentDirectional.bottomEnd,
                  children: [
                Google_map(),
                Positioned(
                  bottom: 12.h,
                  left: 20,
                  right: 20,
                  child: LiteRollingSwitch(
                    onTap: () {},width: 90.w,
                    onSwipe: () {},
                    onDoubleTap: () {},
                    value: true,
                    animationDuration: const Duration(seconds: 2),
                    textOn: 'تم التوصيل',
                    textOff: 'تم التوصيل',
                    colorOn: Colors.redAccent,
                    colorOff: ColorManager.primaryGreen,
                    iconOn: Icons.double_arrow_outlined,
                    iconOff: Icons.double_arrow_outlined,
                    onChanged: (bool state) {},
                  ),
                ),
              ]))),
    );
  }
}
