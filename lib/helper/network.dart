import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiProvider {
  final String _baseUrl =
      "https://crudcrud.com/api/e0f3427606964697961e76b7fd718e1a";

  get(String url) async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + url));
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body.toString());
        return responseBody;
      }
    } catch (e) {
      // print(e);
      rethrow;
    }
  }

  post(String url, Map<String, dynamic> data) async {
    try {
      String jsonData = json.encode(data);
      final response = await http.post(Uri.parse(_baseUrl + url),
          body: jsonData,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          });
      if (response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      // print(e);
      rethrow;
    }
  }

  put(String url, Map<String, dynamic> data) async {
    try {
      String jsonData = json.encode(data);
      final response = await http.put(Uri.parse(_baseUrl + url),
          body: jsonData,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          });
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      // print(e);
      rethrow;
    }
  }

  delete(String url) async {
    try {
      final response = await http.delete(Uri.parse(_baseUrl + url));
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      // print(e);
      rethrow;
    }
  }
}
