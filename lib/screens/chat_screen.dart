// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use, prefer_const_constructors, use_build_context_synchronously

import 'package:flash_data/screens/login_screen.dart';
import 'package:flash_data/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'package:flash_data/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final TextEditingController messageText;
  var savedValue;

  getSavedValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      savedValue = prefs.getString('email');
      print(savedValue);
    });
  }

  @override
  void initState() {
    super.initState();
    getSavedValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "User logged in as :\n",
                              style: TextStyle(fontSize: 20),
                            ),
                            TextSpan(
                                text: savedValue,
                                style: TextStyle(
                                    fontSize: 25, color: Colors.green))
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.remove('email');
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    WelcomeScreen()));
                      },
                      child: const Text(
                        'Log out',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
