import 'package:cat_flutter_journey/core/helpers/extensions.dart';
import 'package:cat_flutter_journey/features/products/data/models/products_model.dart';
import 'package:cat_flutter_journey/features/products_details/presentation/widgets/bottom_nav_bar.dart';
import 'package:cat_flutter_journey/features/products_details/presentation/widgets/description_section.dart';
import 'package:cat_flutter_journey/features/products_details/presentation/widgets/image_with_stack_section.dart';
import 'package:cat_flutter_journey/features/products_details/presentation/widgets/product_info_section.dart';
import 'package:cat_flutter_journey/features/products_details/presentation/widgets/reviews_section.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageWithStackSection(product: product),
              16.ph,
              ProductInfoSection(product: product),
              16.ph,
              DescriptionSection(product: product),
              24.ph,
              ReviewsSection(product: product),
              100.ph,
            ],
          ),
        ),
      ),
    );
  }
}
