import 'package:flutter/material.dart';

class Feild extends StatelessWidget {
   
   Feild(
      {Key? key,
      this.helpertext,
      required this.control,
      required this.texthint,
      required this.type})
      : super(key: key);
  final control;
  final texthint;
  final type;
  final helpertext;
  //  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return TextFormField( 
   
  
      controller: control,
      autocorrect: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 19, 2, 2)),
            borderRadius: BorderRadius.circular(30)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        labelText: texthint,
        helperText: helpertext,
      ),
       textAlign: TextAlign.center,
       onChanged: (text){
        // _formKey.currentState!.validate();
       },


      validator: (value){
        if (value ==null ||  value.isEmpty){
          return 'Field is required';
        }
        return null;
      },
      keyboardType: type,
    );
  }
}
