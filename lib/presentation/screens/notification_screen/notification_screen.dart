import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pharmy_driver/presentation/screens/notification_screen/widgets/card_notification.dart';

import '../../../core/services/services_locator.dart';
import '../../../cubit/notification/notification_bloc.dart';
import '../../../cubit/notification/notification_state.dart';
import '../../../translations.dart';
import '../../app_widgets/custom_error_screen.dart';
import '../../app_widgets/custom_loading_widget.dart';
import '../../app_widgets/custom_no_dataa.dart';
import '../../app_widgets/screen_title.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationBloc>(
        child: const NotificationScreenBody(),
        create: (context) {

            return   sl<NotificationBloc>()
              ..getNotificationList();
          });
  }
}

class NotificationScreenBody extends StatefulWidget {
  const NotificationScreenBody({super.key});

  @override
  State<NotificationScreenBody> createState() => _NotificationScreenBodyState();
}

class _NotificationScreenBodyState extends State<NotificationScreenBody>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    context.read<NotificationBloc>().tabController =
        TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(

          children: [
            ScreenTitleWidget(title: AppLocalizations.of(context)!.notification,isBack:true)
,
          Expanded(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 1,
                      ),

                      Expanded(
                        child: BlocBuilder<NotificationBloc,NotificationState>(
                        builder: (context, state) {
                          if(state is NotificationLoading) {
                            return const Center(child: CustomLoadingWidget());
                          }
                          if(state is NotificationError) {
                            return Center(
                              child: CustomErrorScreen(
                                onTap: () {
                                  context.read<NotificationBloc>().getNotificationList();
                                },
                              ),
                            );
                          }
                          if(state is NotificationSuccess) {
                            return Column(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 28),
                                    child: context
                                        .read<NotificationBloc>().listNotification.isNotEmpty? ListView.builder(
                                      itemBuilder: (context, index) =>
                                       Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8),
                                        child: CardNotification(notificationModel: context
                                            .read<NotificationBloc>().listNotification[index]),
                                      ),
                                      itemCount: context
                                          .read<NotificationBloc>().listNotification.length,
                                    )
                                     :  CustomNoData(noDataStatment: AppLocalizations.of(context)!.no_notifications,)
                                  ),
                                )
                              ],
                            );
                          }
                          else {
                            return const SizedBox();
                          }
                        },
            ),
                      ),
                    ],
                  ),
                )
          ],
        ),
      ),
    );
  }
}
