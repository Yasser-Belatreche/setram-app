class Workshop {
  final String id;
  final String title;
  final String description;
  final List<String> departments;
  final DateTime workshopDate;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  Workshop({
    required this.id,
    required this.title,
    required this.description,
    required this.departments,
    required this.workshopDate,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Workshop.fromJson(Map<String, dynamic> json) {
    return Workshop(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      departments: json["departments"],
      workshopDate: DateTime.parse(json["workshopDate"]),
      startDate: DateTime.parse(json["startDate"]),
      endDate: DateTime.parse(json["endDate"]),
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }
}
