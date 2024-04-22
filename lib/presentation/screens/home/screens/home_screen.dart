import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/core/app_enum.dart';
import 'package:pharmy_driver/cubit/location/location_cubit.dart';
import 'package:pharmy_driver/cubit/order/order_cubit.dart';
import 'package:pharmy_driver/cubit/setting/setting_bloc.dart';
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
import 'package:socket_io_client/socket_io_client.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../cubit/home/home_cubit.dart';
import '../../../../cubit/home/home_states.dart';
import '../../../app_widgets/custom_error_screen.dart';
import '../../../app_widgets/custom_no_dataa.dart';
import '../../../app_widgets/dialog/error_dialog.dart';
import '../../../app_widgets/dialog/loading_dialog.dart';
import '../../../app_widgets/google_map.dart';
import '../widgets/cutsom_home_shimmer.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  final bool isShow = false;

  @override
  Widget build(BuildContext context) {

    return BaseScaffold(
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state.isLoadingAccept) {
            LoadingDialog().openDialog(context);
          } else {
            LoadingDialog().closeDialog(context);
          }
          if (state.errorAccept != "") {
            ErrorDialog.openDialog(context, state.errorAccept);
          }
          if(state.isSuccessAccept){

          }

        },
        builder: (BuildContext context, state) {
          if (state.screenState == ScreenState.loading) {
            return const CustomHomeShimmer();
          }
          if (state.screenState == ScreenState.error) {
            return CustomErrorScreen(titleError: state.error,onTap: (){
              sl<HomeCubit>().getLastOrder();
              sl<SettingBloc>().GetSetting();
            },);
          }
          if (state.screenState == ScreenState.success) {
            sl<LocationCubit>().getLatAndLng();
            return Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: PaddingApp.p22),
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

                      isShow
                      // ToDo Id order in google Map
                          ? Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                  Container(
                                      height: 200.h,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: PaddingApp.p5,
                                          vertical: PaddingApp.p12),
                                      child:  MapGoogle(trackingUrl:   context.read<OrderCubit>().state.trackingUrl,id: 0,orderCubit: context.read<OrderCubit>()),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 4, 10),
                                    child: FloatingActionButton(
                                      mini: true,
                                      elevation: 10,
                                      onPressed: () {},
                                      backgroundColor:
                                          ColorManager.primaryGreen,
                                      shape: const CircleBorder(),
                                      child: Icon(
                                        Icons.my_location,
                                        size: 25.h.w,
                                        color: ColorManager.white,
                                      ),
                                    ),
                                  )
                                ])
                          : const SizedBox(),

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
                          InkWell(
                            onTap: () {
                              context.read<HomeCubit>().getRefreshOrder();
                            },
                            child: Container(
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
                                 state.isLoading?const SizedBox(
                                   width: 19,
                                   height: 19,
                                   child: CircularProgressIndicator(
                                       color: Colors.white,
                                     ),
                                 ): const ImageSvgWidget(
                                      url: IconsManager.refreshIcon,
                                      width: 19,
                                      height: 19,
                                    ).buildAssetSvgImage()
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      state.orderList.isNotEmpty
                          ? ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                  vertical: PaddingApp.p12),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => OrderCardWidget(
                                  isHome: true, order: state.orderList[index]),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: PaddingApp.p22,
                                  ),
                              itemCount:state.orderList.length)
                          : const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomNoData(noDataStatment: "no order"),
                            ],
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
    );
  }
}
