
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class UserModel{
  @HiveField(0)
  String name;
  @HiveField(1)
  String Image;
  UserModel({required this.name,required this.Image});
}