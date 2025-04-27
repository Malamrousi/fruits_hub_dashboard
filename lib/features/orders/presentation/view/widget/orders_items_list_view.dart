
import 'package:flutter/material.dart';
import 'package:furit_hub_dashbboard/features/orders/presentation/view/widget/order_item.dart';

import '../../../domain/entities/order_entity.dart';

class OrdersItemsListView extends StatelessWidget {
  const OrdersItemsListView({super.key, required this.orderEntity});

  final List<OrderEntity> orderEntity;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderEntity.length,
      itemBuilder: (context, index) {
        return OrderItemWidget(orderEntity: orderEntity[index]);
      },
    );
  }
}
