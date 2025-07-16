// event_model.dart
class Event {
  String name;
  DateTime fromDate;
  DateTime toDate;
  String location;
  String imagePath;
  String description;

  Event({
    required this.name,
    required this.fromDate,
    required this.toDate,
    required this.location,
    required this.imagePath,
    required this.description, String? filePath,
  });
}

// Global list
List<Event> eventsList = [];