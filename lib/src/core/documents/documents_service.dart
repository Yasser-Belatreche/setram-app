import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:setram/src/core/auth/auth_service.dart';
import 'package:setram/src/core/base_url.dart';
import 'package:setram/src/core/documents/api_contracts/document.dart';

Future<List<Document>> getDocuments() async {
  String? token = await getToken();

  if (token == null) throw Exception("should be logged in");

  final response = await http.get(
    Uri.parse("$baseUrl/api/documents/my"),
    headers: {
      "Authorization": token,
    },
  );

  if (response.statusCode != 200) throw Exception(jsonDecode(response.body));

  return (jsonDecode(response.body) as List<dynamic>)
      .map((e) => Document.fromJson(e))
      .toList();
}
