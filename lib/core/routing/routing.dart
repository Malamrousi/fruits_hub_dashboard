import 'package:flutter/material.dart';
import 'package:furit_hub_dashbboard/core/routing/route_name.dart';
import 'package:furit_hub_dashbboard/features/add_product/presentation/view/add_product_view.dart';
import 'package:furit_hub_dashbboard/features/dashboard/presentation/view/dashboard_view.dart';
import 'package:furit_hub_dashbboard/features/orders/presentation/view/orders_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteName.dashboard:
      return MaterialPageRoute(
        builder: (_) => const DashboardView(),
      );
  case RouteName.addProduct:
      return MaterialPageRoute(
        builder: (_) => const AddProductView(),
      );
       case RouteName.orders:
      return MaterialPageRoute(
        builder: (_) => const OrdersScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Text('No Routes defied to ${settings.name}'),
        ),
      );
  }
}
