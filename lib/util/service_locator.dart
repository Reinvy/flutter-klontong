import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:klontong/data/remote/category_remote_data.dart';
import 'package:klontong/data/remote/product_remote_data.dart';

import '../provider/product_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Data Sources
  sl.registerLazySingleton(() => ProductRemoteData(sl()));
  sl.registerLazySingleton(() => CategoryRemoteData(sl()));

  // Providers
  sl.registerLazySingleton(() => ProductProvider(sl(), sl()));

  // Other
  sl.registerLazySingleton<Dio>(() => Dio());
}
