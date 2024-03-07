import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sprout_solutions_exam/models/products_class.dart';

const String baseUrl = 'https://dummyjson.com/products';
const String defaultQueryParameters =
    'limit=10&select=title,price,thumbnail,stock,discountPercentage';

Future<List<Product>> fetchProducts() async {
  try {
    final response =
        await http.get(Uri.parse('$baseUrl?$defaultQueryParameters'));

    return _parseResponse(response);
  } catch (e) {
    throw Exception('Failed to load products: $e');
  }
}

Future<List<Product>> nextPage(int page) async {
  try {
    int skip = (page - 1) * 10;

    final response = await http
        .get(Uri.parse('$baseUrl?limit=10&skip=$skip&$defaultQueryParameters'));

    return _parseResponse(response);
  } catch (e) {
    throw Exception('Failed to load products: $e');
  }
}

Future<Product> fetchContents(int productId) async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/$productId'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      Product product = Product.fromJson(jsonData);
      return product;
    } else {
      throw Exception('Failed to load product');
    }
  } catch (e) {
    throw Exception('Failed to load product: $e');
  }
}

List<Product> _parseResponse(http.Response response) {
  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body)['products'];
    List<Product> products =
        jsonList.map((json) => Product.fromJson(json)).toList();
    return products;
  } else {
    throw Exception('Failed to load products');
  }
}
