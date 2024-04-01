part of 'product_bloc_bloc.dart';

@immutable
sealed class ProductBlocState extends Equatable {
  const ProductBlocState();
}

final class ProductBlocInitial extends ProductBlocState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends ProductBlocState {
  @override
  List<Object?> get props => [];
}

class LoadedAllProductState extends ProductBlocState {
  final List<Product> products;
  const LoadedAllProductState({required this.products});
  @override
  List<Object?> get props => [products];
}

class LoadedSingleProductState extends ProductBlocState {
  final Product product;
  const LoadedSingleProductState({required this.product});

  @override
  List<Object> get props => [product];
}

class ProductActionSuccess extends ProductBlocState {
  final String message;
  const ProductActionSuccess({required this.message});
  @override
  List<Object?> get props => [message];
}

class ProductActionFailure extends ProductBlocState {
  final String message;
  const ProductActionFailure({required this.message});
  @override
  List<Object?> get props => [message];
}

class ErrorState extends ProductBlocState {
  final String message;
  const ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class LoadedSearchedProductState extends ProductBlocState {
  final Product product;
  const LoadedSearchedProductState({required this.product});

  @override
  List<Object> get props => [product];
}

