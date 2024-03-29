import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  final String image;
  final String name;
  final double price;
  final double rating;
  final String category;

  const CardPage({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.rating, required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0XFF3E3E3E),
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                ),
                Text(
                  '\$$price',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 10.0, right: 10),
            child: Row(
              children: [
                 Expanded(
                  child: Text(
                    '($category)',
                    style:const TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFFAAAAAA),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ),
                const Icon(
                  Icons.star,
                  color: Color(0XFFFFD700),
                  size: 17,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '($rating)',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFFAAAAAA),
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
