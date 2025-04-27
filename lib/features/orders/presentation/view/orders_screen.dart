import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furit_hub_dashbboard/core/di/get_it.dart';
import 'package:furit_hub_dashbboard/core/helper/extension.dart';
import 'package:furit_hub_dashbboard/core/utils/app_styles.dart';

import '../cubit/fetch_order/fetch_order_cubit.dart';
import 'widget/order_view_body_bloc_builder.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<FetchOrderCubit>(),
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              'Orders',
              style: AppStyles.font23BlackBold,
            ),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 24,
              ),
              onPressed: () {
                context.pop();
              },
            )),
        body: const OrderViewBodyBlocBuilder(),
      ),
    );
  }
}
