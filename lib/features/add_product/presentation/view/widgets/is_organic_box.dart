import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:furit_hub_dashbboard/core/helper/spacing.dart';
import 'package:furit_hub_dashbboard/core/utils/app_styles.dart';
import 'package:furit_hub_dashbboard/features/add_product/presentation/view/widgets/custom_check_box.dart';

class IsOrganicBox extends StatefulWidget {
  const IsOrganicBox({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;
  @override
  State<IsOrganicBox> createState() => _IsOrganicBoxState();
}

class _IsOrganicBoxState extends State<IsOrganicBox> {
  bool isOrganic = false;
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
                text: 'is Organic Item?',
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
              isOrganic = value;
              widget.onChanged(value);
            });
          },
          isChecked: isOrganic,
        ),
      ],
    );
  }
}
