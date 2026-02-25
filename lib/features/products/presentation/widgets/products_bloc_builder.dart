import 'package:cat_flutter_journey/core/routing/routes.dart';
import 'package:cat_flutter_journey/features/products/data/models/products_model.dart';
import 'package:cat_flutter_journey/features/products/logic/cubit/products_cubit.dart';
import 'package:cat_flutter_journey/features/products/logic/cubit/products_state.dart';
import 'package:cat_flutter_journey/features/products/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductsBlocBuilder extends StatelessWidget {
  const ProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ProductsCubit, ProductsState<ProductModel>>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (products) {
              final productsList = products.products ?? [];

              return GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.65,
                ),
                itemCount: productsList.length,
                itemBuilder: (context, index) {
                  final product = productsList[index];

                  return GestureDetector(
                    onTap: () {
                      context.push(Routes.productDetailsScreen, extra: product);
                    },
                    child: ProductCard(product: product),
                  );
                },
              );
            },
            error: (errorMessage) => Center(child: Text(errorMessage)),
          );
        },
      ),
    );
  }
}
