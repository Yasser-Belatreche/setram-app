import 'package:setram/src/core/notifications/api_contracts/notification.dart';

class GetNotificationsSuccessResponse {
  final List<Notification> list;
  final Pagination pagination;

  GetNotificationsSuccessResponse(
      {required this.list, required this.pagination});

  factory GetNotificationsSuccessResponse.fromJson(Map<String, dynamic> json) {
    return GetNotificationsSuccessResponse(
      list: (json["list"] as List<dynamic>)
          .map((e) => Notification.fromJson(e))
          .toList(),
      pagination: Pagination.fromJson(json["pagination"]),
    );
  }
}

class Pagination {
  final int total;
  final int totalPages;

  Pagination({required this.total, required this.totalPages});

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      total: json["total"],
      totalPages: json["totalPages"],
    );
  }
}
