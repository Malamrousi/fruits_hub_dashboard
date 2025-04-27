import 'package:flutter/material.dart';
import 'package:furit_hub_dashbboard/core/helper/extension.dart';
import 'package:furit_hub_dashbboard/core/routing/route_name.dart';
import 'package:furit_hub_dashbboard/core/utils/app_styles.dart';
import 'package:furit_hub_dashbboard/core/widgets/custom_button.dart';


class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
       children: [
        CustomButton(
          title: 'Add Product',
          onPressed: () {
            context.pushNamed(RouteName.addProduct);
          },
          textStyle: AppStyles.font16WhiteBold,
        ),
         CustomButton(
          title: 'view orders',
          onPressed: () {
            context.pushNamed(RouteName.orders);
          },
          textStyle: AppStyles.font16WhiteBold,
        ),
      ]),
    );
  }
}
