import 'package:flutter/material.dart';
import 'package:practice_yesno/config/themes/app_themes.dart';
import 'package:practice_yesno/presentation/screens/chat/chat_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemesApp(optionColor: 6).theme(),
      title: 'Practice Yes No',
      home: const ChatScreen(),
    );
  }
}