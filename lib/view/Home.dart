import 'package:chattingapp/Widgets/SharedComponents.dart';
import 'package:chattingapp/constants.dart';
import 'package:chattingapp/models/gettingDataModel.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ChatingPage extends StatelessWidget {
   ChatingPage({Key? key}) : super(key: key);
   //to get the end of the list view:
   final controller2=ScrollController();
   // to get or access the collection by its name:
   CollectionReference message =
             FirebaseFirestore.instance.collection(KDatabase);
  TextEditingController control = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var emaill= ModalRoute.of(context)!.settings.arguments ;
    return StreamBuilder<QuerySnapshot>(
        stream:  message.orderBy(KCreatedAt,descending: true).snapshots(),
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
                       reverse: true,
                       controller: controller2,
                       itemBuilder: (context, index) {
                         return
                           messagesList[index].id== emaill ?
                           Align(
                             alignment: Alignment.centerLeft,
                             child: chattingbubble(messaage: messagesList[index],)) :
                           Align(
                             alignment: Alignment.centerLeft,
                           child: chattingbubbleforfriend(messaage: messagesList[index]),
                         ) ;
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
                           KDatabase:data,
                           KCreatedAt :DateTime.now(),
                           'id': emaill,
                         });
                         control.clear();
                         controller2.animateTo(
                             0,
                             duration: Duration(milliseconds: 500),
                             curve: Curves.easeIn
                         );
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
