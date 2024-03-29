import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterui/features/product/presentation/UI/add_product.dart';
import 'package:flutterui/features/product/presentation/UI/product_card.dart';
import 'package:flutterui/features/product/presentation/UI/product_details.dart';
import 'package:flutterui/features/product/presentation/bloc/product_bloc_bloc.dart';
import 'package:flutterui/features/product/presentation/widget/loading_widget.dart';
import 'package:flutterui/features/product/presentation/widget/message_display.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ProductBlocBloc>().add(LoadAllProductEvent());
    return Scaffold(
      body: buildBody(context),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0XFF3F51F3),
          shape: const CircleBorder(),
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return AddProduct();
          }));
        },
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 33,
          ),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: 58,
                  width: 60,
                  child: Card(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'asset/images/p.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'July 14, 2023',
                          style: TextStyle(
                            color: Color(0XFFAAAAAA),
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Text(
                              'Hello,',
                              style: TextStyle(
                                color: Color(0XFF666666),
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Text(
                              ' Etsub',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey, width: 0.5),
                  ),
                  child: const Icon(
                    Icons.notifications_active_outlined,
                    size: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Available Products',
                style: TextStyle(
                  color: Color(0XFF3E3E3E),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            buildProductList(),
          ],
        ),
      ),
    );
  }

  Widget buildProductList() {
    return SizedBox(
      height: 500,
      child: BlocBuilder<ProductBlocBloc, ProductBlocState>(
        builder: (context, state) {
          if (state is ProductBlocInitial) {
            return const MessageDisplay(
              message: 'Start searching!',
            );
          } else if (state is LoadingState) {
            return const LoadingWidget();
          } else if (state is LoadedAllProductState) {
            return SizedBox(
              height: 1000,
              child: ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (cnx, idx) {
                  final product = state.products[idx];
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
              ),
            );
          } else if (state is ErrorState) {
            return MessageDisplay(
              message: state.message,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
