import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studybubble/home.dart';
import 'package:studybubble/subjectchoice.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<String> images = [
    'images/algo.png',
    'images/ds.png',
    'images/coding.png',
  ];

  Widget customcard(String lang, String image) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => subjectchoice(),
          ));
        },
        child: Material(
          color: Colors.lightGreen,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0,
                horizontal: 10.0),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    height: 120,
                    width: 120,
                    padding: EdgeInsets.all(5.0),
                    child: ClipOval(child: Image(image: AssetImage(image),)),
                  ),
                ),
                ),
    Center(child: Text(lang),),




              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => home()));
          },
        ),
       
      ),
      backgroundColor: Colors.grey,
      body: ListView(children: <Widget>[
        customcard("Algorithms", images[0]),
        customcard("Data Structures", images[1]),
        customcard("Programming", images[2])

  
      ]),
    );
  }
}
