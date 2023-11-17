import 'package:chattingapp/view/Home.dart';
import 'package:chattingapp/view/LogIn.dart';
//import 'package:chattingapp/view/Log_In.dart';
import 'package:chattingapp/view/SignUp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
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
      debugShowCheckedModeBanner: false,
      routes: {
        "login ":(context)=>LogIn(),
        "SingUp":(context) => SingUp(),
        "chat":(context) => ChatingPage(),
      },
     home: LogIn(),
    );
  }
}
