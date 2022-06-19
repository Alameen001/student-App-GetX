import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:stud_management/Models/Db_dataModel.dart';
import 'package:stud_management/getxcontrollers/controller.dart';
import 'package:stud_management/screens/student_details.dart';

import 'add_student.dart';

var allstudentdata = Hive.box<StudentModel>("data");

class ListStudent extends StatelessWidget {
  ListStudent({
    Key? key,
  }) : super(key: key);

  final MyController controller = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    // List<StudentModel> model = allstudentdata.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('List student'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: GetBuilder<MyController>(builder: (controller) {
        print('rendering');
        List<StudentModel> model = allstudentdata.values.toList();

        return ListView.separated(
          itemCount: model.length,
          itemBuilder: (context, index) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    Get.to(StudentDetails(index: index));
                  },
                  leading: CircleAvatar(
                    radius: 30,
                    child: Image.file(File(model[index].image)),
                  ),
                  title: Text(model[index].name),
                  subtitle: Text(model[index].name),
                  trailing: IconButton(
                    onPressed: () {
                      Get.snackbar("Deleate", "Student Deleated",
                          snackPosition: SnackPosition.BOTTOM );

                      controller.DeleteStudent(index);

                      // box.deleteAt(index);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                thickness: 3,
              ),
            );
          },
        );
      }),

      // body: ListView.builder(

      //  itemCount: model.length,
      //   itemBuilder: (context, index) {
      //   return Padding(
      //     padding: const EdgeInsets.all(10.0),
      //     child: Container(
      //       height: MediaQuery.of(context).size.height*0.3,
      //       width: MediaQuery.of(context).size.width,
      //       child: Card(

      //         elevation: 12,
      //         color: Colors.black,
      //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      //         child: CircleAvatar(

      //         ),

      //       ),
      //     ),
      //   );
      // },),
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
