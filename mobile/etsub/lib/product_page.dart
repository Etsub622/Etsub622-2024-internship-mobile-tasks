import 'package:flutter/material.dart';
import 'package:flutterui/dummy_data.dart';
import 'package:flutterui/product_card.dart';
import 'package:flutterui/product_details.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
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
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'July 14,2023',
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
                          border: Border.all(color: Colors.grey, width: 0.5)),
                      child: const Icon(
                        Icons.notifications_active_outlined,
                        size: 20,
                      )),
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
              SizedBox(
                height: 500,
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ProductDetail(products: product);
                          }));
                        },
                        child: CardPage(
                          image: product['image'] as String,
                          name: product['title'] as String,
                          price: product['price'] as double,
                          rating: product['rating'] as double,
                          category: product['category'] as String,
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0XFF3F51F3),
          shape: const CircleBorder(),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/addProduct');
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
}
