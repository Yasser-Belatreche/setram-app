import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import "package:http/http.dart" as http;
import 'package:setram/src/core/auth/auth_service.dart';
import 'package:setram/src/core/base_url.dart';
import 'package:setram/src/core/notifications/api_contracts/get_notifications_query_params.dart';
import 'package:setram/src/core/notifications/api_contracts/get_notifications_success_response.dart';
import 'package:setram/src/core/notifications/api_contracts/get_notifications_unread_count_success_response.dart';
import 'package:setram/src/core/notifications/api_contracts/register_device_for_notifications_body.dart';

Future<GetNotificationsSuccessResponse> getNotifications(
    GetNotificationsQueryParams params) async {
  String? token = await getToken();

  if (token == null) throw Exception("should be logged in");

  final page = params.page;
  final perPage = params.perPage;

  final response = await http.get(
    Uri.parse("$baseUrl/api/notifications/my?page=$page&perPage=$perPage"),
    headers: {
      "Authorization": token,
    },
  );

  if (response.statusCode != 200) throw Exception(jsonDecode(response.body));

  return GetNotificationsSuccessResponse.fromJson(jsonDecode(response.body));
}

Future<GetNotificationsUnreadCountSuccessResponse>
getNotificationsUnreadCount() async {
  String? token = await getToken();

  if (token == null) throw Exception("should be logged in");

  final response = await http.get(
    Uri.parse("$baseUrl/api/notifications/unread/count"),
    headers: {
      "Authorization": token,
    },
  );

  if (response.statusCode != 200) throw Exception(jsonDecode(response.body));

  return GetNotificationsUnreadCountSuccessResponse.fromJson(
      jsonDecode(response.body));
}

Future<void> markNotificationsAsRead() async {
  String? token = await getToken();

  if (token == null) throw Exception("should be logged in");

  final response = await http.put(
    Uri.parse("$baseUrl/api/notifications/my/read"),
    headers: {
      "Authorization": token,
    },
  );

  if (response.statusCode != 200) throw Exception(jsonDecode(response.body));
}

Future<void> registerDeviceForNotifications(String deviceToken) async {
  String? token = await getToken();

  if (token == null) throw Exception("should be logged in");

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

  String imeiNo = androidInfo.id;
  String deviceName = androidInfo.device;

  RegisterDeviceForNotificationsBody body = RegisterDeviceForNotificationsBody(
    imeiNo: imeiNo,
    token: deviceToken,
    deviceName: deviceName,
  );

  await http.put(
    Uri.parse("$baseUrl/api/employees/devices"),
    body: body.toJson(),
    headers: {
      "Authorization": token,
    },
  );
}

Future<void> unregisterDeviceFromNotifications() async {
  String? token = await getToken();

  if (token == null) throw Exception("should be logged in");

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

  String imeiNo = androidInfo.id;

  await http.delete(
    Uri.parse("$baseUrl/api/employees/devices/$imeiNo"),
    headers: {
      "Authorization": token,
    },
  );
}
