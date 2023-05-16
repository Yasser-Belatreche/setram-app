class Document {
  final String id;
  final String title;
  final String description;
  final List<String> departments;
  final String link;
  final String documentPath;
  final String documentOriginName;
  final DateTime createdAt;
  final DateTime updatedAt;

  Document({
    required this.id,
    required this.title,
    required this.description,
    required this.departments,
    required this.link,
    required this.documentPath,
    required this.documentOriginName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      departments: json["departments"],
      link: json["link"],
      documentPath: json["documentPath"],
      documentOriginName: json["documentOriginName"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }
}
