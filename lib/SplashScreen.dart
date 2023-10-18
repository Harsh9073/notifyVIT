import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/IntroScreen.dart';
import 'package:flutter_basic/welcomescreen.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> WelcomeScreen()
      ));





  }
    );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lime,Colors.amber],
                  begin: Alignment.topRight,
              end: Alignment.bottomLeft,

            )
          ),

          child: Center(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_alert,
                size: 80,
                color: Colors.blue,),
                Text("notifyVIT",style: TextStyle(fontSize: 34,
                    fontWeight: FontWeight.w700)),
              ],

            ),
          ),

        ),



    );
  }
}