import 'package:flutter/material.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';
import 'package:pharmy_driver/presentation/resources/values_app.dart';

class OrderDetailsRow extends StatelessWidget {
  final String title;
  final String content;
  final double fontSize;
  final Color titleColor;
  final Color contentColor;
  const OrderDetailsRow({Key? key,required this.fontSize, required this.title, required this.content, required this.titleColor, required this.contentColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(content==""||content=="null"||content.isEmpty)return const SizedBox();
    return Padding(
      padding: const EdgeInsets.only(bottom: PaddingApp.p10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$title: ',style: getBold800Style(color: titleColor,fontSize:fontSize ),),
          const SizedBox(width: 2,),
          Expanded(
            child: Text(content,style: getUnderBoldStyle(color: contentColor,fontSize:fontSize ),

            ),
          ),
        ],
      ),
    );
  }
}