import 'package:cat_flutter_journey/core/network/api_client.dart';
import 'package:cat_flutter_journey/core/network/api_handler.dart';
import 'package:cat_flutter_journey/core/network/dio_factory.dart';
import 'package:cat_flutter_journey/core/network/network_manager.dart';
import 'package:cat_flutter_journey/features/products/data/repo/product_repo.dart';
import 'package:cat_flutter_journey/features/products/logic/cubit/products_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initServiceLocator() async {
  // Network Manager
  getIt.registerLazySingleton<NetworkManager>(() => NetworkManager());

  // Dio and Apiservice
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(dio));
  getIt.registerLazySingleton<ApiHandler>(() => ApiHandler());

  // Features
  getIt.registerLazySingleton<ProductRepo>(() => ProductRepo(getIt(), getIt()));

  //cubits
  getIt.registerLazySingleton<ProductsCubit>(() => ProductsCubit(getIt()));
}
