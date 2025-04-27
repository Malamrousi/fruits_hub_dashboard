import 'package:flutter/material.dart';
import 'package:furit_hub_dashbboard/core/helper/get_order_dummy_data.dart';
import 'package:furit_hub_dashbboard/core/helper/spacing.dart';
import 'package:furit_hub_dashbboard/features/orders/presentation/view/widget/filter_section.dart';
import 'package:furit_hub_dashbboard/features/orders/presentation/view/widget/orders_items_list_view.dart';

class OrderScreeViewBody extends StatelessWidget {
  const OrderScreeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const FilterSection(),
          verticalSpacing(16),
          Expanded(
              child: OrdersItemsListView(orderModels: [
            getDummyOrder(),
            getDummyOrder(),
            getDummyOrder(),
            getDummyOrder(),
          ])),
        ],
      ),
    );
  }
}
