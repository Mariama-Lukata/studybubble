import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studybubble/home.dart';
import 'package:studybubble/login.dart';
import 'package:studybubble/reusable_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          child: SingleChildScrollView(
              child: Padding(
        padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            reusableTextField("Enter UserName", Icons.person_outline, false,
                _userNameTextController),
            const SizedBox(
              height: 20,
            ),
            reusableTextField("Enter Email Id", Icons.person_outline, false,
                _emailTextController),
            const SizedBox(
              height: 20,
            ),
            reusableTextField("Enter Password", Icons.lock_outlined, true,
                _passwordTextController),
            const SizedBox(
              height: 20,
            ),
            signInSignUpButton(context, false, () async {
              if (_emailTextController.text.isEmpty ||
                  _passwordTextController.text.isEmpty ||
                  _userNameTextController.text.isEmpty) {
                createAlertDialog(context, "Empty");
              }
              User? user = FirebaseAuth.instance.currentUser;
              await FirebaseFirestore.instance
                  .collection("user")
                  .doc()
                  .set({
              
                "email": _emailTextController.text,
                "password": _passwordTextController.text,
                "username": _userNameTextController.text
              }).onError((error, stackTrace) {
                   createAlertDialog(context,
                    "Incorrect,Passwords must be at least 6 characters");
              });
              FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text)
                  .then((value) {
                print("sign up successfull");
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => login()));
              }).onError((error, stackTrace) {
                createAlertDialog(context,
                    "Incorrect,Passwords must be at least 6 characters");
              });
            })
          ],
        ),
      ))),
    );
  }
}
