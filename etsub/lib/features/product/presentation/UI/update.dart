import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterui/features/product/data/models/product_model.dart';
import 'package:flutterui/features/product/presentation/UI/custom_field.dart';
import 'package:flutterui/features/product/presentation/UI/dummy_data.dart';
import 'package:file_selector/file_selector.dart' as file_selector;
import 'package:flutterui/features/product/presentation/bloc/product_bloc_bloc.dart';
import 'package:flutterui/features/product/presentation/widget/loading_widget.dart';
import 'package:flutterui/features/product/presentation/widget/message_display.dart';

class UpdateProduct extends StatefulWidget {
  final String id;
  final String name;
  final double price;
  final String description;
  final String category;

  UpdateProduct({
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.id,
  });

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;
  late TextEditingController _categoryController;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.name);
    _categoryController = TextEditingController(text: widget.category);
    _priceController = TextEditingController(text: widget.price.toString());
    _descriptionController = TextEditingController(text: widget.description);
  }

  void UpdateProduct(BuildContext context) {
    final updatedProduct = ProductModel(
        id: widget.id,
        image:
            'https://thursdayboots.com/cdn/shop/products/1024x1024-Captain-Whiskey-3.4.jpg?v=1658505769&width=816',
        rating: 0,
        price: double.tryParse(_priceController.text) ?? 0,
        title: _nameController.text,
        category: _categoryController.text,
        description: _descriptionController.text);

    context.read<ProductBlocBloc>().add(
        UpdateProductEvent(productId: widget.id, products: updatedProduct));
  }

  void reset() {
    setState(() {
      _nameController.text = widget.name;
      _priceController.text = widget.price.toString();
      _categoryController.text = widget.category;
      _descriptionController.text = widget.description;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBlocBloc, ProductBlocState>(
      listener: (context, state) {
        if (state is ProductActionSuccess) {
          context.read<ProductBlocBloc>().add(const LoadAllProductEvent());
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Product updated succussfully!')));
        }
      },
      child: BlocBuilder<ProductBlocBloc, ProductBlocState>(
        builder: (context, state) {
          if (state is ProductBlocInitial) {
            return const MessageDisplay(
              message: 'Start searching!',
            );
          } else if (state is LoadingState) {
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
                              context
                                  .read<ProductBlocBloc>()
                                  .add(GetSingleProductEvent(widget.id));
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
                            'Update Product',
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
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Icon(
                                Icons.image_outlined,
                                size: 45,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: const Text('upload image',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      color: Color(0XFF3E3E3E),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('name',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF3E3E3E),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(controller: _nameController),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('category',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF3E3E3E),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(controller: _categoryController),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('price',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF3E3E3E),
                          )),
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
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          UpdateProduct(context);
                          Navigator.of(context);
                          context
                              .read<ProductBlocBloc>()
                              .add(LoadAllProductEvent());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0XFF3F51F3),
                              borderRadius: BorderRadius.circular(10)),
                          width: double.infinity,
                          height: 45,
                          child: const Center(
                              child: Text('Update',
                                  style: TextStyle(color: Colors.white))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
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
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    super.dispose();
  }
}
