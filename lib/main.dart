import 'package:chattingapp/view/LogIn.dart';
//import 'package:chattingapp/view/Log_In.dart';
import 'package:chattingapp/view/SignUp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "login ":(context)=>LogIn(),
        "SingUp":(context) => SingUp(),
      },
      debugShowCheckedModeBanner: false,
     home: LogIn(),
    );
  }
}
