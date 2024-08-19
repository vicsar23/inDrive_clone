import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:indrive_clone/src/data/api/api_config.dart';
import 'package:indrive_clone/src/domain/models/user.dart';
import 'package:indrive_clone/src/domain/utils/list_to_string.dart';
import 'package:indrive_clone/src/domain/utils/resource.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

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
  Future<Resource<User>> updateImage(int id, User user, File file) async { 
    try {
      Uri url = Uri.http(ApiConfig.api, '/users/upload/$id');
      final request = http.MultipartRequest('PUT', url);
      request.headers['Authorization'] = await token;
      request.files.add(http.MultipartFile(
        'file',
        http.ByteStream(file.openRead().cast()),
        await file.length(),
        filename: basename(file.path),
        contentType: MediaType('image', 'jpg')
      ));
      request.fields['name'] = user.name!;
      request.fields['lastname'] = user.lastname!;
      request.fields['phone'] = user.phone!;
      final response = await request.send();
      final data = json.decode(await response.stream.transform(utf8.decoder).first);
      if (response.statusCode == 200 || response.statusCode == 201) {
        User userResponse = User.fromJson(data);
        return Success(userResponse);
      }
      else {
         return ErrorData(listToString(data['message']));
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      return ErrorData(e.toString());
    }
  }
}
