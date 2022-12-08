import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/core/links_app.dart';

class AllCategory {
  Future<List<String>> getData() async {
    http.Response response =
        await http.get(Uri.parse(AppLinks.getAllCategories));
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<String> responsebody = jsonDecode(response.body);
      return responsebody;
    } else {
      throw Exception(
          'there are some errors with staus code ${response.statusCode} and body ${response.body}');
    }
  }
}
