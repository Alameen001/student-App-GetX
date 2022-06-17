import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stud_management/Models/Db_dataModel.dart';
import 'package:stud_management/getxcontrollers/controller.dart';
import 'package:stud_management/screens/add_student.dart';
import 'package:stud_management/screens/list_student.dart';
import 'package:stud_management/screens/textform_field.dart';

import '../functions/functions.dart';

class EditStudent extends StatelessWidget {
  EditStudent({Key? key, required this.index}) : super(key: key);
  final int index;



final MyController controller = Get.put(MyController());


  final _namecontroller = TextEditingController();

  final _ageController = TextEditingController();

  final _phoneController = TextEditingController();

  final _classcontroller = TextEditingController();

  var _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Form(
            child: Column(
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
              type: TextInputType.number,
            ),
            SizedBox(
              height: 10,
            ),
            Feild(
              control: _phoneController,
              texthint: 'ph',
              type: null,
            ),
            SizedBox(
              height: 10,
            ),
            Feild(
              control: _classcontroller,
              texthint: 'class',
              type: null,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  var image = await imageSelect();

                  _image = image;
                  controller.update();
                },
                child: Text('Update Image')),
            ElevatedButton(
                onPressed: () {
                  box.putAt(index, updateButton());
                  controller.update();

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return ListStudent();
                    },
                  ));
                },
                child: Text('Update Student'))
          ],
        )),
      )),
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
}
