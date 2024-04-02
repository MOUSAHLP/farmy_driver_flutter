import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shimmer/shimmer.dart';

import '../../../resources/color_manager.dart';

class CustomHomeShimmer extends StatelessWidget {
  const CustomHomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 13),
                child: SizedBox(
                  // height: 238,
                  width: 1.sw,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemCount: 3,
                    shrinkWrap: true,

                    itemBuilder: (context, index) {
                      return  Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
                        child: Shimmer.fromColors(
                          baseColor: ColorManager.grayForPlaceholder,
                          highlightColor: const Color(0xFFe2e4e9),
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorManager.white,
                                borderRadius: BorderRadius.circular(10),
                                border: const Border(
                                  left: BorderSide(color: ColorManager.grayForMessage),
                                  right: BorderSide(color: ColorManager.grayForMessage),
                                  top: BorderSide(
                                      color: ColorManager
                                          .grayForMessage), // White border at the top
                                  bottom: BorderSide(
                                      color: ColorManager
                                          .grayForMessage), // White border at the bottom
                                )),
                            width: 1.sw,
                            height: 100,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
