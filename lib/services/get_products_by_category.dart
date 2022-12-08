import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/core/links_app.dart';

class GetAllProductsByCategory {
  Future<List<Map<String, dynamic>>> getData(String categoryName) async {
    http.Response response = await http
        .get(Uri.parse('${AppLinks.getAllProductsByCategory}$categoryName'));
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<Map<String, dynamic>> responsebody = jsonDecode(response.body);
      return responsebody;
    } else {
      throw Exception(
          'there are some errors with staus code ${response.statusCode} and body ${response.body}');
    }
  }
}
