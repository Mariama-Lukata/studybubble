import 'package:flutter/material.dart';

class librarySearch extends StatefulWidget {
  const librarySearch({ Key? key }) : super(key: key);

  @override
  State<librarySearch> createState() => _librarySearchState();
}

class _librarySearchState extends State<librarySearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Find a Library"),
        centerTitle: true,
      ),
      
    );
  }
}
