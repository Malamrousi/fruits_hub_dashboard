import 'package:flutter/material.dart';
import 'package:furit_hub_dashbboard/core/utils/app_styles.dart';

import '../utils/color_manger.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled(
      {super.key,
      this.hintText,
      this.keyboardType,
      this.focusBorder,
      this.enabledBorder,
      this.hintStyle,
      this.inputTextStyle,
      this.obscureText,
      this.controller,
   
      this.fillColor,
      this.autoFocus,
      this.suffixIcon,
      this.prefixIcon,
      this.maxLines=1, this.onSaved,
      });

  final String? hintText;
  final TextInputType? keyboardType;
  final InputBorder? focusBorder;
  final InputBorder? enabledBorder;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final bool? obscureText;
  final TextEditingController? controller;

  final Color? fillColor;
  final bool? autoFocus;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;

   
final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved:onSaved ,
      maxLines: maxLines,
      keyboardType: keyboardType,
      controller: controller,
      autofocus: autoFocus ?? false,
      validator: (value) {
        if (value!.isEmpty) {
            return 'This field is required';
        }
     return null;
      },
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          filled: true,
          fillColor: fillColor ?? ColorManger.cloudWhite,
          enabledBorder: enabledBorder ?? inputBorder(),
          focusedBorder: focusBorder ?? inputBorder(),
          errorBorder: errorBorder(),
          focusedErrorBorder: errorBorder(),
          hintText: hintText,
          hintStyle: hintStyle ?? AppStyles.font15DustyGrayScaleBold),
          style: AppStyles.font13LightPrimaryColorBold,
    );
  }

  OutlineInputBorder inputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide:
          const BorderSide(color: ColorManger.dustyGray, width: .3),
    );
  }

  OutlineInputBorder errorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Colors.red, width: .8),
    );
  }
}
