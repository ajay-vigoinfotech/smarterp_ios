import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/utils/constant.dart';
import '../model/login_model.dart';

class LoginViewModel {
  Future<bool> makeRequest(LoginRequest request) async {
    final uri = Uri.parse('${AppConstants.baseUrl}/token');

    try {
      final response = await http.post(
        uri,
        body: request.toMap(),
      );

      if (response.statusCode == 200) {
        const CircularProgressIndicator();
        //print('Response.. ${response.body}');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Exception: $e');
      return false;
    }
  }
}
