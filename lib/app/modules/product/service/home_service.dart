import 'package:chat_app/src/components/buttons/message/stream_message.dart';
import 'package:chat_app/src/data/message_model.dart';
import 'package:chat_app/src/service/user_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeService {
  static Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await userManage.removeUid();
  }

  static Future<void> delete() async {
    await FirebaseAuth.instance.currentUser!.delete();
    await userManage.removeUid();
  }

  static Future<void> sendMessage(String sms) async {
    final sender = FirebaseAuth.instance.currentUser;
    if (sender != null) {
      final db = FirebaseFirestore.instance;
      final Message message = Message(
        sender: sender.email!,
        sms: sms,
        dateTime: DateTime.now(),
      );
      await db.collection('messages').add(message.toJson());
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> streamMessage() {
    final db = FirebaseFirestore.instance;
    return db
        .collection('messages')
        .orderBy('dateTime', descending: true)
        .snapshots();
  }
}
