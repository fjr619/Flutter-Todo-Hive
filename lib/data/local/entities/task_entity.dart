import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'task_entity.g.dart';

@HiveType(typeId: 0)
class TaskEntity extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String subTitle;

  @HiveField(3)
  DateTime createdAtTime;

  @HiveField(4)
  DateTime createdAtDate;

  @HiveField(5)
  bool isCompleted;

  TaskEntity({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.createdAtTime,
    required this.createdAtDate,
    required this.isCompleted,
  });

  //create new task

  factory TaskEntity.create({
    required String title,
    required String subTitle,
    DateTime? createdAtTime,
    DateTime? createdAtDate,
  }) =>
      TaskEntity(
          id: const Uuid().v1(),
          title: title,
          subTitle: subTitle,
          createdAtTime: createdAtTime ?? DateTime.now(),
          createdAtDate: createdAtDate ?? DateTime.now(),
          isCompleted: false);
}
