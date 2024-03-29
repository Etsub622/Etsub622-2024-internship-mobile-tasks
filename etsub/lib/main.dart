import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterui/features/product/presentation/UI/add_product.dart';
import 'package:flutterui/features/product/presentation/UI/product_page.dart';
import 'package:flutterui/features/product/presentation/bloc/product_bloc_bloc.dart';
import 'package:flutterui/injection_container.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProductBlocBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-commerce app',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 193, 193, 195)),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => ProductPage(),
          // '/addProduct': (context) => AddProduct(),
          // '/updateProduct':(context)=>UpdateProduct(),
          // '/productDetails': (context) => ProductDetail(),
        },
      ),
    );
  }
}
