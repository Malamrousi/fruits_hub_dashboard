import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furit_hub_dashbboard/core/helper/spacing.dart';
import 'package:furit_hub_dashbboard/core/utils/app_styles.dart';
import 'package:furit_hub_dashbboard/core/widgets/custom_text_form_filed.dart';
import 'package:furit_hub_dashbboard/features/add_product/domain/entities/add_product_entity.dart';
import 'package:furit_hub_dashbboard/features/add_product/domain/entities/review_entity.dart';
import 'package:furit_hub_dashbboard/features/add_product/presentation/view/widgets/is_organic_box.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../cubits/add_product/add_product_cubit.dart';
import 'image_filed.dart';
import 'is_featured_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String productName, code, description;
  late num productPrice, expirationsMonth, numberOfCalories, unitAmount;
  File? image;
  bool isFeatured = false;
  bool isOrganic = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
          child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            CustomTextFormFiled(
              onSaved: (value) {
                productName = value!;
              },
              keyboardType: TextInputType.text,
              hintText: 'Product Name',
            ),
            verticalSpacing(16),
            CustomTextFormFiled(
              onSaved: (value) {
                code = value!.toLowerCase();
              },
              keyboardType: TextInputType.text,
              hintText: 'Product Code',
            ),
            verticalSpacing(16),
            CustomTextFormFiled(
              onSaved: (value) {
                productPrice = num.parse(value!);
              },
              keyboardType: TextInputType.number,
              hintText: 'Product Price',
            ),
            verticalSpacing(16),
            CustomTextFormFiled(
              onSaved: (value) {
                expirationsMonth = num.parse(value!);
              },
              keyboardType: TextInputType.number,
              hintText: 'Expirations Month',
            ),
            verticalSpacing(16),
            CustomTextFormFiled(
              onSaved: (value) {
                numberOfCalories = num.parse(value!);
              },
              keyboardType: TextInputType.number,
              hintText: 'Number Of Calories',
            ),
            verticalSpacing(16),
            CustomTextFormFiled(
              onSaved: (value) {
                unitAmount = num.parse(value!);
              },
              keyboardType: TextInputType.number,
              hintText: 'Unit Amounts',
            ),
            verticalSpacing(16),
            CustomTextFormFiled(
              onSaved: (value) {
                description = value!;
              },
              keyboardType: TextInputType.text,
              maxLines: 5,
              hintText: 'Product Description',
            ),
            verticalSpacing(16),
            IsFeaturedChecked(onChanged: (value) {
              isFeatured = value;
              setState(() {});
            }),
            verticalSpacing(16),
            IsOrganicBox(onChanged: (value) {
              isOrganic = value;
              setState(() {});
            }),
            verticalSpacing(16),
            ImageFiled(
              onFileChanged: (image) {
                this.image = image;
              },
            ),
            verticalSpacing(16),
            CustomButton(
              title: 'Add Product',
              onPressed: () {
                if (image != null) {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ProductEntity input = ProductEntity(
                        reviews: [
                          ReviewEntity(
                              name: 'Ahmed',
                              image: '',
                              ratting: 5,
                              date: DateTime.now().toIso8601String(),
                              reviewDescription: '')
                        ],
                        name: productName,
                        description: description,
                        code: code,
                        price: productPrice,
                        isFeatured: isFeatured,
                        image: image!,
                        expirationsMonths: expirationsMonth.toInt(),
                        isOrganic: isOrganic,
                        numberOfCalories: numberOfCalories.toInt(),
                        unitAmount: unitAmount.toInt());
                    context.read<AddProductCubit>().addProduct(input);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                } else {
                  showErrorBar();
                }
              },
              textStyle: AppStyles.font16WhiteBold,
            ),
            verticalSpacing(16),
          ],
        ),
      )),
    );
  }

  void showErrorBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please select product image'),
      ),
    );
  }
}
