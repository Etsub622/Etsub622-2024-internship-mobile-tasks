part of 'product_bloc_bloc.dart';

@immutable
sealed class ProductBlocEvent extends Equatable {
  const ProductBlocEvent();
}

class LoadAllProductEvent extends ProductBlocEvent {
  const LoadAllProductEvent();

  @override
  List<Object?> get props => [];
}

class GetSingleProductEvent extends ProductBlocEvent {
  
  final String ProductId;
  const GetSingleProductEvent(this.ProductId);

  @override
  List<Object> get props => [];
}

class UpdateProductEvent extends ProductBlocEvent {
  final ProductModel products; 
  final String productId;
  const UpdateProductEvent({ required this.products, required this.productId,});

  @override
  List<Object> get props => [productId,products];
}



class DeleteProductEvent extends ProductBlocEvent {
  final String id;
  DeleteProductEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class CreateProductEvent extends ProductBlocEvent {
  final ProductModel product;

  CreateProductEvent({required this.product});

  @override
  List<Object> get props => [product];
}
