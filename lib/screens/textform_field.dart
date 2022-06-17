import 'package:flutter/material.dart';

class Feild extends StatelessWidget {
  const Feild({Key? key, required this.control, required this.texthint,required this.type})
      : super(key: key);
  final control;
  final texthint;
  final type;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: control,
        decoration: InputDecoration(
          
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(30)),
     
          
         
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          hintText: texthint,
          
        ),
        keyboardType: type,
      ),
    );
  }
}