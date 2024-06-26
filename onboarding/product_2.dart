import 'dart:io';

class Product {
  String name;
  String description;
  double price;

  Product(this.name, this.description, this.price);
}

class ProductManager {
  List<Map<String, dynamic>> products = [];

  void addNewProduct(String name, String description, double price) {
    var newProduct = {
      'name': name,
      'description': description,
      'price': price,
    };
    products.add(newProduct);
  }

  void viewAllProducts() {
    if (products.isEmpty) {
      print('There are no products.');
    } else {
      for (int i = 0; i < products.length; i++) {
        print('Product_Id: $i');
        print('${products[i]['name']}');
        print('${products[i]['description']}');
        print('${products[i]['price']}');
        print('____ ____ ___');
      }
    }
  }

  void viewASingleProduct() {
    if (products.isEmpty) {
      print('There is no product.');
    } else {
      print('Enter the product id: ');
      String id = stdin.readLineSync()!;
      int i = int.parse(id);
      if (i >= 0 && i < products.length) {
        print('Product_Id: $i');
        print('${products[i]['name']}');
        print('${products[i]['description']}');
        print('${products[i]['price']}');
      } else {
        print('Invalid product id.');
      }
    }
  }

  void updateProduct() {
    print('Enter the product id: ');
    int id = int.parse(stdin.readLineSync()!);

    if (id >= 0 && id < products.length) {
      print('Enter the new name:');
      String? newName = stdin.readLineSync();

      print('Enter the new description:');
      String? newDescription = stdin.readLineSync();

      print('Enter the new price:');
      double? newPrice = double.parse(stdin.readLineSync()!);

      products[id]['name'] = newName;
      products[id]['description'] = newDescription;
      products[id]['price'] = newPrice;
    } else {
      print('Invalid product id.');
    }
  }

  void deleteProduct() {
    print('Enter the product id: ');
    int id = int.parse(stdin.readLineSync()!);
    if (id >= 0 && id < products.length) {
      products.removeAt(id);
    } else {
      print('Invalid product id.');
    }
  }
}

void main() {
  ProductManager manager = ProductManager();

  while (true) {
    print('Enter your choice:');
    print('0. View all products');
    print('1. View a single product');
    print('2. Add a new product');
    print('3. Update a product');
    print('4. Delete a product');
    print('5. Exit');

    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 0:
        manager.viewAllProducts();
        break;
      case 1:
        manager.viewASingleProduct();
        break;
      case 2:
        print('Enter the product name: ');
        String name = stdin.readLineSync()!;
        print('Enter the product description: ');
        String description = stdin.readLineSync()!;
        print('Enter the product price: ');
        double price = double.parse(stdin.readLineSync()!);
        manager.addNewProduct(name, description, price);
        break;
      case 3:
        manager.updateProduct();
        break;
      case 4:
        manager.deleteProduct();
        break;
      case 5:
        return;
      default:
        print('Invalid choice.');
    }
  }
}
