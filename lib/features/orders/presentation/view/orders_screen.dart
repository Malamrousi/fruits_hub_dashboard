import 'package:flutter/material.dart';
import 'package:furit_hub_dashbboard/core/helper/extension.dart';
import 'package:furit_hub_dashbboard/core/utils/app_styles.dart';
import 'package:furit_hub_dashbboard/features/orders/presentation/view/widget/order_scree_view_body.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Orders' ,
        style: AppStyles.font23BlackBold
        ,),
        centerTitle: true,
        leading: IconButton(
          icon:const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 24,
          
        )
        ,onPressed: () {
          context.pop();
        },
        )
      ),
      body: const OrderScreeViewBody(),
    );
  }
}