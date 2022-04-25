import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:studybubble/home.dart';
import 'package:studybubble/reusable_widget.dart';
import 'package:studybubble/signup_screen.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController _passwordTextController =TextEditingController();
  TextEditingController _usernameTextController =TextEditingController();
  TextEditingController _emailTextController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text("Welcom to Study Bubble"),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.fromLTRB(60, MediaQuery.of(context).size.height*.1, 50, 0)
         , child: Column(
           children:<Widget> [
             logoWidget("assets/StudyBubbleLogo.jpg"),
             SizedBox(
               height: 30,
             ),
             reusableTextField("Enter UserName", Icons.person_outline, false,_emailTextController )
           ,SizedBox(
               height: 30,
             ),
               reusableTextField("Enter Password", Icons.lock_outline, true,_passwordTextController )
              ,SizedBox(
               height: 30,
             ),
             signInSignUpButton(context, true, (){
               FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text, 
               password: _passwordTextController.text).then((value) => {
                 Navigator.push(context,
                MaterialPageRoute(builder: (context) => home()))
               });
                
             }) ,
             signUpOption()
             ],
           
         ),),
        ),
      ) ,
    );
  }
 Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

}
