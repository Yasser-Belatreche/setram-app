import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:localstorage/localstorage.dart';
import 'package:setram/src/core/auth/api_contracts/employee.dart';
import 'package:setram/src/core/auth/api_contracts/login_body.dart';
import 'package:setram/src/core/base_url.dart';
import 'package:setram/src/core/planning/planning_service.dart' as planning;

String? _token;
Employee? _employee;

final LocalStorage _storage = LocalStorage("auth.json");

Future<void> login(LoginBody body) async {
  final response = await http.post(
    Uri.parse('$baseUrl/auth/login'),
    body: body.toJson(),
  );

  if (response.statusCode != 201) throw Exception(jsonDecode(response.body));

  String token = jsonDecode(response.body)['accessToken'] as String;

  await _storage.setItem("token", "Bearer $token");
  _token = "Bearer $token";
}

Future<Employee> getAuthEmployee() async {
  if (_employee != null) return _employee!;

  String? token = await getToken();

  if (token == null) throw Exception("should be logged in");

  final response = await http.get(
    Uri.parse('$baseUrl/api/employees/me'),
    headers: {
      "Authorization": token,
    },
  );

  if (response.statusCode != 200) throw Exception(jsonDecode(response.body));

  _employee = Employee.fromJson(jsonDecode(response.body));

  return _employee!;
}

Future<void> logout() async {
  await _invalidateCache();
}

Future<void> _invalidateCache() async {
  _token = null;
  _employee = null;
  await _storage.clear();

  planning.invalidateCache();
}

Future<bool> isLoggedIn() async {
  String? token = await getToken();

  return token != null;
}

Future<String?> getToken() async {
  if (_token != null) return _token;

  _token = await _storage.getItem("token");

  return _token;
}
