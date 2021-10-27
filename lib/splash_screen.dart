import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vcrs/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState(){
    super.initState();
    Timer(const Duration(seconds: 3),
            ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomePage()))
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset("assets/vcrs.jpg"),
    );
  }
}
