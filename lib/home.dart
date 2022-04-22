import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:studybubble/notes.dart';
import 'package:studybubble/homepage.dart';
import 'package:studybubble/librarySearch.dart';
import 'package:studybubble/statistic.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int Index){
//tap bottom bar icons
 
    setState(() {
      
    });
     Navigator.push(context, MaterialPageRoute(builder: (_) => _widgitOptions[Index]));
  }
// Add Notes Widget, Message a friend?, library search
static List<Widget> _widgitOptions =<Widget> [
  homepage(),
  statistic(),
  notes(),
  librarySearch(),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bubble Quiz"),
        centerTitle: true,
      ),
    body: Scrollbar(child: 
    Center(
      child: _widgitOptions.elementAt(_selectedIndex) ,)),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(microseconds: 600),
        height: 50.0,
//change icons
        items: const <Widget> [
          Icon(Icons.games, size: 30,),
          Icon(Icons.stacked_bar_chart, size: 30,),
          Icon(Icons.note_sharp, size: 30,),
          Icon(Icons.book, size: 30,)
        ],
        onTap: _onItemTapped,
        
        )
    );
  }
}
