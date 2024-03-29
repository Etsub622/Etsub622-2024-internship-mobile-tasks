import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterui/features/product/data/models/product_model.dart';
import 'package:flutterui/features/product/presentation/UI/custom_field.dart';
import 'package:flutterui/features/product/presentation/bloc/product_bloc_bloc.dart';
import 'package:flutterui/features/product/presentation/widget/loading_widget.dart';
import 'package:flutterui/features/product/presentation/widget/message_display.dart';

class AddProduct extends StatefulWidget {
  AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _catogoryController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _catogoryController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _createProduct(BuildContext context) {
    final createdProduct = ProductModel(
      image: 'https://thursdayboots.com/cdn/shop/products/1024x1024-Captain-Terracotta-1_e1d9680c-37f8-431e-9f63-b2ed20bb0969.jpg?v=1589391129&width=816',
      rating: 0,
      price: double.tryParse(_priceController.text) ?? 0,
      title: _nameController.text,
      category: _catogoryController.text,
      description: _descriptionController.text,
      id: '',
    );

    context
        .read<ProductBlocBloc>()
        .add(CreateProductEvent(product: createdProduct));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBlocBloc, ProductBlocState>(
      builder: (context, state) {
        
        if (state is LoadingState) {
          return const LoadingWidget();
        } else {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_sharp,
                            color: Color.fromARGB(255, 19, 38, 247),
                            size: 14,
                          ),
                        ),
                        const SizedBox(
                          width: 130,
                        ),
                        const Text(
                          'Add  Product',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF3E3E3E),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0XFFF3F3F3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Icon(
                              Icons.image_outlined,
                              size: 45,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'upload image',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                color: Color(0XFF3E3E3E),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'name',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF3E3E3E),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(controller: _nameController),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'category',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: Color(0XFF3E3E3E),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(controller: _catogoryController),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'price',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: Color(0XFF3E3E3E),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            controller: _priceController,
                            sign: '\$',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('description',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                color: Color(0XFF3E3E3E),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            controller: _descriptionController,
                            maxLines: 6,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        _createProduct(context);
                         ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Product Added succussfully!')));
                      context.read<ProductBlocBloc>().add(LoadAllProductEvent());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0XFF3F51F3),
                            borderRadius: BorderRadius.circular(10)),
                        width: double.infinity,
                        height: 45,
                        child: const Center(
                            child: Text('ADD',
                                style: TextStyle(color: Colors.white))),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                       onTap: () {
                          // context
                          //     .read<ProductBlocBloc>()
                          //     .add(DeleteProductEvent(id: widget.productId));
                          // Navigator.pop(context);
                        },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.3, color: Colors.red),
                            borderRadius: BorderRadius.circular(10)),
                        width: double.infinity,
                        height: 45,
                        child: const Center(
                            child: Text('DELETE',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
