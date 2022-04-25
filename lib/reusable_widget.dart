

import 'package:flutter/material.dart';

Image logoWidget(String imagename){
  return Image.asset(
    imagename,
    fit:BoxFit.fitWidth,
    width: 240,
    height: 240,
  );
}

TextField reusableTextField(String text,IconData icon,
 bool isPasswordType ,TextEditingController controller ){
 return TextField(controller: controller,
 obscureText: isPasswordType,
 enableSuggestions: !isPasswordType,
 autocorrect: !isPasswordType,
 cursorColor: Colors.lightGreenAccent,
 style: TextStyle(color: Colors.black),
 decoration: InputDecoration(prefixIcon: Icon(icon,color: Colors.black, ),
 labelText: text,
 labelStyle: TextStyle(color: Colors.black),
 filled: true,
 floatingLabelBehavior: FloatingLabelBehavior.never,
 fillColor: Colors.lightGreen.withOpacity(.3),
 border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
 )),
 keyboardType: isPasswordType ? TextInputType.visiblePassword:TextInputType.emailAddress,
 );
 
}
Container signInSignUpButton(
 BuildContext context, bool isLogin, Function onTap){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        isLogin? 'LOG IN':'SIGNUP',
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}