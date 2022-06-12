
import 'package:lets_talk/resourses/fire_store.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class History_Meeting_Screen extends StatefulWidget {
  const History_Meeting_Screen({Key? key}) : super(key: key);

  @override
  State<History_Meeting_Screen> createState() => _History_Meeting_ScreenState();
}

class _History_Meeting_ScreenState extends State<History_Meeting_Screen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: fireStoreMethod().meetingHistory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: (snapshot.data! as dynamic).docs.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                    'Room name ${(snapshot.data! as dynamic).docs[index]['meetingName']} '),
                subtitle: Text(
                    'join on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}'),
              ));
        });
  }
}
