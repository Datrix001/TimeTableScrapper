class ClassModel {
  final String date;
  final String name;
  final String room;
  final String time;

  ClassModel({
    required this.date,
    required this.name,
    required this.room,
    required this.time,
  });
  Map<String, dynamic> toJson() {
    return {"date": date, "name": name, "number": room, "time": time};
  }
}
