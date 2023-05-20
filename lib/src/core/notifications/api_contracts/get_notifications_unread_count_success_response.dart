class GetNotificationsUnreadCountSuccessResponse {
  final int count;

  GetNotificationsUnreadCountSuccessResponse({required this.count});

  factory GetNotificationsUnreadCountSuccessResponse.fromJson(
      Map<String, dynamic> json) {
    return GetNotificationsUnreadCountSuccessResponse(
      count: json["count"],
    );
  }
}
