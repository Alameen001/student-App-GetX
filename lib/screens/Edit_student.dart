import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_management/Models/Db_dataModel.dart';
import 'package:stud_management/getxcontrollers/controller.dart';
import 'package:stud_management/screens/add_student.dart';
import 'package:stud_management/screens/list_student.dart';
import 'package:stud_management/screens/student_details.dart';
import 'package:stud_management/screens/textform_field.dart';

import '../functions/functions.dart';

class EditStudent extends StatelessWidget {
  EditStudent({Key? key, required this.index}) : super(key: key);
  final int index;

  final MyController  controller = Get.put(MyController());

  final _namecontroller = TextEditingController();

  final _ageController = TextEditingController();

  final _phoneController = TextEditingController();

  final _classcontroller = TextEditingController();

  var _image;
  List<StudentModel> model = allstudentdata.values.toList();
  @override
  Widget build(BuildContext context) {
    final data = model[index];
    _namecontroller.text = data.name;
    _ageController.text = data.age;
     _classcontroller.text = data.Class;
    _phoneController.text = data.phone;
   
    _image =data.image;

     final _formKey = GlobalKey<FormState>();


    return Scaffold( 
    //  backgroundColor: Colors.wg,
      body: SingleChildScrollView(
        child: SafeArea(
          
            child: Form(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
               
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  GetBuilder<MyController>(
                    builder: (_) {
                      return Stack(
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            // color: Colors.black,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(300),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.file(File(_image))
                                        .image)),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: ElevatedButton(
                              onPressed: () {
                                showEditImage(context);
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(CircleBorder()),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black)),
                              child: Icon(Icons.photo_camera),
                            ),
                          ),
                        ],
                      );
                      //    return Container(
                      //   width: 150,
                      //   height: 150,
                      //   // color: Colors.black,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(300),
                      //       image: DecorationImage(
                      //           fit: BoxFit.cover,
                      //           image: Image.file(File(_image)).image)),
                      // );
                    },
                  ),
                 Form(
                  key: _formKey,
                   child: Column(
                    children: [
                       SizedBox(
                      height: 20,
                    ),
                    Feild(
                      control: _namecontroller,
                      texthint: 'Name',
                      type: TextInputType.name,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Feild(
                      control: _ageController,
                      texthint: 'Age',
                      type: TextInputType.number,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Feild(
                      control: _classcontroller,
                      texthint: 'C lass',
                      type: TextInputType.name,
                    ),
                   
                    SizedBox(
                      height: 10,
                    ),
                     Feild(
                      control: _phoneController,
                      texthint: 'Phpne',
                      type: TextInputType.number,
                    ),
                    
                    SizedBox(
                      height: 10,
                    ),
                    ],
                   ),
                 ),
                  GetBuilder<MyController>(
                    builder: (_) {
                      return Column(
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30))),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black)),
                              onPressed: () {
                                if(_formKey.currentState!.validate()==true){
                                  box.putAt(index, updateButton());
                                controller.update();
                                Get.snackbar("Student Updated","" ,
                                backgroundColor: Colors.black,
                                colorText: Colors.white,
                                icon: Icon(Icons.person, color: Colors.white),
                                duration: Duration(seconds: 1),
                                snackPosition: SnackPosition.BOTTOM
                                );
              
                                Get.offAll(ListStudent());
                                print("uuuuuupppp..........................date");
                                }
                              },
                              child: Text('Update Student')),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ))),
      ),
    );
  }

  updateButton() {
    return StudentModel(
        name: _namecontroller.text,
        age: _ageController.text,
        Class: _classcontroller.text,
        phone: _phoneController.text,
        image: _image);
  }

  showEditImage(context) {
    return showDialog(
        context: context,
        builder: (BuildContext contex) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            title: Column(
              children: [
                Text("Choose Option"),
                GetBuilder<MyController>(
                  builder: (_) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () async {
                              var image = await imageSelect();
                              _image = image;
                              controller.update();
                              Get.back();
                            },
                            icon: Icon(Icons.camera)),
                        IconButton(
                          onPressed: () async {
                            var image = await CameraSelect();
                            _image = image;
                            controller.update();
                            Get.back();
                          },
                          icon: Icon(Icons.photo_album),
                        ),
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
