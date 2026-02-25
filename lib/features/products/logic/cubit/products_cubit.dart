import 'package:cat_flutter_journey/core/network/api_result.dart';
import 'package:cat_flutter_journey/features/products/data/repo/product_repo.dart';
import 'package:cat_flutter_journey/features/products/data/models/products_model.dart';
import 'package:cat_flutter_journey/features/products/logic/cubit/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState<ProductModel>> {
  final ProductRepo _productRepo;

  ProductsCubit(this._productRepo) : super(ProductsState.initial());

  void emitGetProducts() async {
    emit(const ProductsState.loading());
    try {
      final response = await _productRepo.getProducts();
      response.when(
        success: (ProductModel products) {
          emit(ProductsState.success(products));
        },
        failure: (failure) {
          emit(ProductsState.error(errorMessage: failure.toString()));
        },
      );
    } catch (e) {
      emit(ProductsState.error(errorMessage: e.toString()));
    }
  }
}
