import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furit_hub_dashbboard/core/func/build_error_app_bar.dart';
import 'package:furit_hub_dashbboard/core/helper/extension.dart';
import 'package:furit_hub_dashbboard/features/add_product/presentation/cubits/add_product/add_product_cubit.dart';
import 'package:furit_hub_dashbboard/features/add_product/presentation/view/widgets/add_product_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddProductViewBodyBlocBuilder extends StatelessWidget {
  const AddProductViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          buildBar(context, 'Product added successfully');
          context.pop();
        } else if (state is AddProductFailure) {
          buildBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is AddProductLoading,
            child: const AddProductViewBody());
      },
    );
  }
}
