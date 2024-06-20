import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:notesappflutter/models/response_model.dart';
import 'package:notesappflutter/utils/configs/api_config.dart';

class NoteServices {
  final String _baseUrl = "${ApiConfig.baseUrl}/notes";

  Future<ResponseModel> saveNote({required String title, required String tags, required String body}) async {
    List tagsList = tags.split(",").map((tag) => tag.trim()).toList();
    final String? accessToken = "123"; // Changed from `String?` to `String`
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer $accessToken"
      },
      body: jsonEncode({
        "title": title,
        "tags": tagsList,
        "body": body,
      }),
    );

    return ResponseModel.fromJson(jsonDecode(response.body));
  }

  Future<ResponseModel> getNotes() async {
    final String? accessToken = "123";
    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer $accessToken"
      },
    );

    return ResponseModel.fromJson(jsonDecode(response.body));
  }

  Future<ResponseModel> deleteNotes({required String noteId }) async {
    final String? accessToken = "123";
    final response = await http.delete(
      Uri.parse("$_baseUrl/$noteId"),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer $accessToken"
      },
    );

    return ResponseModel.fromJson(jsonDecode(response.body));
  }
}
