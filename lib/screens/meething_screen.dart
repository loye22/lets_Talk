import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lets_talk/resourses/jitis_meetiing_methods.dart';

import '../widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);

  final jitis_Meeting _jitis_meeting = jitis_Meeting();

   createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitis_meeting.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context){
     Navigator.pushNamed(context, '/video_call_screen');

  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPress: createNewMeeting,
              text: 'New Metting',
              icon: Icons.video_call,
            ),
            HomeMeetingButton(
              onPress: ()=> joinMeeting(context),
              text: 'Join Metting',
              icon: Icons.add_box_rounded,
            ),
            HomeMeetingButton(
              onPress: () {},
              text: 'Scedual',
              icon: Icons.calendar_today,
            ),
            HomeMeetingButton(
              onPress: () {},
              text: 'Share Screen',
              icon: Icons.arrow_upward_rounded,
            )
          ],
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Create / Join  Merting With Click',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        )
      ],
    );
  }
}
