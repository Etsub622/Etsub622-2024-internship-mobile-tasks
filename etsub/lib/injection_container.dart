import 'dart:async';

import 'package:flutterui/core/network/network_info.dart';
import 'package:flutterui/features/product/data/datasources/product_remote_data_sources.dart';
import 'package:flutterui/features/product/data/repositories/product_repositories_impl.dart';
import 'package:flutterui/features/product/domain/repositories/product_repositories.dart';
import 'package:flutterui/features/product/domain/usecases/product_usecases.dart';
import 'package:flutterui/features/product/presentation/bloc/product_bloc_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final sl = GetIt.instance;

Future<void> init() async {
// Features
// Bloc
  sl.registerFactory(() => ProductBlocBloc(
        getProductUsecase: sl(),
        getProductUsecases: sl(),
        updateProductUsecase: sl(),
        deleteProductUsecase: sl(),
        insertProductUsecase: sl(),
      ));

//usecases

  sl.registerLazySingleton(() => UpdateProduct(sl()));
  sl.registerLazySingleton(() => InsertProduct(sl()));
  sl.registerLazySingleton(() => GetAllProducts(sl()));
  sl.registerLazySingleton(() => GetProduct(sl()));
  sl.registerLazySingleton(() => DeleteProduct(sl()));

//Repository

  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

// Data sources

  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImp(client: sl()),
  );

// core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

// External

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnection());
}




