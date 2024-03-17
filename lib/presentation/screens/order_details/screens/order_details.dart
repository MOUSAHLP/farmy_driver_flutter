import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import '../../../../core/app_router/app_router.dart';
import '../widgets/order_info_column.dart';

class OrderDetailsScreen extends StatelessWidget {
  final bool isHome;

  const OrderDetailsScreen({Key? key, this.isHome = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseScaffold(
        isBack: true,
        title: AppLocalizations.of(context)!.order_details,
        child: Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: PaddingApp.p22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrderInfoWidget(isHome: isHome),
                  if (!isHome)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: PaddingApp.p25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomButton(
                            width: 0.35.sw,
                            label: AppLocalizations.of(context)!.contact_client,
                            fillColor: ColorManager.primaryGreen,
                            labelColor: Colors.white,
                            onTap: () {},
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: PaddingApp.p10),
                            child: CustomButton(
                              width: 0.35.sw,
                              isFilled: true,
                              label: AppLocalizations.of(context)!
                                  .contact_pharmy_team,
                              fillColor: Colors.white,
                              labelColor: ColorManager.primaryGreen,
                              borderColor: ColorManager.primaryGreen,
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  UserInfoWidget(isHome: isHome),
                  OrderExpandedCard(isHome: isHome),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: PaddingApp.p16),
                    child: Center(
                        child: Text(
                      AppLocalizations.of(context)!.order_info3,
                      style: getUnderBoldStyle(
                          color: ColorManager.grayForMessage,
                          fontSize: FontSizeApp.s12),
                    )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: PaddingApp.p25),
                    child: CustomButton(
                        height: 44,
                        label: isHome
                            ? AppLocalizations.of(context)!.order_accept
                            : AppLocalizations.of(context)!.go_to_delivery,
                        isFilled: true,
                        fillColor: ColorManager.primaryGreen,
                        onTap: () {
                          if (isHome) {
                            AppRouter.push(
                              context,
                              const OrderDeliveryScreen(),
                            );
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
        ),
      ),
    );
  }
}
