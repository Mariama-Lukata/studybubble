import 'package:flutter/material.dart';
import 'package:studybubble/booksearch/bookhelper.dart';
import 'dart:ui';

import 'package:studybubble/booksearch/favoriteScreen.dart';
import 'package:studybubble/booksearch/ui.dart';
import 'package:studybubble/reusable_widget.dart';

class librarySearch extends StatefulWidget {
  const librarySearch({Key? key}) : super(key: key);

  @override
  State<librarySearch> createState() => _librarySearchState();
}

class _librarySearchState extends State<librarySearch> {
  late BooksHelper helper;
  List<dynamic> books = List<dynamic>.empty(growable: true);
  late int booksCount;
  late TextEditingController txtSearchController;
  @override
  void initState() {
    helper = BooksHelper();
    txtSearchController = TextEditingController();
    initialize();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isSmall = false;
    if (MediaQuery.of(context).size.width < 600) {
      isSmall = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Find a Book"),
        centerTitle: true,
        actions: <Widget>[
          InkWell(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: (isSmall) ? Icon(Icons.home) : Text("Home"),
            ),
          ),
          InkWell(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: (isSmall) ? Icon(Icons.star) : Text("Favorites"),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FavoriteScreen()));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
         
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
              Container(
                padding: EdgeInsets.all(20),
                width: 230,
                child: TextField(
                 decoration: const InputDecoration.collapsed(
                    hintText: 'Search for a Book',
                    border: UnderlineInputBorder() ,
                   
                    
                    
                    
                  ),
                  controller: txtSearchController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  

                  onSubmitted: (text) {
                    helper.getBooks(text).then((value) {
                      books = value;
                      setState(() {
                        books = books;
                      });
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => helper.getBooks(txtSearchController.text),
                ),
              )

            ]),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: (isSmall) ? BookList( books: books,isFavorite: false ) : BooksTable( books: books,isFavorite: false ),
          )
        ],
      )),
    );
  }

  Future initialize() async {
    books = await helper.getBooks('Flutter');
    setState(() {
      booksCount = books.length;

      books = books;
    });
  }
}
