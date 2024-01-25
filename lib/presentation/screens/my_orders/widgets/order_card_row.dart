import 'package:flutter/material.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';

class OrderCardRow extends StatelessWidget {
  final Color color;
  final String title;
  final String content;
  final double fontSize;
  const OrderCardRow({Key? key, required this.color, required this.fontSize, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$title: ',style: getUnderBoldStyle(color: color,fontSize:fontSize ),),
        const SizedBox(width: 2,),
        Expanded(
          child: Text(content,style: getRegularStyle(color: color,fontSize:fontSize ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}