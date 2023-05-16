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
  final DateTime endDate;
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
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      departments: json["departments"],
      location: json["location"],
      salary: json["salary"],
      experience: json["experience"],
      education: json["education"],
      skills: json["skills"],
      benefits: json["benefits"],
      contact: json["contact"],
      applicationDeadline: DateTime.parse(json["applicationDeadline"]),
      endDate: DateTime.parse(json["endDate"]),
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }
}
