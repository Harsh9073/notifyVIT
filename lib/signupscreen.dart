import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_basic/EventList.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}
class _SignupPageState extends State<SignupPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signUp() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // User signed up successfully
      // You can add navigation to the next page or perform other actions here
      if (userCredential.user != null) {
        // Navigate to the next page after successful signup
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) {
            return EventCategories(); // Replace 'NextPage' with the name of your next page.
          }),
        );
      }
    } catch (e) {
      // Handle signup errors here
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text("SIGNUP",style: TextStyle(fontFamily: 'Font6',
                    fontWeight: FontWeight.bold,fontSize: 55),),
                Image.asset('asset/Images/login_image.jpg',height: 400,),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email',prefixIcon: Icon(Icons.mail),border: OutlineInputBorder(
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
                  decoration: InputDecoration(labelText: 'Password',prefixIcon: Icon(Icons.lock),border: OutlineInputBorder(
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
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _signUp();
                    }
                  },
                  child: Text('Sign Up',style: TextStyle(fontSize: 25,fontFamily: "Font6",fontWeight: FontWeight.w300),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
