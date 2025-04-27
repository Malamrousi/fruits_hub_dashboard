import 'package:flutter/material.dart';
import 'package:furit_hub_dashbboard/core/helper/spacing.dart';

import '../../../../../core/utils/app_styles.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         const Icon(
          Icons.filter_alt_outlined,
          color: Colors.black,
          size: 24,
        ),
               horizontalSpacing(16),

        Text(
          'Filter',
          style: AppStyles.font16GrayScaleBold,
        ),
       
      ],
    );
  }
}