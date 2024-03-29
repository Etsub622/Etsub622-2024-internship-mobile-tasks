import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String title;
  final String image;
  final double price;
  final double rating;
  final String category;
  final String description;

  Product( {
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.rating, 
    required this.category,
    required this.description,
  });

  @override
  List<Object?> get props => [id, title, image, price,rating,category,description];

}
