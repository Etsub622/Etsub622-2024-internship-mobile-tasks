import 'dart:convert';
import 'package:flutterui/core/error/exceptions.dart';
import 'package:flutterui/features/product/data/models/product_model.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteDataSource {
  Future<String> insertProduct(ProductModel product);
  Future<String> updateProduct(ProductModel product, String id);
  Future<String> deleteProduct(String productId);
  Future<ProductModel> getProduct(String productId);
  Future<List<ProductModel>> getAllProducts();
}

class ProductRemoteDataSourceImp extends ProductRemoteDataSource {
  late final http.Client client;
  ProductRemoteDataSourceImp({required this.client});

  final baseUrl = "https://products-api-5a5n.onrender.com/api/v1";

  @override
  Future<String> insertProduct(ProductModel product) async {
    var url = Uri.parse("$baseUrl/products");
    final response = await client.post(headers: {
      'Content-Type': 'application/json',
    }, url, body: jsonEncode(product.toJson()));
    print(response.statusCode);
  
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> updateProduct(ProductModel product, String productId) async {
    var url = Uri.parse("$baseUrl/products/$productId");
    final requestBody = json.encode(product.toJson());
    final response = await client.patch(
      headers: {
        'Content-Type': 'application/json',
      },
      url,
      body: requestBody,
    );

    if (response.statusCode == 200) {
      final res = json.decode(response.body)['message'].toString();
      return res;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> deleteProduct(String productId) async {
    var url = Uri.parse("$baseUrl/products/$productId");
    final response = await client.delete(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> getProduct(String productId) async {
    var url = Uri.parse("$baseUrl/products/$productId");
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return ProductModel.fromJson(jsonDecode(response.body)['product']);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    var url = Uri.parse("$baseUrl/products");
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responceData = json.decode(response.body);
      final List<dynamic> products = responceData['products'];
      final res =
          products.map((product) => ProductModel.fromJson(product)).toList();

      return res;
    } else {
      throw ServerException();
    }
  }
}
