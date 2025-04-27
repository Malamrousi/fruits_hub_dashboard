import 'package:flutter/material.dart';
import 'package:furit_hub_dashbboard/features/dashboard/presentation/view/widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: DashboardViewBody()),
    );
  }
}