
import 'package:flutter/material.dart';
import 'package:furit_hub_dashbboard/features/orders/presentation/view/widget/order_item.dart';

import '../../../data/models/order_model.dart';

class OrdersItemsListView extends StatelessWidget {
  const OrdersItemsListView({super.key, required this.orderModels});

  final List<OrderModel> orderModels;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderModels.length,
      itemBuilder: (context, index) {
        return OrderItemWidget(orderModel: orderModels[index]);
      },
    );
  }
}
