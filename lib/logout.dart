import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_basic/welcomescreen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogoutPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> _handleSignOut(BuildContext context) async {
    try {
      // Sign out of Firebase
      await _auth.signOut();

      // Sign out of Google Sign-In
      await googleSignIn.signOut();

      // After successful sign-out, navigate to the home page or another appropriate screen.
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => WelcomeScreen(), // Replace 'HomePage' with the name of your home screen.
        ),
      );
    } catch (e) {
      // Handle sign-out errors here
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log Out'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _handleSignOut(context);
          },
          child: Text('Sign Out'),
        ),
      ),
    );
  }
}


