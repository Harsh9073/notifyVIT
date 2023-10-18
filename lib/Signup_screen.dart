import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'EventList.dart';

class Signup_Screen extends StatelessWidget{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(child: Text("notifyVIT",
                style: TextStyle(fontFamily: 'Font6',
                    fontWeight: FontWeight.bold,fontSize: 55),)
              ),
              Image.asset('asset/Images/login_image.jpg',height: 400,),
              Text("SIGNUP",style: TextStyle(fontFamily: "Font6",fontSize: 36),),
              Container(
                width: 350,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_sharp),
                      hintText: "NAME",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      )
                  ),

                ),
              ),
              SizedBox(
                height: 10,
              ),




              Container(
                width: 350,
                height: 50,
                child: TextFormField(

                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      hintText: 'EMAIL ID',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      )
                  ),
                  validator: (value) {
                    if (value==null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },

                ),
              ),
              SizedBox(
                height: 10,
              ),


              Container(
                width: 350,
                height: 50,
                child: TextFormField(

                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'PASSWORD',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      )

                  ),
                  validator: (value) {
                    if (value==null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  cursorColor: Colors.yellow,

                ),
              ),
              Align(alignment: Alignment.centerLeft ,
                  child: TextButton(onPressed: (){},
                      child: Text("Forgot Password?",
                        style: TextStyle(fontFamily: 'Font6',fontSize: 18),))),
              SizedBox(
                height: 15,

              ),
              ElevatedButton(onPressed: (){

              },
                  child: Text("SIGNUP",
                    style: TextStyle(fontFamily: "Font6",fontSize: 25),))
            ],
          ),
        ),
      ),
    );

  }

}