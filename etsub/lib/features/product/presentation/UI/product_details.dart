import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterui/features/product/data/models/product_model.dart';
import 'package:flutterui/features/product/presentation/UI/update.dart';
import 'package:flutterui/features/product/presentation/bloc/product_bloc_bloc.dart';
import 'package:flutterui/features/product/presentation/widget/loading_widget.dart';
import 'package:flutterui/features/product/presentation/widget/message_display.dart';

class ProductDetail extends StatefulWidget {
  final String productId;
  const ProductDetail({Key? key, required this.productId}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final List<String> sizes = const ['39', '40', '41', '42', '43', '44', '45'];
  String selectedSize = '39';

  @override
  void initState() {
    super.initState();
    context
        .read<ProductBlocBloc>()
        .add(GetSingleProductEvent(widget.productId));
  }

  void updateProduct(Map<String, Object> updatedProduct) {
    ProductModel productModel = ProductModel(
      id: widget.productId,
      title: updatedProduct['title'] as String,
      category: updatedProduct['category'] as String,
      price: updatedProduct['price'] as double,
      description: updatedProduct['description'] as String,
      image: '',
      rating: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: BlocBuilder<ProductBlocBloc, ProductBlocState>(
              builder: (context, state) {
                if (state is ProductBlocInitial) {
                  return const MessageDisplay(
                    message: 'Start searching!',
                  );
                } else if (state is LoadingState) {
                  return const LoadingWidget();
                } else if (state is LoadedSingleProductState) {
                  final products = state.product;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 286,
                        child: Image.network(
                          products.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 26.0,
                          top: 26,
                          right: 26,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(products.category,
                                  style: const TextStyle(
                                    color: Color(0xFFAAAAAA),
                                    fontFamily: 'Poppins',
                                  )),
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text(
                              products.rating.toString(),
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                color: Color(0xFFAAAAAA),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(26.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                products.title.toString(),
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              '\$${products.price}',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 26.0),
                        child: Text(
                          'Size:',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 70,
                        child: ListView.builder(
                          itemCount: sizes.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final size = sizes[index];
                            return Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(
                                    () {
                                      selectedSize = size;
                                    },
                                  );
                                },
                                child: Card(
                                  elevation: 0.6,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  color: selectedSize == size
                                      ? const Color(0XFF3F51F3)
                                      : Colors.white,
                                  child: Container(
                                    width: 60,
                                    alignment: Alignment.center,
                                    child: Text(
                                      size,
                                      style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                        color: selectedSize == size
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 26.0, right: 26),
                        child: Text(
                          products.description.toString(),
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Color(0XFF666666),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          context
                              .read<ProductBlocBloc>()
                              .add(DeleteProductEvent(id: widget.productId));
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Product Deleted succussfully!')));
                          Navigator.pop(context);
                          context
                              .read<ProductBlocBloc>()
                              .add(LoadAllProductEvent());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.3,
                                    color: Color(0XFFFF1313),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: 150,
                                height: 50,
                                child: const Center(
                                  child: Text(
                                    'DELETE',
                                    style: TextStyle(
                                      color: Color(0XFFFF1313),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return UpdateProduct(
                                          name: products.title.toString(),
                                          price: products.price,
                                          description: products.description,
                                          category: products.category,
                                          id: products.id,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0XFF3F51F3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  width: 150,
                                  height: 50,
                                  child: const Center(
                                    child: Text(
                                      'UPDATE',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (state is ErrorState) {
                  return MessageDisplay(
                    message: state.message,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          Positioned(
            left: 10,
            top: 10,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(),
                color: Colors.white,
              ),
              height: 40,
              width: 40,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    context.read<ProductBlocBloc>().add(LoadAllProductEvent());
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Color(0XFF3F51F3),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
