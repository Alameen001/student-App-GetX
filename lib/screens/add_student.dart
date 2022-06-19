import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stud_management/Models/Db_dataModel.dart';
import 'package:stud_management/functions/functions.dart';
import 'package:stud_management/getxcontrollers/controller.dart';
import 'package:stud_management/screens/list_student.dart';
import 'package:stud_management/screens/textform_field.dart';

var box = Hive.box<StudentModel>("data");
// XFile? img;
// dynamic imagepath;

class AddStudentscreen extends StatelessWidget {
  AddStudentscreen({Key? key}) : super(key: key);

  @override
  final _namecontroller = TextEditingController();

  final _ageController = TextEditingController();

  final _phoneController = TextEditingController();

  final _classcontroller = TextEditingController();

  var _image;
  final MyController controller = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Student Management'),
        centerTitle: true,
        // backgroundColor: Colors.teal
        backgroundColor: Colors.black,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.82,
            width: double.infinity,
     
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              
              child: Container(
                
                decoration: BoxDecoration(
                  // gradient: LinearGradient(
                  //   begin: Alignment.topLeft,
                  //   end: Alignment.bottomRight,
                  //   colors: [
                  //     Colors.black,
                  //     Colors.blue,
                  //     Colors.black,
                  //   ],
                  // ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(115, 26, 19, 47),
                      blurRadius: 20,
                      spreadRadius: 1.0,
                      offset: Offset(0.0, 5.0),
                    ),
                  ],
                  color: Color.fromARGB(255, 214, 223, 222),
                  borderRadius: BorderRadius.circular(20),
                ),
                
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          GetBuilder<MyController>(
                            builder: (controller) {
                              return Container(
                                width: 150,
                                height: 150,
                                // color: Colors.black,
                                decoration: _image == null
                                    ? BoxDecoration(
                                        borderRadius: BorderRadius.circular(500),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage("assets/person.jpeg"),
                                        ),
                                      )
                                    : BoxDecoration(
                                        borderRadius: BorderRadius.circular(500),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.file(File(_image)).image),
                                      ),
                              );
                            },
                          ),
                          Positioned(
                            bottom: 4,
                            right: -7,
                            child: ElevatedButton(
                              onPressed: () {
                                showimage(context);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(Colors.black),
                                shape:
                                    MaterialStateProperty.all(const CircleBorder()),
                              ),
                              child: const Icon(
                                Icons.photo_camera,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: [
                          Feild(
                            control: _namecontroller,
                            texthint: 'name',
                            type: TextInputType.name,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Feild(
                              control: _ageController,
                              texthint: 'age',
                              type: TextInputType.number),
                          SizedBox(
                            height: 10,
                          ),
                          Feild(
                            control: _phoneController,
                            texthint: 'ph',
                            type: TextInputType.number,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Feild(
                            control: _classcontroller,
                            texthint: 'class',
                            type: TextInputType.name,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            backgroundColor: Colors.black,
                            onPressed: () {
                              box.add(addStudentButton());

                              Get.offAll(ListStudent());
                              Get.snackbar("Student", "Student Add",
                                  backgroundColor: Colors.black,
                                  colorText: Colors.white);
                            },
                            child: Text('Add'),
                          ),
                          // FloatingActionButton(
                          //   backgroundColor: Colors.black,
                          //   onPressed: () {
                          //     Navigator.of(context).push(MaterialPageRoute(
                          //       builder: (context) {
                          //         return ListStudent();
                          //       },
                          //     ));
                          //   },

                          //   child: Text('view'),
                          // ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  addStudentButton() {
    return StudentModel(
        name: _namecontroller.text,
        age: _ageController.text,
        Class: _phoneController.text,
        phone: _phoneController.text,
        image: _image);
  }

  showimage(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            title: Column(
              children: [
                Text('Choose Option'),
                // SizedBox(
                //   height: 20,
                // ),
                GetBuilder<MyController>(
                  builder: (_) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () async {
                              var image = await imageSelect();
                              //  setState(() {
                              _image = image;
                              controller.update();
                              //   });
                           Get.back();
                            },
                            icon: Icon(Icons.photo)),
                        IconButton(
                            onPressed: () async {
                              var image = await CameraSelect();
                              // setState(() {
                              _image = image;
                              controller.update();
                              //    });
                              Get.back();
                            },
                            icon: Icon(Icons.camera)),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        });
  }
 
}
