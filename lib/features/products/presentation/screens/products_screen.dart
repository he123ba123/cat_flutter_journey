import 'package:cat_flutter_journey/core/helpers/extensions.dart';
import 'package:cat_flutter_journey/features/products/presentation/widgets/category_widget.dart';
import 'package:cat_flutter_journey/features/products/presentation/widgets/products_app_bar.dart';
import 'package:cat_flutter_journey/features/products/presentation/widgets/products_bloc_builder.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              16.ph,
              const ProductsAppBar(),
              16.ph,
              const CategoryWidget(),
              16.ph,
              const ProductsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
