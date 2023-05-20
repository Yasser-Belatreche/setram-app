class Notification {
  final String id;
  final String title;
  final String body;
  final bool read;
  final String employeeId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Notification({
    required this.id,
    required this.title,
    required this.body,
    required this.read,
    required this.employeeId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json["id"],
      title: json["title"],
      body: json["body"],
      read: json["read"],
      employeeId: json["employeeId"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }
}
