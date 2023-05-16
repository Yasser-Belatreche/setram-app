import 'package:setram/src/core/events/api_contracts/event.dart';

class GetEventsSuccessResponse {
  final List<Event> list;
  final Pagination pagination;

  GetEventsSuccessResponse({required this.list, required this.pagination});

  factory GetEventsSuccessResponse.fromJson(Map<String, dynamic> json) {
    return GetEventsSuccessResponse(
      list: (json["list"] as List<dynamic>)
          .map((e) => Event.fromJson(e))
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
