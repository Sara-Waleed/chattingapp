import 'package:chattingapp/view/LogIn.dart';
//import 'package:chattingapp/view/Log_In.dart';
import 'package:chattingapp/view/SignUp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
