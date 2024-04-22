import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';


import '../../../../core/services/services_locator.dart';
import '../../../../cubit/privacy_bloc/privacy_bloc.dart';
import '../../../../cubit/privacy_bloc/privacy_state.dart';
import '../../../../translations.dart';
import '../../../app_widgets/custom_error_screen.dart';
import '../../../app_widgets/custom_loading_widget.dart';
import '../../../app_widgets/screen_title.dart';
import '../../../resources/values_app.dart';


class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PrivacyBloc>(
      lazy: true,
      create: (BuildContext context) => sl<PrivacyBloc>()..getPrivacy(),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              ScreenTitleWidget(title: AppLocalizations.of(context)!.privacy_Policy,isBack:true),
              // CustomAppBarScreen(
              //   sectionName: AppLocalizations.of(context)!.privacy_Policy,
              //   isComeBack: true,
              // ),
              Padding(
                padding:  const EdgeInsets.all(PaddingApp.p20),
                child: BlocConsumer<PrivacyBloc, PrivacyState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is PrivacyError) {
                        return CustomErrorScreen(
                          onTap: () {
                            context.read<PrivacyBloc>().getPrivacy();
                          },
                        );
                      }
                      if (state is PrivacySuccess) {
                        String html =
                            context.read<PrivacyBloc>().privacyModel!.data!.html!;
                        return Center(
                          child: HtmlWidget(html),
                        );
                      }
                      return const CustomLoadingWidget();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
