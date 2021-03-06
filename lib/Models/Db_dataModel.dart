import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';
part 'Db_dataModel.g.dart';

@HiveType(typeId: 1)
class StudentModel{

  @HiveField(0)
  int? id;
   @HiveField(1)
  final String name;

  @HiveField(2)
  final String age;

  @HiveField(3)
  final String Class;


  @HiveField(4)
  final phone;

  @HiveField(5)
  final String image;

  StudentModel({
   required this.name,
    required this.age,
    required this.Class,
    required this.phone,
    required this.image,
    this.id

  });



}