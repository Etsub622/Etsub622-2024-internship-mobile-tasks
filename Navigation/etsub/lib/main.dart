import 'package:flutter/material.dart';
import 'package:flutterui/add_product.dart';
import 'package:flutterui/product_details.dart';
import 'package:flutterui/product_page.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 193, 193, 195)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ProductPage(),
        '/addProduct': (context) => AddProduct(),
        '/productDetails': (context) => const ProductDetail(),
      },
    );
  }
}
