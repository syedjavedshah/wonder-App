import 'package:flutter/material.dart';

import 'home_screen.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      print("initstae called");
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_)=>HomeScreen()));
    });
  }

  @override
  void dispose() {
    print("Disposed called");
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('welcome',
                style: TextStyle(
                    fontSize: 30
                ),),
            )
          ],
        ),
      ),
    );
  }
}
