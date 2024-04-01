import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterui/features/product/domain/entity/product_entity.dart';
import 'package:flutterui/features/product/presentation/UI/dummy_data.dart';
import 'package:flutterui/features/product/presentation/UI/product_card.dart';
import 'package:flutterui/features/product/presentation/UI/product_details.dart';
import 'package:flutterui/features/product/presentation/bloc/product_bloc_bloc.dart';
import 'package:flutterui/features/product/presentation/widget/message_display.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Enter a search keyword',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final searchKeyword = _searchController.text;
                context.read<ProductBlocBloc>().add(
                      SearchProductEvent(category: searchKeyword),
                    );
                // Navigator.pop(context);
                //           context
                //             .read<ProductBlocBloc>()
                //             .add(LoadAllProductEvent());
              },
              child: Text('Search'),
            ),
            Expanded(
              child: BlocBuilder<ProductBlocBloc, ProductBlocState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is LoadedSearchedProductState) {
                    return buildProductList(state.product);
                  } else if (state is ErrorState) {
                    return MessageDisplay(
                      message: state.message,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductList(products) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return ProductDetail(
                  productId: product.id,
                );
              }),
            );
          },
          child: CardPage(
            image: product.image,
            name: product.title,
            price: product.price,
            rating: product.rating,
            category: product.category,
          ),
        );
      },
    );
  }
}
