import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/IntroScreen.dart';
import 'package:flutter_basic/LoginScreen.dart';
import 'package:flutter_basic/Signup_screen.dart';
import 'package:flutter_basic/login_screen.dart';
import 'package:flutter_basic/signupscreen.dart';
import 'package:page_transition/page_transition.dart';

class WelcomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('asset/Images/img1.png',height: 600,),
            Column(
              children: [

                Text("WELCOME VITIANS",
                    style: TextStyle(fontFamily: 'Font6',fontWeight: FontWeight.bold,fontSize: 35)),
                Text("Get notified for upcoming events",
                    style: TextStyle(fontFamily: 'Font6',fontWeight: FontWeight.w600,fontSize: 20,)),
                Text("seminars and workshops",style: TextStyle(fontFamily: 'Font6',fontWeight: FontWeight.w600,fontSize: 20,))
                

              ],

            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed:(){
                  Navigator.push(context, CupertinoPageRoute(builder: (context)=>LoginPage()),);
                },child: Text('LOGIN',style: TextStyle(fontFamily: 'Font5',fontSize: 25),),),




                ElevatedButton(onPressed: (){
                  Navigator.push(context, CupertinoPageRoute(builder: (context)=> SignupPage()));
                }, child: Text("SIGNUP",style: TextStyle(fontSize: 25,fontFamily: "Font5")))
              ],
            )
          ],
        ),

      ),
      
    );
  }
  
}