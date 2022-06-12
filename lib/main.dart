import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lets_talk/resourses/auth_method.dart';
import 'package:lets_talk/screens/Home_screen.dart';
import 'package:lets_talk/screens/log_in_screen.dart';
import 'package:lets_talk/screens/video_call_screen.dart';
import 'package:lets_talk/utils/colors.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zoom Clone',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        routes: {
          '/login': (context) => const login_screen(),
          '/home': (context) => const Home_screen(),
          '/video_call_screen':(context)=>const videoCallScreen()

        },
        home:StreamBuilder(
          stream: AuthMethods().authChanges,
          builder:(context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            }
            if(snapshot.hasData){
              return Home_screen();
            }
            return login_screen();

          },
        )
    );
  }
}