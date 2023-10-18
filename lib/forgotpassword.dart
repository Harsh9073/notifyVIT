import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  void _resetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: _emailController.text);
      // Password reset email sent successfully
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Password reset email sent. Check your email for instructions.'),
      ));
    } catch (e) {
      // Handle password reset errors here
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Password reset failed. Please check your email and try again.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
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
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _resetPassword();
                    }
                  },
                  child: Text('Reset Password'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
