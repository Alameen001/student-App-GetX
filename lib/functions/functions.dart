import 'package:image_picker/image_picker.dart';
import 'package:stud_management/screens/add_student.dart';

// Future imageSelect() async{
// final ImagePicker picker = ImagePicker();
// img= await picker.pickImage(source: ImageSource.gallery);
// if(img != null){
  
//   imagepath =img!.path;
// }else{
//   return null;
// }
  

    

// }

// Future Camera() async{

// final ImagePicker picker = ImagePicker();
  
// img = await picker.pickImage(source: ImageSource.camera);
// if(img != null){
  
//   imagepath =img!.path;
// }else{
//   return null;
// }
  

   

// }
Future<String> imageSelect() async {
  XFile? img = await ImagePicker().pickImage(source: ImageSource.gallery);

  return img!.path;
}
Future<String> CameraSelect() async {
  XFile? img = await ImagePicker().pickImage(source: ImageSource.camera);

  return img!.path;
}

