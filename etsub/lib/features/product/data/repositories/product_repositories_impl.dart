import 'package:dartz/dartz.dart';
import 'package:flutterui/core/error/exceptions.dart';
import 'package:flutterui/core/error/failures.dart';
import 'package:flutterui/core/network/network_info.dart';
import 'package:flutterui/features/product/data/datasources/product_remote_data_sources.dart';
import 'package:flutterui/features/product/data/models/product_model.dart';
import 'package:flutterui/features/product/domain/repositories/product_repositories.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});

// getroduct implementation
  @override
  Future<Either<Failure, ProductModel>> getProduct(String productId) async {
    if (true) {
      try {
        final res = await remoteDataSource.getProduct(productId);
        return Right(res);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

// insertProduct implementation
  @override
  Future<Either<Failure, String>> insertProduct(ProductModel product) async {
    try {
      final res = await remoteDataSource.insertProduct(product);
      return Right(res);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

// updateProduct implementation
  @override
  Future<Either<Failure, String>> updateProduct(ProductModel product,String id) async {
    try {
      final res = await remoteDataSource.updateProduct(product,id);
      return Right(res);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

// getAllProduct implementation

  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    if (true) {
      try {
        final res = await remoteDataSource.getAllProducts();
        return Right(res);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  // deleteProduct implementation
  @override
  Future<Either<Failure, String>> deleteProduct(String productId) async {
    try {
      final res = await remoteDataSource.deleteProduct(productId);
      return Right(res);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
