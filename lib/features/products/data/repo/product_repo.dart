import 'package:cat_flutter_journey/core/network/api_client.dart';
import 'package:cat_flutter_journey/core/network/api_handler.dart';
import 'package:cat_flutter_journey/core/network/api_result.dart';
import 'package:cat_flutter_journey/features/products/data/models/products_model.dart';

class ProductRepo {
  final ApiClient _apiClient;
  final ApiHandler _apiHandler;

  ProductRepo(this._apiClient, this._apiHandler);

  Future<ApiResult<ProductModel>> getProducts() async {
    final result = await _apiHandler.makeRequest<ProductModel>(
      () => _apiClient.getProducts(),
    );
    return result.when(
      success: (data) {
        return ApiResult.success(data);
      },
      failure: (failure) {
        return ApiResult.failure(failure);
      },
    );
  }
}