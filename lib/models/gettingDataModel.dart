
import 'package:chattingapp/constants.dart';

class Message {
  final String message;
 // final String id;
  Message(this.message);

  factory Message.fromJson(jsonData) {
    return Message(jsonData[KDatabase]);
  }
}