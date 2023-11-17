
import 'package:chattingapp/Widgets/SharedComponents.dart';
import 'package:chattingapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class SingUp extends StatefulWidget {
   SingUp({Key? key}) : super(key: key);

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
   bool isloaded=false;

   String? email;

   String? Password;

GlobalKey<FormState> formKey =GlobalKey();

   @override
  Widget build(BuildContext context) {

    return  ModalProgressHUD(
inAsyncCall: isloaded,
      child: Scaffold(
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
                      child: Text("Register",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                        //fontFamily: "pacifico"
                      ),),
                    ),
                    SizedBox(height: 10,),
                    TextFieldLogIn(hintText: "Email",onchange:(data) {
                      email=data;
                    }, ),
                    SizedBox(height: 10,),
                    TextFieldLogIn(hintText: "Password",onchange:(data) {
                      Password =data;
                    },),
                    SizedBox(height: 10,),
                    buttonItem(text: "Register",
                        ontap: ()async{
                        if (formKey.currentState!.validate()) {
                        isloaded=true;
                        setState(() {});
                        try {
                                        await CreateUserAccount();
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
                        Text("I have an account ",style: TextStyle(color: Colors.white,fontSize: 15),),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop(context);
                          },
                            child: Text("Log IN ",
                              style: TextStyle(
                                  color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
                      ],
                    ),
                    // Spacer(flex: 1,),

                  ],
                ),
              ),
            ],),
          ),
        ),

      ),
    );
  }



   Future<void> CreateUserAccount() async {
       await FirebaseAuth.instance.createUserWithEmailAndPassword(
       email: email!,
       password:Password!,
     );
   }
}
