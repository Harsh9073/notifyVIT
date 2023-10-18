import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_basic/EventList.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> _handleGoogleSignIn(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final User? user = (await _auth.signInWithCredential(credential)).user;

      // The user is now signed in.
      print('User signed in: ${user?.displayName}');

      // After successful sign-in, navigate to another page.
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => EventCategories()
      ));
    } catch (e) {
      // Handle sign-in errors here
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Sign-In'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _handleGoogleSignIn(context);
          },
          child: Text('Sign in with Google'),
        ),
      ),
    );
  }
}




