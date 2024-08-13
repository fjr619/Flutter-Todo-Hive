class Task {
  final String id;
  String title;
  String subTitle;
  DateTime createdAtTime;
  DateTime createdAtDate;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.createdAtTime,
    required this.createdAtDate,
    required this.isCompleted,
  });
}
