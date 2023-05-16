import 'package:setram/src/core/workshops/api_contracts/workshop.dart';

class GetWorkshopsSuccessResponse {
  final List<Workshop> list;
  final Pagination pagination;

  GetWorkshopsSuccessResponse({required this.list, required this.pagination});

  factory GetWorkshopsSuccessResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkshopsSuccessResponse(
      list: (json["list"] as List<dynamic>)
          .map((e) => Workshop.fromJson(e))
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
