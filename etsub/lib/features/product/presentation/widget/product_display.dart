 import 'package:flutter/material.dart';
import 'package:flutterui/features/product/domain/entity/product_entity.dart';

class ProductWidget extends StatelessWidget {
    final List<Product> product;
    const ProductWidget({
      super.key, required this.product,
    });

    @override
    Widget build(BuildContext context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }