import 'package:flutter/material.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/utils/app_styles.dart';
import 'custom_check_box.dart';

class IsFeaturedChecked extends StatefulWidget {
  const IsFeaturedChecked({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<IsFeaturedChecked> createState() => _IsFeaturedCheckedState();
}

class _IsFeaturedCheckedState extends State<IsFeaturedChecked> {
  bool isTermAccept = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        horizontalSpacing(16),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'is Featured Item?',
                style: AppStyles.font15DustyGrayScaleBold,
              ),
            ],
          ),
          textAlign: TextAlign.right,
        ),
const Spacer(),
        CustomCheckBox(
          onChanged: (value) {
            setState(() {
              isTermAccept = value;
              widget.onChanged(value);
            });
          },
          isChecked: isTermAccept,
        ),
      ],
    );
  }
}
