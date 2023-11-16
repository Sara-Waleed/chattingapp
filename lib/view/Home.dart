import 'package:chattingapp/Widgets/SharedComponents.dart';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/models/gettingDataModel.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ChatingPage extends StatelessWidget {
   ChatingPage({Key? key}) : super(key: key);
   // to get or access the collection by its name:
   CollectionReference message = FirebaseFirestore.instance.collection(KDatabase);
  TextEditingController control=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream:  message.snapshots(),
        builder: (context, snapshot) {
         if(snapshot.hasData){
           List<Message> messagesList=[];
           for(int i=0; i<snapshot.data!.docs.length;i++){
             messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
           }
           return Scaffold(
               appBar: AppBar(
                 automaticallyImplyLeading: false,
                 backgroundColor: KPrimaryColor,
                 title:Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Image.asset(KLogo,height: 50,),
                     Text("ChatApp",),
                   ],
                 ),
                 centerTitle: true,
               ),
               body:Column(
                 children: [
                   Expanded(
                     child: ListView.builder(
                       itemBuilder: (context, index) {
                         return Align(
                             alignment: Alignment.centerLeft,
                             child: chattingbubble(messaage: messagesList[index],));
                       },
                       itemCount: messagesList.length,
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(16.0),
                     child: TextField(
                       controller: control,
                       onSubmitted: (data){
                         message.add({
                           'message':data,
                         });
                         control.clear();
                       },
                       decoration: InputDecoration(
                           hintText: "Send Message",
                           suffixIcon:Icon(Icons.send,color:KPrimaryColor ,),
                           border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(16),
                           ),
                           enabledBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(16),
                             borderSide: BorderSide(color: KPrimaryColor),
                           )
                       ),

                     ),
                   ),
                 ],
               )




           );
         }
  else{
   return Text("Loading...");
         }

        },);
  }
}
