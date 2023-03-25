// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Message {
  const Message({
    required this.sender,
    required this.sms,
  });
  final String sender;
  final String sms;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'sender': sender,
      'sms': sms,
    };
  }

  factory Message.fromJson(Map<String, dynamic> map) {
    return Message(
      sender: map['sender'] as String,
      sms: map['sms'] as String,
    );
  }
}
// dart data class generation