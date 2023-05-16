class Employee {
  final String id;
  final String firstName;
  final String lastName;
  final String department;
  final String gender;
  final DateTime birthDate;
  final DateTime startingDate;
  final String phoneNumber;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Employee({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.department,
    required this.gender,
    required this.birthDate,
    required this.startingDate,
    required this.phoneNumber,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json["id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      department: json["department"],
      gender: json["gender"],
      birthDate: DateTime.parse(json["birthDate"]),
      startingDate: DateTime.parse(json["startingDate"]),
      phoneNumber: json["phoneNumber"],
      email: json["email"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }
}
