import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchProducts() async {
  final url =
      Uri.parse('https://fakestoreapi.com/products/category/electronics');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Falha ao carregar produtos: ${response.statusCode}');
  }
}
