import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:pharmy_driver/cubit/home/home_cubit.dart';
import 'package:pharmy_driver/cubit/setting/setting_bloc.dart';
import 'package:pharmy_driver/presentation/app_widgets/image_helper_svg.dart';
import 'package:pharmy_driver/presentation/resources/assets_manager.dart';
import 'package:pharmy_driver/presentation/resources/font_app.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/app_router/app_router.dart';
import '../../../../data/data_resource/local_resource/data_store.dart';
import '../../../resources/color_manager.dart';
import '../../notification_screen/notification_screen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 158,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            ColorManager.blackGreen,
            ColorManager.primaryGreen,
            ColorManager.darkGreen
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 40,left: 22,right: 22,bottom: 17),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      child: Image.asset(
                        IconsManager.menuIcon,
                        height: 21,
                        width: 21,
                      ),
                      onTap: () {
                        context.read<HomeCubit>().scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: InkWell(
                        onTap: () {
                        AppRouter.push(context, const NotificationScreen());
                        },
                        child: Image.asset(
                          IconsManager.notificationIcon,
                          height: 17,
                          width: 17,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const ImageSvgWidget(
                      url: IconsManager.logoApp,
                      height: 31,
                      width: 31,
                    ).buildAssetSvgImage(),
                    const SizedBox(
                      width: 6,
                    ),
                    Text("فارمي",
                      style: getBoldStyle(
                          color: Colors.white, fontSize: FontSizeApp.s24),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    Uri url =
                    Uri.parse("https://wa.me/ ${context.read<SettingBloc>().settingModel?.data?.phone??""}/?text=hello");
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                  child: Image.asset(
                    IconsManager.contactIcon,
                    height: 20,
                    width: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              children: [
                Expanded(
                    child: Text('${DataStore.instance.userInfo?.firstName}',style: getBold800Style(color: Colors.white,fontSize: FontSizeApp.s13),)),
              //   Text('متصل',style: getBold800Style(color: Colors.white,fontSize: FontSizeApp.s12),),
              //   const SizedBox(width: 6,),
              //   FlutterSwitch(
              //     width:53.0,
              //     height: 19.0,
              //     padding: 3,
              //     value: true,
              //     onToggle: (bool value) {  },
              //     activeToggleColor:ColorManager.primaryGreen,
              //     activeColor: ColorManager.lightXGreen ,
              // )
              ],
            )
          ],
        ),
      ),
    );
  }
}
