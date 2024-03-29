import 'package:flutter/material.dart';
import 'package:flutterui/custom_field.dart';

class AddProduct extends StatefulWidget {
  AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _catogoryController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // @override
  // void dispose() {
  //   _nameController.dispose();
  //   _catogoryController.dispose();
  //   _priceController.dispose();
  //   _descriptionController.dispose();
  // }
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
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
                    borderRadius: BorderRadius.circular(12)),
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
                      Text('upload image',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF3E3E3E),
                          )),
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
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(controller: widget._nameController),
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
                    CustomTextField(controller: widget._catogoryController),
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
                      controller: widget._priceController,
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
                      controller: widget._descriptionController,
                      maxLines: 6,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0XFF3F51F3),
                    borderRadius: BorderRadius.circular(10)),
                width: double.infinity,
                height: 45,
                child: const Center(
                    child: Text('ADD', style: TextStyle(color: Colors.white))),
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
                            color: Colors.red, fontWeight: FontWeight.w500))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
