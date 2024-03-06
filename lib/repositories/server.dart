import 'dart:convert';
import 'dart:io'; // Import the 'dart:io' library for SocketException

import 'package:sprout_solutions_exam/models/products_class.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProducts() async {
  try {
    final response = await http.get(Uri.parse(
        'https://dummyjson.com/products?limit=10&select=title,price,thumbnail,stock,discountPercentage'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body)['products'];
      List<Product> products =
          jsonList.map((json) => Product.fromJson(json)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  } on SocketException catch (_) {
    throw Exception(
        'Failed to connect to the server. Please check your internet connection.');
  } catch (e) {
    throw Exception('Failed to load products: $e');
  }
}
