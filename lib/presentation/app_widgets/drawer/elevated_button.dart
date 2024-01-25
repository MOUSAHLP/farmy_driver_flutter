import 'package:flutter/material.dart';
import 'package:pharmy_driver/presentation/resources/color_manager.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const ElevatedButtonWidget({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Column(
      children: [
        InkWell(
          onTap:onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              children: [
                Text(
                  title,
                  style: getBoldStyle(fontSize: 13, color: Colors.black),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios,
                    color: ColorManager.grayForMessage, size: 20),
              ],
            ),
          ),
        ),
        const Divider(
          color: Colors.grey,
          indent: 15,
          endIndent: 15,
        )
      ],
    );
  }
}