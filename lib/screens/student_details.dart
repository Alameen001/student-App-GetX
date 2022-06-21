import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(EditStudent(index: index));
              },
              icon: Icon(Icons.edit)),
        ],
      ),
      // body: Container(
      //   child: Column(
      //     children: [
      //       Container(
      //         width: 250,
      //         height: 300,
      //         child: Image.file(File(data.image)),
      //       ),
      //       Text(data.name),
      //       Text(data.age),
      //       Text(data.Class),
      //       Text(data.phone),
      //     ],
      //   ),
      // ),




      body: Center(

        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(96, 0, 0, 0),
                  blurRadius: 20,
                  spreadRadius: 1.0,
                )
              ]),
              child: Card(
                elevation: 12,
                color: Color.fromARGB(255, 214, 223, 222),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Positioned(
                  top: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200, left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name : ${data.name}",
                          style: TextStyle(fontSize: 28,letterSpacing: 2),
                        ),
                        DividerM(),
                        Text(
                          "Age: ${data.age}",
                          style: TextStyle(fontSize: 28,letterSpacing: 2),
                        ),
                        DividerM(),
                        Text(
                          "Class: ${data.Class}",
                          style: TextStyle(fontSize: 28,letterSpacing: 2),
                        ),
                        DividerM(),
                        Text(
                          "Phone: ${data.phone}",
                          style: TextStyle(fontSize: 28,letterSpacing: 2),
                        ),
                        DividerM()
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 110,
              top: 15,
              child: Container(
                width: 150,
                height: 150,
                // color: Colors.black,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(500),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.file(File(data.image)).image),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding DividerM() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Divider(
        thickness: 3,
      ),
    );
  }
}
