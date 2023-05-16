import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:setram/src/core/auth/auth_service.dart';
import 'package:setram/src/core/base_url.dart';
import 'package:setram/src/core/planning/api_contracts/employee_planning.dart';

EmployeePlanning? _planning;

Future<EmployeePlanning> getJobs() async {
  if (_planning != null) return _planning!;

  String? token = await getToken();

  if (token == null) throw Exception("should be logged in");

  final response = await http.get(
    Uri.parse("$baseUrl/api/employees/me/planning"),
    headers: {
      "Authorization": token,
    },
  );

  if (response.statusCode != 200) throw Exception(jsonDecode(response.body));

  _planning = EmployeePlanning.fromJson(jsonDecode(response.body));

  return _planning!;
}

void invalidateCache() {
  _planning = null;
}
