// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, use_build_context_synchronously

import 'package:flash_data/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_data/constants.dart';
import 'package:flash_data/Components/Round.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              height: 100,
              child: Image.asset('images/logo.png'),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
                controller: _email,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your email')),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                obscureText: true,
                controller: _password,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password')),
            SizedBox(
              height: 24.0,
            ),
            Roundedbutton(
                colour: Colors.blueAccent,
                title: 'Login',
                onpressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  var email = prefs.setString('email', _email.text);
                  print(email);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ChatScreen()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
