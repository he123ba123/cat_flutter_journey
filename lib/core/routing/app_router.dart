import 'package:cat_flutter_journey/core/di/service_locator.dart';
import 'package:cat_flutter_journey/core/routing/routes.dart';
import 'package:cat_flutter_journey/features/products/data/models/products_model.dart';
import 'package:cat_flutter_journey/features/products/logic/cubit/products_cubit.dart';
import 'package:cat_flutter_journey/features/products/presentation/screens/products_screen.dart';
import 'package:cat_flutter_journey/features/products_details/presentation/screens/product_details_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static late final GoRouter router;

  static void initRouter() {
    router = GoRouter(
      initialLocation: Routes.productsScreen,
      routes: [
        GoRoute(
          path: Routes.productsScreen,
          builder: (context, state) => BlocProvider(
            create: (context) => getIt<ProductsCubit>()..emitGetProducts(),
            child: const ProductsScreen(),
          ),
        ),
        GoRoute(
          path: Routes.productDetailsScreen,
          builder: (context, state) =>
              ProductDetailsScreen(product: state.extra as Product),
        ),
      ],
    );
  }
}
