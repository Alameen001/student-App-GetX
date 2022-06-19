import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:stud_management/screens/add_student.dart';

class MyController extends GetxController {
  var stateimage;

  void addstudent(model) {
    box.add(model);
  }

  void getdisplayimage(image) {
    stateimage = image;
  }
void DeleteStudent(value){
  box.deleteAt(value);
  print('hello');
  update();
    //  value.update();
}

}
