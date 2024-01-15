import 'package:flutter/material.dart';


// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.w,
    required this.color,
    required this.text,
    required this.textStyle,
    this.h,
    required this.onPressed,
    this.radius,
    this.borderSideColor,
    this.rowChild,
    this.mainAxisAlignment
  });
  final double? w;
  double? radius;
  final double? h;
  final Color color;
  final Color? borderSideColor;
  final TextStyle textStyle;
  final String text;
  final VoidCallback onPressed;
  final Widget? rowChild;
  final  MainAxisAlignment? mainAxisAlignment;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      width: w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 14), // Set the border radius to 50 to make it circular
          ),
          backgroundColor: color,
          side: BorderSide(
            color: borderSideColor??color,
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: mainAxisAlignment?? MainAxisAlignment.center,
          children: [
            if(rowChild!=null)rowChild!,
            const SizedBox(width: 8,),
            Text(
              text,
              style: textStyle,
              textAlign:  TextAlign.center,
            ),
          ],
        ),
      ),
      );
  }
}
