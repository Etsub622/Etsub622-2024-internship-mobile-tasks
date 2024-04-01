import 'package:dartz/dartz.dart';
import 'package:flutterui/core/error/failures.dart';
import 'package:flutterui/features/product/data/models/product_model.dart';

abstract class ProductRepository {
  Future<Either<Failure, String>> insertProduct(ProductModel product);
  Future<Either<Failure, String>> updateProduct(ProductModel product, String id);
  Future<Either<Failure, String>> deleteProduct(String productId);
  Future<Either<Failure, ProductModel>> getProduct(String productId);
  Future<Either<Failure, List<ProductModel>>> getAllProducts();
  Future<Either<Failure, ProductModel>> getSearchedProduct(String title);

}






















