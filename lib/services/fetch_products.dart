import 'dart:convert';
import 'package:furnitureapi/models/product.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProducts() async {
  const String apiUrl =
      "https://5f210aa9daa42f001666535e.mockapi.io/api/products";

  try {
    final http.Response response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<Product> products = (jsonDecode(response.body) as List)
          .map((data) => Product.fromJson(data))
          .toList();
      // Return list of products
      return products;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to fetch list product load');
    }
  } catch (err) {
    throw Exception('Failed catch error');
  }
}
