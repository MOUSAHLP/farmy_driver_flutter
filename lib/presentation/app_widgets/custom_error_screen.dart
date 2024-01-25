import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../resources/assets_manager.dart';
import 'custom_button.dart';

class CustomErrorScreen extends StatelessWidget {
  final Function()? onTap;
  const CustomErrorScreen({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Lottie.asset(LottieManager.noInternet,),
            const SizedBox(height: 20),
            CustomButton(
              onTap: (){
                onTap!();
              },
              fillColor: Colors.white,
              label: 'Retry',
              width: 200.w,
            )
          ],
        ),
      );
  }
}
