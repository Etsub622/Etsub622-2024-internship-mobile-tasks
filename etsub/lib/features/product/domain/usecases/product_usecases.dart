import 'package:dartz/dartz.dart';
import 'package:flutterui/core/error/failures.dart';
import 'package:flutterui/core/usecases/usecases.dart';
import 'package:flutterui/features/product/data/models/product_model.dart';
import 'package:flutterui/features/product/domain/entity/product_entity.dart';
import 'package:flutterui/features/product/domain/repositories/product_repositories.dart';

// InsertProduct usecase
class InsertProduct implements UseCase<String, InsertProductParams> {
  final ProductRepository repository;
  InsertProduct(this.repository);

  @override
  Future<Either<Failure, String>> call(InsertProductParams params) async {
    return await repository.insertProduct(params.product);
  }
}

class InsertProductParams {
  final ProductModel product;

  InsertProductParams(this.product);
}

// GetProduct usecase


// GetAllProduct usecase
class GetAllProducts implements UseCase<List<Product>, NoParams> {
  final ProductRepository repository;
  GetAllProducts(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) async {
    return await repository.getAllProducts();
  }
}

class NoParams {
  NoParams();
}

// UpdateProduct usecase
class UpdateProduct implements UseCase<String, UpdateProductParams> {
  final ProductRepository repository;
  UpdateProduct(this.repository);

  @override
  Future<Either<Failure, String>> call(UpdateProductParams params) async {
    return await repository.updateProduct(params.product, params.id);
  }
}

class UpdateProductParams {
  final ProductModel product;
  final String id;
  UpdateProductParams(this.product, this.id);
}

// DeleteProduct usecase
class DeleteProduct implements UseCase<String, DeleteProductParams> {
  final ProductRepository repository;
  DeleteProduct(this.repository);

  @override
  Future<Either<Failure, String>> call(DeleteProductParams params) async {
    return await repository.deleteProduct(params.productId);
  }
}

class DeleteProductParams {
  final String productId;
  DeleteProductParams(this.productId);
}

class GetProduct implements UseCase<Product, GetProductParams> {
  final ProductRepository repository;
  GetProduct(this.repository);

  @override
  Future<Either<Failure, Product>> call(GetProductParams params) async {
    return await repository.getProduct(params.ProductId);
  }
}

class GetProductParams {
  final String ProductId;
  GetProductParams(this.ProductId);
}




class GetSeachedProduct implements UseCase<Product, GetSearchedProductParams> {
  final ProductRepository repository;
  GetSeachedProduct(this.repository);

  @override
  Future<Either<Failure, Product>> call(GetSearchedProductParams params) async {
    return await repository.getSearchedProduct(params.title);
  }
}

class GetSearchedProductParams {
  final String title;
  GetSearchedProductParams(this.title);
}
