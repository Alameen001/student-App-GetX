import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:stud_management/Models/Db_dataModel.dart';
import 'package:stud_management/getxcontrollers/controller.dart';
import 'package:stud_management/screens/student_details.dart';

import 'add_student.dart';

class ListStudent extends StatelessWidget {
  ListStudent({
    Key? key,
  }) : super(key: key);

  var allstudentdata = Hive.box<StudentModel>("data");

  final MyController controller = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    List<StudentModel> model = allstudentdata.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('List student'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: model.length,
        itemBuilder: (context, index) {
          return Center(
            child: ListTile(
              onTap: () {
                Get.to(StudentDetails(index: index));
              },
              leading: CircleAvatar(
                child: Image.file(File(model[index].image)),
              ),
              title: Text(model[index].name),
              subtitle: Text(model[index].name),
              trailing: GetBuilder<MyController>(
                init: MyController(),
              
                builder: (data) {
                  return IconButton(
                    onPressed: () {
                       Get.snackbar("Deleate", "Student Deleated");
                     controller. DeleteStudent(index);
                          controller.update();

                      // box.deleteAt(index);
                   
                    
                      
                    },
                    icon: Icon(Icons.delete),
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Get.to(AddStudentscreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
