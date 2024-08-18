import 'dart:convert';

import 'package:indrive_clone/src/data/api/api_config.dart';
import 'package:indrive_clone/src/domain/models/user.dart';
import 'package:indrive_clone/src/domain/utils/list_to_string.dart';
import 'package:indrive_clone/src/domain/utils/resource.dart';
import 'package:http/http.dart' as http;

class UsersService {

  Future<String> token;

  UsersService(this.token);
  Future<Resource<User>> update(int id, User user) async {
    try {
      Uri uri = Uri.http(ApiConfig.api, '/users/$id');
      Map<String, String> headers = {
        'Authorization': await token,
        'Content-Type': 'application/json'};
      String body = json.encode(
          {'name': user.name, 'lastname': user.lastname, 'phone': user.phone});

      final response = await http.put(uri, body: body, headers: headers);
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        User userResponse = User.fromJson(data);
        return Success(userResponse);
      }
      {
        return ErrorData(listToString(data['message']));
      }
    } catch (error) {
      print('Error): $error');
      return ErrorData(error.toString());
    }
  }
}
