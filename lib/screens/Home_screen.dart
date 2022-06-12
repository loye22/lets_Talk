import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lets_talk/resourses/auth_method.dart';
import 'package:lets_talk/screens/history_meeting_screen.dart';
import 'package:lets_talk/utils/colors.dart';
import 'package:lets_talk/widgets/custom_button.dart';

import '../widgets/home_meeting_button.dart';
import 'meething_screen.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  int _page = 0;


  onPageChage(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
     MeetingScreen(),
    const History_Meeting_Screen(),
    const Text('constact'),
     CustomButton(text: 'Log out', onPressed:  () => AuthMethods().signOut()),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            title: const Text('Meet & Chat'),
            centerTitle: true,
          ),
          body: pages[_page],
          bottomNavigationBar: BottomNavigationBar(
            onTap: onPageChage,
            type: BottomNavigationBarType.fixed,
            unselectedFontSize: 14,
            currentIndex: _page,
            backgroundColor: footerColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.comment_bank), label: 'Meet & Chat' ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.lock_clock), label: 'Meetings'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: 'Contacts'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined), label: 'Settings'),
                       ],
          )),
    );
  }
}

