import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/core/links_app.dart';

class UpdateProduct {
  Future<Map<String, dynamic>> updateProduct(
      {required String title,
      required String price,
      required String des,
      required String image,
      required String category,
      required int id}) async {
    http.Response response =
        await http.post(Uri.parse('${AppLinks.getAllProducts}/$id'), body: {
      "title": title,
      "price": price,
      "description": des,
      "image": image,
      "category": category
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> responsebody = jsonDecode(response.body);
      return responsebody;
    } else {
      throw Exception(
          'there are some errors with staus code ${response.statusCode} and body ${response.body}');
    }
  }
}
