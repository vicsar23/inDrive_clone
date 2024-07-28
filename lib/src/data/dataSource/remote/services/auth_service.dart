import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:indrive_clone/src/data/api/api_config.dart';
import 'package:http/http.dart' as http;
import 'package:indrive_clone/src/domain/models/auth_response.dart';

class AuthService {
  Future<AuthResponse?> login(String email, String password) async {
    try {
      Uri uri = Uri.http(ApiConfig.API, ApiConfig.login);

      Map<String, String> headers = {'Content-Type': 'application/json'};
      String body = json.encode({'email': email, 'password': password});

      final response = await http.post(uri, headers: headers, body: body);

      final data = json.decode(response.body);

      AuthResponse authResponse = AuthResponse.fromJson(data);
      if (kDebugMode) {
        print("AuthResponse: ${authResponse.toJson()}");
      }
      return authResponse;
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      return null;
    }
  }
}
