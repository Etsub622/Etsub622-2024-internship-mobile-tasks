import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterui/features/product/data/models/product_model.dart';
import 'package:flutterui/features/product/domain/entity/product_entity.dart';
import 'package:flutterui/features/product/domain/usecases/product_usecases.dart';
import 'package:flutterui/features/product/presentation/UI/dummy_data.dart';
import 'package:meta/meta.dart';
part 'product_bloc_event.dart';
part 'product_bloc_state.dart';

class ProductBlocBloc extends Bloc<ProductBlocEvent, ProductBlocState> {
  final GetAllProducts getProductUsecase;
  final GetProduct getProductUsecases;
  final UpdateProduct updateProductUsecase;
  final DeleteProduct deleteProductUsecase;
  final InsertProduct insertProductUsecase;
  final GetSeachedProduct getserchedusecase;

  ProductBlocBloc( 
      {required this.getProductUsecase,
      required this.getserchedusecase,
      required this.getProductUsecases,
      required this.updateProductUsecase,
      required this.deleteProductUsecase,
      required this.insertProductUsecase})
      : super(ProductBlocInitial()) {
    on<LoadAllProductEvent>((event, emit) async {
      emit(LoadingState());
      final response = await getProductUsecase(NoParams());
      response.fold((error) => emit(ErrorState(message: 'failed to fetch')),
          (products) => emit(LoadedAllProductState(products: products)));
    });

    on<GetSingleProductEvent>((event, emit) async {
      emit(LoadingState());
      final response =
          await getProductUsecases(GetProductParams(event.ProductId));
      print(response);
      response.fold(
          (error) => emit(ErrorState(message: 'faild to get product')),
          (product) => emit(LoadedSingleProductState(product: product)));
    });
  
    on<UpdateProductEvent>((event, emit) async {
      emit(LoadingState());
      final response = await updateProductUsecase(
          UpdateProductParams(event.products, event.productId));
      response.fold(
          (error) => emit(ErrorState(message: 'faild to update product')),
          (message) => emit(
              ProductActionSuccess(message: 'product updated successfully')));
    });

    on<DeleteProductEvent>((event, emit) async {
      emit(LoadingState());
      final response =
          await deleteProductUsecase(DeleteProductParams(event.id));
      response.fold(
          (error) => emit(ErrorState(message: 'faild to delete product')),
          (message) => emit(
              ProductActionSuccess(message: 'product deleted  successfully')));
    });

    on<CreateProductEvent>((event, emit) async {
      emit(LoadingState());
      final response =
          await insertProductUsecase(InsertProductParams(event.product));
      response.fold(
          (error) => emit(ErrorState(message: 'faild to insert product')),
          (message) => emit(
              ProductActionSuccess(message: 'product inserted successfully')));
    });

  on<SearchProductEvent>((event, emit) async {
    emit(LoadingState());
    final response = await getserchedusecase(GetSearchedProductParams(event.category
    ));
    response.fold(
      (error) => emit(ErrorState(message: 'Failed to search for products')),
      (product) => emit(LoadedSingleProductState(product: product)));
  
  });


  }
}
