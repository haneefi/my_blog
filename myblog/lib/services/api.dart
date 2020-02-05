import 'dart:convert';

import '../config.dart';
import 'package:http/http.dart' as http;
import '../model/Product.dart';

class Api {
  static String productsUrl = URL + "wp-json/wp/v2/product";
  static Future<List<Product>> getProducts(String url) async {
    List<Product> _products = new List<Product>();
    await http.get(url).then((response) {
      dynamic json = jsonDecode(response.body);

      (json as List).forEach((v) {
        _products.add(new Product.fromJson(v));
      });
    });
    return _products;
  }
}
