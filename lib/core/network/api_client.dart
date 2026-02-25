import 'package:cat_flutter_journey/core/constants/api_constants.dart';
import 'package:cat_flutter_journey/features/products/data/models/products_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(ApiConstants.products)
  Future<ProductModel> getProducts();
}
