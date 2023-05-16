import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:setram/src/core/auth/auth_service.dart';
import 'package:setram/src/core/base_url.dart';
import 'package:setram/src/core/events/api_contracts/get_events_query_params.dart';
import 'package:setram/src/core/events/api_contracts/get_events_success_response.dart';

Future<GetEventsSuccessResponse> getEvents(
  GetEventsQueryParams params,
) async {
  String? token = await getToken();

  if (token == null) throw Exception("should be logged in");

  final page = params.page;
  final perPage = params.perPage;

  final response = await http.get(
    Uri.parse("$baseUrl/api/news/events?page=$page&perPage=$perPage"),
    headers: {
      "Authorization": token,
    },
  );

  if (response.statusCode != 200) throw Exception(jsonDecode(response.body));

  return GetEventsSuccessResponse.fromJson(jsonDecode(response.body));
}
