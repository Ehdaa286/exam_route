import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';  // تأكد من استيراد موديل الـ Product

class ProductService {
  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('فشل تحميل المنتجات');
    }
  }
}
