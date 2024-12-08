import 'dart:convert';

import 'package:flutter_fundamental/core/data/entity/product_model.dart';
import 'package:http/http.dart' as http;

class HttpProductRepository {
  static Future<List<ProductModel>> getProducts() async {
    final uri = Uri.parse("https://dummyjson.com/products");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return (json["products"] as List)
          .map((e) => ProductModel.fromMap(e))
          .toList();
    }
    return Future.error("failed to get data");
  }
}
