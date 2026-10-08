import 'package:hive_flutter/adapters.dart';
part 'task_model.g.dart';
@HiveType(typeId: 2)
class TaskModel{
  @HiveField(0)
  String titel;
  @HiveField(1)
  String description;
  @HiveField(2)
  String date;
  @HiveField(3)
  String time;
  @HiveField(4)
  String status;
  @HiveField(5)
  int  coror;
   TaskModel({
    required this.titel,required this.description,required this.date,required this.time,
     required this.status,required this.coror

});

}