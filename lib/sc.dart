import 'package:flutter/cupertino.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/IntroScreen.dart';
import 'package:flutter_basic/welcomescreen.dart';
import 'package:page_transition/page_transition.dart';
class splshscreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash:
        Column(children: [
          Container(
              child: Image.asset('asset/Images/img1.png'),
            color: Colors.white,
          ),




        ],
        ),
        splashIconSize: 600,
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.white,
        duration: 2000 ,
        pageTransitionType: PageTransitionType.leftToRightWithFade,
        nextScreen: WelcomeScreen());
  }



}