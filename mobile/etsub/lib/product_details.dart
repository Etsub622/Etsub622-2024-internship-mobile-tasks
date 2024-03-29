import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterui/update.dart';

class ProductDetail extends StatefulWidget {
  final Map<String, Object> products;
  const ProductDetail({super.key, required this.products});

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

  void updateProduct(Map<String, Object> updatedProduct) {
    setState(() {
      widget.products['title'] = updatedProduct['title']!;
      widget.products['category'] = updatedProduct['category']!;
      widget.products['price'] = updatedProduct['price']!;
      widget.products['description'] = updatedProduct['description']!;
    });
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
                      widget.products['image'] as String,
                      fit: BoxFit.cover,
                    )),
                Padding(
                  padding: EdgeInsets.only(
                    left: 26.0,
                    top: 26,
                    right: 26,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(widget.products['category'].toString(),
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
                        widget.products['rating'].toString(),
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
                          widget.products['title'].toString(),
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        '\$${widget.products['price']}',
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
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Color(0XFF666666),
                        fontWeight: FontWeight.w500),
                    widget.products['description'].toString(),
                  ),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdateProduct(
                                name: widget.products['name'].toString(),
                                price: double.parse(
                                    widget.products['price'].toString()),
                                category:
                                    widget.products['category'].toString(),
                                description:
                                    widget.products['description'].toString(),
                                onUpdate: updateProduct,
                              ),
                            ),
                          );
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
