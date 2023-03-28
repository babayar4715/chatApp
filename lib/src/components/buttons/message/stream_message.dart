import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              final message = snapshot.data.docs.reversed as Iterable;
              final widgets = message
                  .map((e) =>
                      Text(e.data()['sms'], style: TextStyle(fontSize: 22)))
                  .toList();
              return ListView(
                children: widgets,
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
