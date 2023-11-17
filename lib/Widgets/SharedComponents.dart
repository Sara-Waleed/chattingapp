import 'package:chattingapp/constants.dart';
import 'package:chattingapp/models/gettingDataModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldLogIn extends StatelessWidget {
   TextFieldLogIn({
     this.hintText,
     this.onchange,
     this.obscureText=false,
    super.key,
  });
   bool obscureText;
final String? hintText;
final Function(String)? onchange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (value) {
        if(value!.isEmpty){
          return "value is wrong";
        }
        return "";
      },
     onChanged: onchange,
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

class buttonItem extends StatelessWidget {
  buttonItem({
    this.text,
     this.ontap,
    super.key,
  });
  final String? text;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontap ,
      child: Container(
        width:400,
        height: 50,
        child: Center(child: Text("$text",style: TextStyle(color: Colors.black,fontSize: 20),)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),

      ),
    );
  }
}

//*********************
void showingSnapBar(BuildContext context,String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content:
    Text(message),),);
}
//******************************
class chattingbubble extends StatelessWidget {
   chattingbubble({
    super.key,
      required this.messaage
  });
final  Message messaage;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      padding: EdgeInsets.only(left: 16,top: 16,bottom: 16,right: 32),
      decoration: BoxDecoration(
          color: KPrimaryColor,
          borderRadius: BorderRadius.only(
              topLeft:Radius.circular(30),
              topRight:Radius.circular(30),
              bottomRight: Radius.circular(30)
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(messaage.message,style: TextStyle(color: Colors.white,),),
      ),

    );
  }
}
//***************************
class chattingbubbleforfriend extends StatelessWidget {
  chattingbubbleforfriend({
    super.key,
    required this.messaage
  });
  final  Message messaage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        padding: EdgeInsets.only(left: 16,top: 16,bottom: 16,right: 32),
        decoration: BoxDecoration(
            color: Color(0xff006D84),
            borderRadius: BorderRadius.only(
                topLeft:Radius.circular(30),
                topRight:Radius.circular(30),
                bottomLeft: Radius.circular(30)
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(messaage.message,style: TextStyle(color: Colors.white,),),
        ),

      ),
    );
  }
}