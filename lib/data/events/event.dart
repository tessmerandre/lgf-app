class Event {
  final String id;
  final String title;
  final String description;
  final String location;
  final String startDate;
  final String endDate;

  const Event({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.startDate,
    required this.endDate,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      location: json['location'],
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }
}
