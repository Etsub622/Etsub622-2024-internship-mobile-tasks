import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final List<String> sizes = const ['39', '40', '41', '42', '43', '44', '45'];
  late String selectedSize;

  @override
  void initState() {
    selectedSize = sizes[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: double.infinity,
                    height: 286,
                    child: Image.asset(
                      'asset/images/down.jpg',
                      fit: BoxFit.cover,
                    )),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 26.0,
                    top: 26,
                    right: 26,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Men\'s shoes',
                            style: TextStyle(
                              color: Color(0xFFAAAAAA),
                              fontFamily: 'Poppins',
                            )),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        '(4.0)',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          color: Color(0xFFAAAAAA),
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(26.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Derby Leather',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        '\$120',
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
                            elevation: 0.5,
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
                const Padding(
                  padding: EdgeInsets.only(left: 26.0, right: 26),
                  child: Text(
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: Color(0XFF666666),
                          fontWeight: FontWeight.w500),
                      ' A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system,where the shoelace eyelets are sewn on top of the vamp(the upper part of the shoe).This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes.Derby shoes are typically made of high -quality leather,known for its durability and elegance,making them suitable for both formal and casual occasions.With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe'),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
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
                            borderRadius: BorderRadius.circular(10)),
                        width: 150,
                        height: 50,
                        child: const Center(
                            child: Text('DELETE',
                                style: TextStyle(
                                    color: Color(0XFFFF1313),
                                    fontWeight: FontWeight.w600))),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/addProduct');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0XFF3F51F3),
                              borderRadius: BorderRadius.circular(10)),
                          width: 150,
                          height: 50,
                          child: const Center(
                              child: Text('UPDATE',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white))),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
                      },
                      child: const Icon(Icons.arrow_back_ios,
                          size: 20, color: Color(0XFF3F51F3)),
                    ),
                  ))),
        ],
      ),
    );
  }
}
