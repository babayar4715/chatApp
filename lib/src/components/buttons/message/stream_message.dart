import 'package:chat_app/src/data/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StreamMessage extends StatelessWidget {
  const StreamMessage(
    this.streamMessage, {
    super.key,
  });

  final Stream<QuerySnapshot<Map<String, dynamic>>> streamMessage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: StreamBuilder(
          stream: streamMessage,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              final message = (snapshot.data.docs.reversed as Iterable).map(
                // there are we have a reversed object that we can use it for an a row in a message that we can devide this by date etc.
                (e) => Message.fromJson(e.data())
                  ..isMy = e.data()['sender'] ==
                      FirebaseAuth.instance.currentUser?.email,
              );

              return ListView(
                children: message.map((e) => MessageWidget(e)).toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  const MessageWidget(this.message, {super.key});

  final Message message;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context).colorScheme;
    // it is a ne widget that color scheme we can use it like htis on a situation on
    return Padding(
      padding: EdgeInsets.fromLTRB(
        !message.isMy! ? 10 : width / 4,
        // if there ar at first we gave with mark it means that it is not mine
        // there are we give it for that the message of other mans come from antoehr
        // side to devide and know it is that others message thn mine
        7,
        message.isMy! ? 10 : width / 4,
        7,
      ),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: message.isMy! ? Radius.circular(25) : Radius.circular(0),
            topRight: !message.isMy! ? Radius.circular(25) : Radius.circular(0),
          ),
        ),
        elevation: 8,
        shadowColor: Colors.black,
        color: message.isMy! ? theme.primary : theme.onPrimaryContainer,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              !message.isMy!
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          message.sender,
                          style: TextStyle(
                            color: theme.primary,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              Text(
                message.sms,
                style: TextStyle(
                  fontSize: 20,
                  height: 1.4,
                  color: message.isMy! ? Colors.white : null,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    DateFormat('M/dd/hh:mm').format(message.dateTime),
                    style: TextStyle(
                      fontSize: 14,
                      color: message.isMy! ? Colors.white : null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
