import 'package:flutter/material.dart';
import 'package:pharmy_driver/presentation/resources/style_app.dart';
import '../resources/font_app.dart';

class AuthTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? labelWidget;
  final bool isObscure;
  final bool? readOnly;
  final Color? fillColor;
  final Color? borderColor;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final TextInputType? keyboardType;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? horizontalPadding;
  final VoidCallback? onComplete;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;
  final Function(String value)? onChanged;
  final Function(String value)? onFieldSubmitted;

  const AuthTextFormField(
      {Key? key,
        this.borderRadius,
        this.labelText,
        this.borderColor,
        this.textAlign,
        this.labelStyle,
        this.textInputAction,
        this.errorText,
        this.isObscure = false,
        this.controller,
        this.prefixIcon,
        this.horizontalPadding,
      this.suffixIcon,
      this.fillColor,
      this.hintText,
      this.hintStyle,
      this.textStyle,
      this.keyboardType,
      this.height,
        this.readOnly,
       this.onComplete,
        this.labelWidget,
        this.onChanged,
        this.onFieldSubmitted,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        minLines: 1,
        maxLines: isObscure?1:14,
        textInputAction: textInputAction??TextInputAction.next,
        textAlign: textAlign??TextAlign.center,
        onChanged:(value) {if(onChanged != null)onChanged!(value);},
        onFieldSubmitted: (value) {if(onFieldSubmitted != null)onFieldSubmitted!(value);},
        onEditingComplete:onComplete,
        readOnly: readOnly??false,
        keyboardType: keyboardType,
        style: textStyle,
        obscureText: isObscure,
        controller: controller,
        cursorColor: Colors.deepOrange,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal:horizontalPadding?? 34.0, vertical: 0),
          hintStyle: hintStyle,
          hintText: hintText,
          prefixIcon: prefixIcon,
          filled: true,
          enabled: true,
          fillColor: fillColor ?? Colors.grey.withOpacity(0.15),
          border: InputBorder.none,
            focusedErrorBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius??14.0)),
                borderSide:  BorderSide(
                  color:borderColor?? Colors.white,
                )),
            disabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(
                  color:borderColor?? Colors.grey.withOpacity(0.15),
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius:  BorderRadius.all(Radius.circular(borderRadius??14.0)),
                borderSide: BorderSide(
                  color:borderColor?? Colors.grey.withOpacity(0.15),
                )),
            focusedBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius??14.0)),
                borderSide:  BorderSide(
                  color:borderColor?? Colors.white,
                )),
            errorBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius??14.0)),
                borderSide: const BorderSide(color: Colors.red)),
          labelText:(labelWidget!=null)?null: labelText,
         // alignLabelWithHint: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label:labelWidget ,
          labelStyle:labelStyle??getRegularStyle(color: Colors.black,fontSize: FontSizeApp.s16),
          errorText: errorText,
          suffixIcon: suffixIcon,
          errorStyle: getRegularStyle(color: Colors.red,fontSize: FontSizeApp.s16),
        ),
      ),
    );
  }
}
