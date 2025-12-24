import 'package:flutter/material.dart';

import '../screen/user_list_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  splashFounction() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      splashFounction();
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => UserListScreen(),
      ),
    );
  }

  @override
  void initState() {
    splashFounction();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/notes_logo.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}