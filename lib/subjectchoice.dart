import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:studybubble/getjson.dart';
import 'package:studybubble/notes.dart';
import 'package:studybubble/home.dart';
import 'package:studybubble/homepage.dart';
import 'package:studybubble/librarySearch.dart';
import 'package:studybubble/statistic.dart';

class subjectchoice extends StatefulWidget {
  const subjectchoice({Key? key}) : super(key: key);

  @override
  State<subjectchoice> createState() => _subjectchoiceState();
}

class _subjectchoiceState extends State<subjectchoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => home()));
          },
        ),
        title: Text("Quiz"),
      ),
      body: Scrollbar(
          child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: Text("play"),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(children: <Widget>[
              SizedBox(
                width: 60,
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => getjson()));
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.lightBlue,
                          border: Border.all(width: 1, color: Colors.white),
                        ),
                        child: Center(
                          child: Text(
                            "Click me",
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ]),
          )
        ],
      )),
    );
  }
}
