import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   Future.delayed(const Duration(seconds: 4), () async {
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  //       return const MainScreen();
  //     }));
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      color: ColorManager.primaryGreen,
      child: Image.asset(LottieManager.logoSplash),
    );
  }
}
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 1.sw,
//       height: 1.sh,
//       color: ColorManager.primaryGreen,
//       child: Image.asset(LottieManager.logoSplash),
//     );
//   }
// }