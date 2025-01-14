import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/product.dart';

class LocalStorageService {
  final SharedPreferences sharedPreferences;

  LocalStorageService(this.sharedPreferences);

  Future<List<Product>> loadProducts() async {
    final products = sharedPreferences.getString('products');
    if (products == null) {
      return [];
    }
    final List<dynamic> productsJson = jsonDecode(products);
    return productsJson.map((product) => Product.fromJson(product)).toList();
  }

  Future<void> saveProducts(List<Product> products) async {
    final List<Map<String, dynamic>> productsJson =
        products.map((product) => product.toJson()).toList();
    await sharedPreferences.setString('products', jsonEncode(productsJson));
  }
}
