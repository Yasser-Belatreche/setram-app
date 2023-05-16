class EmployeePlanning {
  final List<DayTiming> sunday;
  final List<DayTiming> monday;
  final List<DayTiming> tuesday;
  final List<DayTiming> wednesday;
  final List<DayTiming> thursday;
  final List<DayTiming> friday;
  final List<DayTiming> saturday;

  EmployeePlanning({
    required this.sunday,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
  });

  factory EmployeePlanning.fromJson(Map<String, dynamic> json) {
    return EmployeePlanning(
      sunday: (json["sunday"] as List<dynamic>)
          .map((e) => DayTiming.fromJson(e))
          .toList(),
      monday: (json["monday"] as List<dynamic>)
          .map((e) => DayTiming.fromJson(e))
          .toList(),
      tuesday: (json["tuesday"] as List<dynamic>)
          .map((e) => DayTiming.fromJson(e))
          .toList(),
      wednesday: (json["wednesday"] as List<dynamic>)
          .map((e) => DayTiming.fromJson(e))
          .toList(),
      thursday: (json["thursday"] as List<dynamic>)
          .map((e) => DayTiming.fromJson(e))
          .toList(),
      friday: (json["friday"] as List<dynamic>)
          .map((e) => DayTiming.fromJson(e))
          .toList(),
      saturday: (json["saturday"] as List<dynamic>)
          .map((e) => DayTiming.fromJson(e))
          .toList(),
    );
  }
}

class DayTiming {
  final String label;
  final Time start;
  final Time end;

  DayTiming({required this.label, required this.start, required this.end});

  factory DayTiming.fromJson(Map<String, dynamic> json) {
    return DayTiming(
      label: json["label"],
      start: Time.fromJson(json["start"]),
      end: Time.fromJson(json["end"]),
    );
  }
}

class Time {
  final int hour;
  final int minute;

  Time({required this.hour, required this.minute});

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      hour: json["hour"],
      minute: json["minute"],
    );
  }
}
