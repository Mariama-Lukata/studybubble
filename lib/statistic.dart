import 'package:flutter/material.dart';

class statistic extends StatefulWidget {
  const statistic({ Key? key }) : super(key: key);

  @override
  State<statistic> createState() => _statisticState();
}

class _statisticState extends State<statistic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Quiz Stats"),
        centerTitle: true,
      ),
      
    );
  }
}