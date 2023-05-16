import 'package:setram/src/core/jobs/api_contracts/job.dart';

class GetJobsSuccessResponse {
  final List<Job> list;
  final Pagination pagination;

  GetJobsSuccessResponse({required this.list, required this.pagination});

  factory GetJobsSuccessResponse.fromJson(Map<String, dynamic> json) {
    return GetJobsSuccessResponse(
      list:
          (json["list"] as List<dynamic>).map((e) => Job.fromJson(e)).toList(),
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
