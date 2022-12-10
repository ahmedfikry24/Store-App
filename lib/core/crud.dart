import 'dart:convert';

import 'package:http/http.dart' as http;

class Crud {
  getData() {}

  Future<Map<String, dynamic>> postData(String url, Map data) async {
    http.Response response = await http.post(Uri.parse(url), body: data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> responsebody = jsonDecode(response.body);
      return responsebody;
    } else {
      throw Exception(
          'there are an exciption status code : ${response.statusCode} and body : ${response.body}');
    }
  }
}
