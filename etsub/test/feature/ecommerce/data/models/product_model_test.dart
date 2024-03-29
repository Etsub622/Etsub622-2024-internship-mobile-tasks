// import 'dart:convert';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutterui/features/product/data/models/product_model.dart';
// import 'package:flutterui/features/product/domain/entity/product_entity.dart';

// import '../../../../fixtures/fixture_reader.dart';

// void main() {
//   final tProductModel = ProductModel(
//       id: '1',
//       image:'htpsfs',
//       title: 'product1',
//       price: 20.0,
//       rating:{'39',0},
//       category: 'mens',
//       description: 'product1\'s description goes like  this...');

//   test('should be a subclass of Product entity', () async {
//     // assert
//     expect(tProductModel, isA<Product>());
//   });

//   //test fromJson
//   group('fromJson', () {
//     test(
//       'should return a valid model', () async {
//       // arrange
//       final Map<String, dynamic> jsonMap = json.decode(fixture('product.json'));
//       // act
//       final result = ProductModel.fromJson(jsonMap);
//       // assert
//       expect(result, tProductModel);
//     });
//   });

//   //test for toJson
//   group('toJson', () {
//   test('should return a Json map containing the proper data', () async {
//     // act
//     final result = tProductModel.toJson();
//     // assert
//     final expectedJsonMap = {
    
//             'id': 1,
//             'name': 'product1',
//             'price': 20.0,
//             'description': 'product1\'s description goes like  this...'
//     };

//     expect(result, expectedJsonMap);
//   });
// });
    



 
// }
