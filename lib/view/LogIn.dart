import 'package:chattingapp/Widgets/SharedComponents.dart';
import 'package:chattingapp/constants.dart';
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children:[
            Container(
                height: 100,
                width: double.infinity,
                child: Image.asset("assets/images/scholar.png")),
            Center(
              child: Text("Scholar Chat",style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontFamily: "pacifico"
              ),),
            ),

            SizedBox(height: 30,),

            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text("LogIn",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                      //fontFamily: "pacifico"
                    ),),
                  ),
                  SizedBox(height: 10,),
                  TextFieldLogIn(hintText: "Email"),
                  SizedBox(height: 10,),
                  TextFieldLogIn(hintText: "Password"),
                  SizedBox(height: 10,),
                  Button(text: "LogIn"),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account ",style: TextStyle(color: Colors.white,fontSize: 15),),
                      GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed("SingUp");
                          },
                          child: Text("REGISTER ",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
                    ],
                  ),
                  // Spacer(flex: 1,),

                ],
              ),
            ),
          ],),
      ),

    );
  }
}

