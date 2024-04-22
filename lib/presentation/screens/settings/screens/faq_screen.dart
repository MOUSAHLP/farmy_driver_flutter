import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';



import '../../../../core/services/services_locator.dart';
import '../../../../cubit/faq/faq_bloc.dart';
import '../../../../cubit/faq/faq_state.dart';
import '../../../../translations.dart';
import '../../../app_widgets/custom_error_screen.dart';
import '../../../app_widgets/custom_loading_widget.dart';
import '../../../app_widgets/screen_title.dart';
import '../../../resources/values_app.dart';


class FAQScreen extends StatelessWidget {
  const FAQScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FaqBloc>(
      lazy: true,
      create: (BuildContext context) => sl<FaqBloc>()..getFAQ(),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              ScreenTitleWidget(title: AppLocalizations.of(context)!.frequently_Asked_Questions,isBack: true,),
              Padding(
                padding: const EdgeInsets.all(PaddingApp.p20),
                child: BlocConsumer<FaqBloc, FAQState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is FAQError) {
                        return CustomErrorScreen(
                          onTap: () {
                            context.read<FaqBloc>().getFAQ();
                          },
                        );
                      }
                      if (state is FAQSuccess) {
                        String html = context.read<FaqBloc>().faqModel!.data!.html!;
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
