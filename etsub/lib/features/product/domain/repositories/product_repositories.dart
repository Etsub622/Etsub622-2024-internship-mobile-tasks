import 'package:dartz/dartz.dart';
import 'package:flutterui/core/error/failures.dart';
import 'package:flutterui/features/product/data/models/product_model.dart';

abstract class ProductRepository {
  Future<Either<Failure, String>> insertProduct(ProductModel product);
  Future<Either<Failure, String>> updateProduct(ProductModel product, String id);
  Future<Either<Failure, String>> deleteProduct(String productId);
  Future<Either<Failure, ProductModel>> getProduct(String productId);
  Future<Either<Failure, List<ProductModel>>> getAllProducts();

}























// class ProductRepositoryImpl implements ProductRepository {
//   final InsertProduct insertProductUseCase;
//   final UpdateProduct updateProductUseCase;
//   final DeleteProduct deleteProductUseCase;
//   final GetProduct getProductUseCase;

//   ProductRepositoryImpl({
//     required this.insertProductUseCase,
//     required this.updateProductUseCase,
//     required this.deleteProductUseCase,
//     required this.getProductUseCase,
//   });

//   @override
//   Future<Either<Failure, void>> insertProduct(Product product) async {
//     return await insertProductUseCase(product);
//   }

//   @override
//   Future<Either<Failure, void>> updateProduct(Product product) async {
//     return await updateProductUseCase(product);
//   }

//   @override
//   Future<Either<Failure, void>> deleteProduct(int productId) async {
//     return await deleteProductUseCase(productId);
//   }

//   @override
//   Future<Either<Failure, Product>> getProduct(int productId) async {
//     return await getProductUseCase(productId);
//   }
// }