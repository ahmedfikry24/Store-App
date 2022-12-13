import 'dart:convert';
import 'package:http/http.dart' as http;

class Crud {
  Future<Map<String, dynamic>> getData(
      {required String url, String? token}) async {
    http.Response response = await http.get(Uri.parse(url),
        headers: token != null
            ? {
                'Content-Type': 'application/json',
                'lang': 'en',
                'Authorization': token,
              }
            : {
                'Content-Type': 'application/json',
                'lang': 'en',
              });
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> responsebody = jsonDecode(response.body);
      return responsebody;
    } else {
      throw Exception(
          'there are some errors with staus code ${response.statusCode} and body ${response.body}');
    }
  }

  Future<Map<String, dynamic>> postData(
      {required String url, required Map data, String? token}) async {
    http.Response response =
        await http.post(Uri.parse(url), body: data, headers: {
      'lang': 'en',
      'Authorization': token!,
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> responsebody = jsonDecode(response.body);
      return responsebody;
    } else {
      throw Exception(
          'there are an exciption status code : ${response.statusCode} and body : ${response.body}');
    }
  }

  putData(
      {required String url, required Map data, required String token}) async {
    http.Response response =
        await http.put(Uri.parse(url), body: data, headers: {
      'lang': 'en',
      'Authorization': token,
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> responsebody = jsonDecode(response.body);
      return responsebody;
    } else {
      throw Exception(
          'there are an exciption status code : ${response.statusCode} and body : ${response.body}');
    }
  }
}
