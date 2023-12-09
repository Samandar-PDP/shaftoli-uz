import 'package:networking/product.dart';
import 'package:http/http.dart' as http; /// yoz
import 'dart:convert'; /// yoz

class ApiService {
  /// import qil
  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if(response.statusCode == 200) {
      final decode = json.decode(response.body) as List;
      final List<Product> productList = decode.map<Product>((e) => Product.fromJson(e)).toList();
      return productList;
    } else {
      return [];
    }
  }
}