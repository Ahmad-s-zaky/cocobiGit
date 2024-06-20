import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:notesappflutter/models/response_model.dart';
import 'package:notesappflutter/utils/configs/api_config.dart';

class UserServices {
  final String baseUrl = ApiConfig.baseUrl;

  Future<ResponseModel> registerUser({ required String fullName, required String username, required String password }) async {
    var url = '$baseUrl/users';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode({
        "fullname": fullName,
        "username": username,
        "password": password,
      }),
    );
    return ResponseModel.fromJson(jsonDecode(response.body));
  }
}
