import 'package:flutterui/features/product/domain/entity/product_entity.dart';

class ProductModel extends Product {
  ProductModel({
    required String id,
    required String title,
    required String image,
    required double price,
    required double rating,
    required String category,
    required String description,
  }) : super(
            id: id,
            title: title,
            image: image,
            rating: rating,
            category: category,
            price: price,
            description: description);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['_id'],
        title: json['title'],
        image: json['image'],
        price: json['price'],
        rating: json['rating']['rate'],
        category: json['category'],
        description: json['description']);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image':
          'https://thursdayboots.com/cdn/shop/products/1024x1024-Captain-Whiskey-3.4.jpg?v=1658505769&width=816',
      'price': price,
      'category': category,
      'description': description
    };
  }
}
