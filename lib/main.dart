import 'package:flutter/material.dart';

import 'pages/1-welcome.dart';
import 'pages/2-phone.dart';
import 'pages/3-otp.dart';
import 'pages/4-dis.dart';
import 'pages/5-chat.dart';
import 'pages/6-name.dart';
import 'pages/7-two.dart';
import 'pages/8-story.dart';
import 'pages/9-call.dart';
import 'pages/10-prof.dart';
import 'pages/11-new.dart';
import 'pages/12-massg.dart';
import 'pages/13-prvt.dart';
import 'pages/14-sttng.dart';
import 'pages/15-plus.dart'; 
import 'pages/16-frnd.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Black Door',
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/phone': (context) => const PhonePage(),
        '/otp': (context) => const OtpPage(),
        '/dis': (context) => const DiscoverPage(),
        '/chat': (context) => const ChatPage(),
        '/name': (context) => const NamePage(),
        '/two': (context) => const TwoPage(),
        '/story': (context) => const StoryPage(),
        '/call': (context) => const CallPage(),
        '/prof': (context) => ProfilePage(), 
        '/new': (context) => const NewGroupPage(),
        '/massg': (context) => const MassgPage(),
        '/prvt': (context) => const PrvtPage(),
        '/sttng': (context) => const SttngPage(),
        
        // استخدام SelectUserPage
        '/plus': (context) => const SelectUserPage(), 
        
        // استخدام FriendsPage (عشان تطابق الاسم اللي في ملف 16)
        '/frnd': (context) => const FriendsPage(), 
      },
    );
  }
}