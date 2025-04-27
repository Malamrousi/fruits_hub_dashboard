import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furit_hub_dashbboard/core/helper/get_order_dummy_data.dart';
import 'package:furit_hub_dashbboard/features/orders/presentation/cubit/fetch_order/fetch_order_cubit.dart';
import 'package:furit_hub_dashbboard/features/orders/presentation/view/widget/order_scree_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrderViewBodyBlocBuilder extends StatefulWidget {
  const OrderViewBodyBlocBuilder({super.key});

  @override
  State<OrderViewBodyBlocBuilder> createState() => _OrderViewBodyBlocBuilderState();
}

class _OrderViewBodyBlocBuilderState extends State<OrderViewBodyBlocBuilder> {

  @override
  void initState() {
    super.initState();
    context.read<FetchOrderCubit>().fetchOrders();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrderCubit, FetchOrderState>(
      builder: (context, state) {
        if (state is FetchOrderFailure) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is FetchOrderSuccess) {
          return OrderScreeViewBody(
            orderEntity: state.orders,
          );
        } else {
          return Center(
            child: Skeletonizer(
                child: OrderScreeViewBody(orderEntity: [
              getDummyOrder(),
              getDummyOrder(),
            ])),
          );
        }
      },
    );
  }
}
