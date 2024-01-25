import 'package:flutter/material.dart';
import 'package:pharmy_driver/presentation/app_widgets/screen_title.dart';
import 'package:pharmy_driver/presentation/screens/main_screen/widget/custom_app_bar.dart';

class BaseScaffold extends StatelessWidget {
  final String? title;
  final Widget child;
  const BaseScaffold({Key? key,  this.title,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(),
        if(title!=null)ScreenTitleWidget(title: title!),
        child,
      ],
    );
  }
}
