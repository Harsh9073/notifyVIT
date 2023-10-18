import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/EventList.dart';
import 'package:flutter_basic/main.dart';

class LoginScreen extends StatelessWidget{
  final _formkey=GlobalKey<FormState>();
  final TextEditingController _email=TextEditingController();
  final TextEditingController _password=TextEditingController();



  signInWithEmailAndPassword()async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text,
          password: _password.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Form(
        key: _formkey,
        child: SingleChildScrollView(

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
                  Text("LOGIN",style: TextStyle(fontFamily: "Font6",fontSize: 36),),

                  SizedBox(
                    height: 10,
                  ),




                  Container(
                    width: 350,
                    height: 50,
                    child: TextFormField(
                      controller: _email,
                      validator:(text){
                        if(text==null || text.isEmpty){
                          return 'Email is empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                          hintText: 'EMAIL ID',
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
                      controller: _password,
                      validator:(text){
                        if(text==null || text.isEmpty){
                          return 'Password is empty';
                        }
                        return null;
                      },
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                          hintText: 'PASSWORD',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                          )

                      ),

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
                    if(_formkey.currentState!.validate()){
                      print('Validation is done');

                    }
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>EventCategories()));
                  },
                      child: Text("LOGIN",
                        style: TextStyle(fontFamily: "Font6",fontSize: 25),))
                ],
              ),
            ),
          ),
      ),

    );
  }

}