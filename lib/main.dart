// ignore_for_file: prefer_const_constructors

import 'package:flash_data/screens/chat_screen.dart';
import 'package:flash_data/screens/login_screen.dart';
import 'package:flash_data/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_data/screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');
  runApp(
    MaterialApp(home: email == null ? WelcomeScreen() : ChatScreen()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
      },
    );
  }
}
