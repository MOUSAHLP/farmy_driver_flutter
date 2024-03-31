import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmy_driver/presentation/app_widgets/image_helper_svg.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/font_app.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';

import '../../../../cubit/bottom/bottom_bloc.dart';
import '../../../../cubit/bottom/bottom_state.dart';
import '../../../../cubit/home/home_cubit.dart';
import '../../../../cubit/home/home_states.dart';

class BottomNavItem extends StatelessWidget {
 final VoidCallback onTap;
 final String title;
 final String icon ;
 final int index ;
 final int currentIndex ;
  const BottomNavItem({Key? key, required this.onTap, required this.title, required this.icon, required this.index, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomCubit,BottomState>(
      builder:(context, state) => GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ImageSvgWidget(
              url: icon,
              height: 25,
              width: 25,
              color: ColorFilter.mode(
                  currentIndex == index
                      ? ColorManager.primaryGreen
                      : ColorManager.greyForUnSleactedItem, BlendMode.srcIn),).buildAssetSvgImage(),
            Text(title,
              style: getUnderBoldStyle(
                  color:
                  context.read<BottomCubit>().index == index
                      ? ColorManager.primaryGreen
                      : ColorManager.greyForUnSleactedItem,
                  fontSize: FontSizeApp.s12),
            )
          ],
        ),
      ),
    );
  }
}