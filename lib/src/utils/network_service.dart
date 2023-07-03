import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  // https://api.unsplash.com/photos/?page=1&per_page=10&client_id=By-b9CRN0jGNTc37DFIh8qn2ONU3dd459LZD-lTR0dA

  static String url = 'https://api.unsplash.com/photos/';
  static String token = 'By-b9CRN0jGNTc37DFIh8qn2ONU3dd459LZD-lTR0dA';

  // GET METHOD
  static Future<dynamic> getResponse(String url) async {
    try {
      var uri = Uri.parse(url);
      var response = await http.get(uri);
      debugPrint(url);
      debugPrint('Response : ${response.body}');
      return response.body;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
