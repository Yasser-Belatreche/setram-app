class Job {
  final String id;
  final String title;
  final String description;
  final List<String> departments;
  final String location;
  final String salary;
  final String experience;
  final String education;
  final List<String> skills;
  final List<String> benefits;
  final String contact;
  final DateTime applicationDeadline;
  final DateTime createdAt;
  final DateTime updatedAt;

  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.departments,
    required this.location,
    required this.salary,
    required this.experience,
    required this.education,
    required this.skills,
    required this.benefits,
    required this.contact,
    required this.applicationDeadline,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      departments: (json["departments"] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      location: json["location"],
      salary: json["salary"],
      experience: json["experience"],
      education: json["education"],
      skills:
          (json["skills"] as List<dynamic>).map((e) => e.toString()).toList(),
      benefits:
          (json["benefits"] as List<dynamic>).map((e) => e.toString()).toList(),
      contact: json["contact"],
      applicationDeadline: DateTime.parse(json["applicationDeadline"]),
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }
}
