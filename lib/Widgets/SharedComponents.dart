import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldLogIn extends StatelessWidget {
   TextFieldLogIn({
     this.hintText,
    super.key,
  });
String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),

    );
  }
}

//*****************************

class Button extends StatelessWidget {
  Button({
    this.text,
    super.key,
  });
  String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:400,
      height: 50,
      child: Center(child: Text("$text",style: TextStyle(color: Colors.black,fontSize: 20),)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),

    );
  }
}

