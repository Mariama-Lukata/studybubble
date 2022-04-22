import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:studybubble/home.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("login"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('point').get(),
          builder: (context, snapshot) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Center(
                      child: Container(
                        width: 200,
                        height: 150,
                        child: Image.asset('assets/StudyBubbleLogo.jpg'),
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                      child: Text("START"),
                      onPressed: () async {
                        // checkinternetconnection();
                        const home();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 130,
                  )
                ],
              ),
            );
          }),
    );
  }

  void checkinternetconnection() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      _showDialoge("No internet", "You'er not connected to a network");
      Navigator.push(context, MaterialPageRoute(builder: (_) => home()));
    } else if (result == ConnectivityResult.mobile) {
      _showDialoge(" internet", "You'er connected over mobile data");
      Navigator.push(context, MaterialPageRoute(builder: (_) => home()));
    } else if (result == ConnectivityResult.mobile) {
      _showDialoge(" internet", "You'er connected over mobile data");
      Navigator.push(context, MaterialPageRoute(builder: (_) => home()));
    }
  }

  _showDialoge(title, text) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(title),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('ok'))
            ],
          );
        });
  }
}
