import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:indrive_clone/src/data/api/api_config.dart';
import 'package:http/http.dart' as http;
import 'package:indrive_clone/src/domain/models/auth_response.dart';
import 'package:indrive_clone/src/domain/utils/list_to_string.dart';
import 'package:indrive_clone/src/domain/utils/resource.dart';

class AuthService {
  Future<Resource<AuthResponse>> login(String email, String password) async {
    try {
      Uri uri = Uri.http(ApiConfig.API, ApiConfig.login);

      Map<String, String> headers = {'Content-Type': 'application/json'};
      String body = json.encode({'email': email, 'password': password});

      final response = await http.post(uri, headers: headers, body: body);

      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponse authResponse = AuthResponse.fromJson(data);
        if (kDebugMode) {
          print("AuthResponse: ${authResponse.toJson()}");
        }
        return Success(authResponse);
      } else {
        return ErrorData(listToString(data['message']));
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      return ErrorData(error.toString());
    }
  }
}
