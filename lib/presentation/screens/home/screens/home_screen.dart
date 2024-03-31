import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/core/app_enum.dart';
import 'package:pharmy_driver/presentation/app_widgets/base_scaffold.dart';
import 'package:pharmy_driver/presentation/app_widgets/image_helper_svg.dart';
import 'package:pharmy_driver/presentation/resources/assets_manager.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/font_app.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';
import 'package:pharmy_driver/presentation/resources/values_app.dart';
import 'package:pharmy_driver/presentation/screens/home/widgets/progress_linear_indicator.dart';
import 'package:pharmy_driver/presentation/screens/my_orders/widgets/order_card.dart';
import 'package:pharmy_driver/translations.dart';

import '../../../../core/services/services_locator.dart';
import '../../../../cubit/home/home_cubit.dart';
import '../../../../cubit/home/home_states.dart';
import '../../../app_widgets/google_map.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: BlocBuilder<HomeCubit, HomeStates>(

        builder: (BuildContext context, state)
        {
          if(state.screenState ==ScreenState.loading) {
            return const CircularProgressIndicator();
          }
          if(state.screenState==ScreenState.error)
            {
              return Text(state.error);
            }
          if(state.screenState==ScreenState.success) {
            return Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: PaddingApp.p22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: SizeApp.s14,
                      ),
                      Row(
                        children: [
                          Text(
                            '${AppLocalizations.of(context)!.driver_level}: ',
                            style: getBoldStyle(
                                color: ColorManager.grayForMessage,
                                fontSize: FontSizeApp.s15),
                          ),
                          Text(
                            'متمرس',
                            style: getBoldStyle(
                                color: ColorManager.primaryGreen,
                                fontSize: FontSizeApp.s15),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: PaddingApp.p12),
                        child: ProgressLinearIndicatorWidget(),
                      ),
                      // Row(
                      //   children: [
                      //     Text(
                      //       'الجمعة',
                      //       style: getBold800Style(
                      //         color: ColorManager.grayForMessage,
                      //         fontSize: FontSizeApp.s15,
                      //       ),
                      //     ),
                      //     Text(
                      //       '11/يناير/2024',
                      //       style: getLightStyle(
                      //         color: ColorManager.grayForMessage,
                      //         fontSize: FontSizeApp.s15,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Stack(
                          alignment: AlignmentDirectional.bottomEnd, children: [
                        Container(
                            height: 200.h,
                            padding: const EdgeInsets.symmetric(
                                horizontal: PaddingApp.p5,
                                vertical: PaddingApp.p12),
                            child: Google_map()),
                        Padding(
                          padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 4, 10),
                          child: FloatingActionButton(
                            mini: true,
                            elevation: 10,
                            onPressed: () {},
                            backgroundColor: ColorManager.primaryGreen,
                            shape: const CircleBorder(),
                            child: Icon(
                              Icons.my_location,
                              size: 25.h.w,
                              color: ColorManager.white,
                            ),
                          ),
                        )
                      ]),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: PaddingApp.p12),
                      //   child: Container(
                      //     width: 0.35.sw,
                      //     decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius:
                      //           const BorderRadius.all(Radius.circular(RadiusApp.r6)),
                      //       boxShadow: [
                      //         BoxShadow(
                      //           color: Colors.black.withOpacity(0.25),
                      //           spreadRadius: 0,
                      //           blurRadius: 4,
                      //           offset: const Offset(0, 1),
                      //         )
                      //       ],
                      //     ),
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(PaddingApp.p10),
                      //       child: Row(
                      //         children: [
                      //           Text(
                      //             AppLocalizations.of(context)!.auto_accept,
                      //             style: getBold800Style(
                      //               color: ColorManager.grayForMessage,
                      //               fontSize: FontSizeApp.s15,
                      //             ),
                      //           ),
                      //           const Spacer(),
                      //           Container(
                      //             width: 18,
                      //             height: 18,
                      //             decoration: BoxDecoration(
                      //               color: ColorManager.grayForSearch,
                      //               shape: BoxShape.circle,
                      //               boxShadow: [
                      //                 BoxShadow(
                      //                   color: Colors.black.withOpacity(0.14),
                      //                   spreadRadius: 0,
                      //                   blurRadius: 7,
                      //                   offset: const Offset(3, 4),
                      //                 )
                      //               ],
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      15.verticalSpace,
                      Row(
                        children: [
                          Text(
                            '${AppLocalizations.of(context)!.all_orders}: ',
                            style: getBold800Style(
                              color: ColorManager.grayForMessage,
                              fontSize: FontSizeApp.s15,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            decoration: const BoxDecoration(
                              color: ColorManager.primaryGreen,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(RadiusApp.r22)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: SizeApp.s16,
                                  vertical: SizeApp.s5),
                              child: Row(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.refresh,
                                    style: getUnderBoldStyle(
                                      color: Colors.white,
                                      fontSize: FontSizeApp.s14,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: SizeApp.s12,
                                  ),
                                  const ImageSvgWidget(
                                    url: IconsManager.refreshIcon,
                                    width: 19,
                                    height: 19,
                                  ).buildAssetSvgImage(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              vertical: PaddingApp.p12),
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                           OrderCardWidget(isHome: true,order: state.orderList[index]),
                          separatorBuilder: (context, index) =>
                          const SizedBox(
                            height: PaddingApp.p22,
                          ),
                          itemCount: 3),
                    ],
                  ),
                ),
              ),
            );
          }
          else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
