import 'package:flutter/material.dart';
import 'package:furit_hub_dashbboard/features/orders/presentation/view/widget/filter_section.dart';

class OrderScreeViewBody extends StatelessWidget {
  const OrderScreeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(padding: 
    EdgeInsets.symmetric(horizontal: 16),
    child: Column(
     children: [
      FilterSection(),
     ],),
    );
  }
}