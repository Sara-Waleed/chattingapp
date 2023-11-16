import 'package:chattingapp/Widgets/SharedComponents.dart';
import 'package:chattingapp/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
   LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
 GlobalKey<FormState> formKey=GlobalKey();

 String? email,password;
 bool isloaded=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
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
                    TextFieldLogIn(hintText: "Email",onchange: (data){
                      email=data;
                    }),
                    SizedBox(height: 10,),
                    TextFieldLogIn(hintText: "Password",onchange: (data){
                      password=data;
                    }),
                    SizedBox(height: 10,),
                    buttonItem(text: "LogIn",
                        ontap: ()async{
    if (formKey.currentState!.validate()) {
    isloaded=true;
    setState(() {});
    try {
    await LogInAccount();
    Navigator.of(context).pushNamed("chat");
    } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
    showingSnapBar(context,"The password provided is too weak." );
    } else if (e.code == 'email-already-in-use') {
    showingSnapBar(context, "The account already exists for that email.");
    }
    } catch (error) {
    showingSnapBar(context, "there was an error");
    }
    isloaded=false;
    setState(() {});
    }else{}
                    }),
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
      ),

    );
  }


 Future<void> LogInAccount() async {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
     email: email!,
     password:password!,
   );
 }

}

