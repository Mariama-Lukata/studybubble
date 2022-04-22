import 'package:flutter/material.dart';
import 'package:studybubble/subjectchoice.dart';

class result extends StatefulWidget {
  int marks;
  result({Key? key, required this.marks}) : super(key: key);

  @override
  State<result> createState() => _resultState(marks);
}

class _resultState extends State<result> {
  int marks;
  _resultState(this.marks);

  List<String> images = [
    "images/red.jpg",
    "images/blue.jpg",
    "images/green.jpg"
  ];
  String message = "";
  String image = "";
  @override
  void initState() {
    if (marks < 20) {
      image = images[0];
      message = "Better luck next time!";
    } else if (marks < 35) {
      image = images[1];
      message = " Pretty Good!";
    } else {
      image = images[2];
      message = "Excellent!";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Results",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                  child: Text(
                "Study Bubble Quiz",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                  child: Text(
                "Challege Results:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Container(
            child: Column(children: <Widget>[
              Material(
                child: Container(
                  width: 120,
                  height: 120,
                  child: ClipRect(
                      child: Image(
                    image: AssetImage(image),
                  )),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
              Center(
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              )
            ]),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Center(
                child: Text(
                  "",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 50,
              ),
              Flexible(
                child: Divider(
                    color: Colors.black,
                    height: 2,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20),
              ),
              Text(
                "My Record",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              Flexible(
                child: Divider(
                  color: Colors.black,
                  height: 2,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
              ),
              SizedBox(
                width: 50,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 50,
              ),
              Text("Wins"),
              Text(
                marks.toString(),
                style: TextStyle(fontSize: 24, color: Colors.green),
              ),
              Text("Losses"),
              Text(
                (100 - marks).toString(),
                style: TextStyle(fontSize: 24, color: Colors.red),
              ),
              SizedBox(
                width: 50,
              ),
            ],
          ),
          SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => subjectchoice(),
                    ));
                  },
                  child: Text("Continue", style: TextStyle(fontSize: 25.0),),
                  )
            ],
          )
        ],
      ),
    );
  }
}
