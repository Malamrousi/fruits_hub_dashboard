import 'package:flutter/material.dart';
import 'package:furit_hub_dashbboard/core/helper/extension.dart';

import 'package:furit_hub_dashbboard/core/utils/app_styles.dart';

import '../utils/color_manger.dart';

AppBar buildAppBar({required String title, required BuildContext context}) {
  {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: AppStyles.font19GrayScaleBold,
      ),
      leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorManger.grayScaleColor,
            size: 22,
          )),
    );
  }
}
