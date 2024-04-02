import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmy_driver/cubit/home/home_cubit.dart';
import 'package:pharmy_driver/presentation/app_widgets/dialog/will_pop_scope_handler.dart';
import 'package:pharmy_driver/presentation/resources/assets_manager.dart';
import 'package:pharmy_driver/presentation/screens/orders_history/screens/orders_history_screen.dart';
import 'package:pharmy_driver/presentation/screens/home/screens/home_screen.dart';
import 'package:pharmy_driver/presentation/screens/main_screen/widget/bottom_nav_item.dart';
import 'package:pharmy_driver/presentation/screens/my_orders/screens/my_orders.dart';
import 'package:pharmy_driver/presentation/screens/my_profile/screens/my_account_screen.dart';
import 'package:pharmy_driver/translations.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../cubit/home/home_states.dart';
import '../../../app_widgets/custom_drawer.dart';
import '../../transactions/screens/transactions_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  //move to controller

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      const MyOrdersBody(),
      const TransactionsScreen(),
      const HomeScreen(),
      // const IncentivesScreen(),
      const OrdersHistoryScreen(),
      const MyAccountScreen(),
    ];
    return WillPopScope(
      onWillPop: () async {
        if (context.read<HomeCubit>().scaffoldKey.currentState?.isDrawerOpen ==
            true) {
          context.read<HomeCubit>().scaffoldKey.currentState?.closeDrawer();
        } else {
          WillPopScopeHandler.handle(context);
        }
        return false;
      },
      child: BlocBuilder<HomeCubit, HomeStates>(
        bloc: sl<HomeCubit>()..getLastOrder(),
        builder: (context, state) => Scaffold(
          key: context.read<HomeCubit>().scaffoldKey,
          drawer: const CustomAppDrawer(),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: children[context.read<HomeCubit>().currentIndex],
                ),
                Container(
                  height: 70,
                  width: 1.sw,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BottomNavItem(
                          currentIndex: context.read<HomeCubit>().currentIndex,
                          onTap: () {
                            context.read<HomeCubit>().changeIndex(0);
                          },
                          title: AppLocalizations.of(context)!.my_orders,
                          icon: IconsManager.ordersIcon,
                          index: 0),
                      BottomNavItem(
                          currentIndex: context.read<HomeCubit>().currentIndex,
                          onTap: () {
                            context.read<HomeCubit>().changeIndex(1);
                          },
                          title: AppLocalizations.of(context)!.transactions,
                          icon: IconsManager.transactionsIcon,
                          index: 1),
                      BottomNavItem(
                          currentIndex: context.read<HomeCubit>().currentIndex,
                          onTap: () {
                            context.read<HomeCubit>().changeIndex(2);
                          },
                          title: AppLocalizations.of(context)!.home,
                          icon: IconsManager.homeIcon,
                          index: 2),
                      BottomNavItem(
                          currentIndex: context.read<HomeCubit>().currentIndex,
                          onTap: () {
                            context.read<HomeCubit>().changeIndex(3);
                          },
                          title: AppLocalizations.of(context)!.order_history,
                          icon: IconsManager.ordersIcon,
                          index: 3),
                      BottomNavItem(
                          currentIndex: context.read<HomeCubit>().currentIndex,
                          onTap: () {
                            context.read<HomeCubit>().changeIndex(4);
                          },
                          title: AppLocalizations.of(context)!.profile,
                          icon: IconsManager.profileIcon,
                          index: 4),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
