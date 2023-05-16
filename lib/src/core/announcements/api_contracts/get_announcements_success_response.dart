import 'package:setram/src/core/announcements/api_contracts/announcement.dart';

class GetAnnouncementsSuccessResponse {
  final List<Announcement> list;
  final Pagination pagination;

  GetAnnouncementsSuccessResponse({
    required this.list,
    required this.pagination,
  });

  factory GetAnnouncementsSuccessResponse.fromJson(Map<String, dynamic> json) {
    return GetAnnouncementsSuccessResponse(
      list: (json["list"] as List<dynamic>)
          .map((e) => Announcement.fromJson(e))
          .toList(),
      pagination: Pagination(
        total: json["pagination"]["total"],
        totalPages: json["pagination"]["totalPages"],
      ),
    );
  }
}

class Pagination {
  final int total;
  final int totalPages;

  Pagination({required this.total, required this.totalPages});
}
