import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furit_hub_dashbboard/core/di/get_it.dart';
import 'package:furit_hub_dashbboard/core/widgets/custom_app_bar.dart';
import 'package:furit_hub_dashbboard/features/add_product/presentation/cubits/add_product/add_product_cubit.dart';
import 'package:furit_hub_dashbboard/features/add_product/presentation/view/widgets/add_product_view_body_bloc_builder.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<AddProductCubit>(),
      child: Scaffold(
        appBar: buildAppBar(title: 'Add Product', context: context),
        body: const AddProductViewBodyBlocBuilder(),
      ),
    );
  }
}
