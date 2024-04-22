import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';



import '../../../../core/services/services_locator.dart';
import '../../../../cubit/about/about_bloc.dart';

import '../../../../cubit/about/about_state.dart';
import '../../../../translations.dart';
import '../../../app_widgets/custom_error_screen.dart';
import '../../../app_widgets/custom_loading_widget.dart';
import '../../../app_widgets/screen_title.dart';
import '../../../resources/values_app.dart';


class TermScreen extends StatelessWidget {
  const TermScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AboutBloc>(
      lazy: true,
      create: (BuildContext context) => sl<AboutBloc>()..getTerm(),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              ScreenTitleWidget(title: AppLocalizations.of(context)!.usage_guide,isBack: true,),
              Padding(
                padding: const EdgeInsets.all(PaddingApp.p20),
                child: BlocConsumer<AboutBloc, AboutState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is AboutError) {
                        return CustomErrorScreen(
                          onTap: () {
                            context.read<AboutBloc>().getTerm();
                          },
                        );
                      }
                      if (state is AboutSuccess) {
                        String html = context.read<AboutBloc>().faqModel!.data!.html!;
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
