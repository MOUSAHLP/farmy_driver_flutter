import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../cubit/conditions_bloc/conditions_bloc.dart';
import '../../../../cubit/conditions_bloc/conditions_state.dart';
import '../../../../translations.dart';
import '../../../app_widgets/custom_error_screen.dart';
import '../../../app_widgets/custom_loading_widget.dart';
import '../../../app_widgets/screen_title.dart';
import '../../../resources/values_app.dart';

class ConditionsScreen extends StatelessWidget {
  const ConditionsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConditionsBloc>(
      lazy: true,
      create: (BuildContext context) =>
          sl<ConditionsBloc>()..GetConditions(),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              ScreenTitleWidget(title: AppLocalizations.of(context)!.terms_and_Conditions,isBack: true,),

              Padding(
                padding:  EdgeInsets.all(PaddingApp.p20),
                child: BlocConsumer<ConditionsBloc, ConditionsState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is ConditionsError) {
                        return CustomErrorScreen(
                          onTap: () {
                            context.read<ConditionsBloc>().GetConditions();
                          },
                        );
                      }
                      if (state is ConditionsSuccess) {
                        String html = context
                            .read<ConditionsBloc>()
                            .conditionModel!
                            .data!
                            .html!;
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
