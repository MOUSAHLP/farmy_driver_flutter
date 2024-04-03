import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmy_driver/core/app_router/app_router.dart';
import 'package:pharmy_driver/presentation/app_widgets/drawer/elevated_button.dart';
import 'package:pharmy_driver/presentation/screens/orders_history/screens/orders_history_screen.dart';
import 'package:pharmy_driver/presentation/screens/settings/screens/settings_screen.dart';
import 'package:pharmy_driver/translations.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/style_app.dart';
import 'dialog/logout_confirmation_dialog.dart';

class CustomAppDrawer extends StatelessWidget {
  const CustomAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Drawer(
          width: 263,
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 73,
                        ),
                        Container(
                          height: 142,
                          width: 142,
                          decoration: const BoxDecoration(
                            color: ColorManager.lightGray,
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Center(
                                  child: SvgPicture.asset(
                                IconsManager.logoApp,
                                width: 50,
                                height: 50,
                                colorFilter: const ColorFilter.mode(
                                    Color(0xff99B990), BlendMode.srcIn),
                              ))),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        //  sl<AuthenticationBloc>().loggedIn?
                        Text(
                          "UserName",
                          //   "${context.read<AuthenticationBloc>().loginResponse!.firstName} ${context.read<AuthenticationBloc>().loginResponse!.lastName}",
                          style: getMediumStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        //:const SizedBox(),
                        const SizedBox(
                          height: 21,
                        ),
                        const Divider(
                          color: Colors.grey,
                          indent: 15,
                          endIndent: 15,
                        ),
                        ElevatedButtonWidget(
                            title: AppLocalizations.of(context)!.settings,
                            onTap: () {
                              AppRouter.push(context, const SettingScreen());
                            }),
                        ElevatedButtonWidget(
                            title: AppLocalizations.of(context)!.orders_date,
                            onTap: () {
                              AppRouter.push(
                                  context, const OrdersHistoryScreen());
                              //AppRouter.push(context, const AllInvoicesScreen());
                            }),
                        ElevatedButtonWidget(
                            title: AppLocalizations.of(context)!.contact_us,
                            onTap: () {
                              //AppRouter.push(context, const AllInvoicesScreen());
                            }),
                        ElevatedButtonWidget(
                            title: AppLocalizations.of(context)!.usage_guide,
                            onTap: () {
                              //AppRouter.push(context, const AllInvoicesScreen());
                            }),
                        //  sl<AuthenticationBloc>().loggedIn?
                        ElevatedButtonWidget(
                            title: AppLocalizations.of(context)!.sign_out,
                            onTap: () {

                               LogoutConfirmationDialog.handle(context);
                            }),
                        //      :ElevatedButtonWidget(
                        //     title: AppLocalizations.of(context)!.sign_in,
                        //          onTap: () {
                        // //   AppRouter.pushReplacement(context, const AccountScreen());
                        //  }),
                        const SizedBox(height: 20),

                        // const SizedBox(width:20),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
