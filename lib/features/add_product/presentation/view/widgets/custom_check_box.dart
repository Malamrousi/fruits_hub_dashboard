import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furit_hub_dashbboard/core/utils/color_manger.dart';

import '../../../../../core/utils/app_images.dart';


class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key, required this.isChecked, required this.onChanged});
  final bool isChecked;

  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!isChecked),
      child: AnimatedContainer(
        width: 24,
        height: 24,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
        decoration: ShapeDecoration(
          color: isChecked ? ColorManger.primaryColor : ColorManger.whiteColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isChecked ? Colors.transparent : ColorManger.dustyGray,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child:isChecked? Padding(
          padding: const EdgeInsets.all(4),
          child: SvgPicture.asset(
            Assets.imagesCheck,
           
          ),
        ):const SizedBox(),
      ),
    );
  }
}
