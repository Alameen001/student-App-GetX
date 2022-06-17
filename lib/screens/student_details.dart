import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stud_management/Models/Db_dataModel.dart';
import 'package:stud_management/screens/Edit_student.dart';
import 'package:stud_management/screens/list_student.dart';

class StudentDetails extends StatelessWidget {
  StudentDetails({Key? key, required this.index}) : super(key: key);
  final int index;


  @override
  Widget build(BuildContext context) {
     var allstudentdata = Hive.box<StudentModel>("data");
      List<StudentModel> models = allstudentdata.values.toList();
    final data = models[index];
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return EditStudent(index: index);
            },));
          }, icon:Icon(Icons.edit)),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: 250,
              height: 300,
              child: Image.file(File(data.image)),
            ),
            Text(data.name),
            Text(data.age),
            Text(data.Class),
            Text(data.phone),
          ],
        ),
      ),
    );
  }
}
