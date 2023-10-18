import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_basic/EventList.dart';
import 'package:flutter_basic/forgotpassword.dart';
import 'package:flutter_basic/try.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'googlesignin.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // User logged in successfully
      if (userCredential.user != null) {
        // Navigate to the next page after successful login
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) {
            return EventCategories(); // Replace 'NextPage' with the name of your next page.
          }),
        );
      }
    } catch (e) {
      // Handle login errors here
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Invalid Credential'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text("LOGIN",style: TextStyle(fontFamily: "Font6",fontSize: 36),),
                Image.asset('asset/Images/login_image.jpg',height: 400,),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email',prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      )),
                  validator: (value) {
                    if (value==null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password',prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      )),
                  obscureText: true,
                  validator: (value) {
                    if (value==null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                Align(alignment: Alignment.centerLeft ,
                    child: TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordPage()));
                    },
                        child: Text("Forgot Password?",
                          style: TextStyle(fontFamily: 'Font6',fontSize: 18),))),
                Align(alignment: Alignment.centerLeft ,
                    child: TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>GoogleSignInPage()));
                    },
                        child: Text("Sign-In with google",
                          style: TextStyle(fontFamily: 'Font6',fontSize: 18),))),
                SizedBox(height: 15),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _login();
                    }
                  },
                  child: Text('Login',style: TextStyle(fontSize: 25,fontFamily: "Font6",fontWeight: FontWeight.w300),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
