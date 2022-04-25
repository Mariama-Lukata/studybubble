import 'package:flutter/material.dart';
import 'package:studybubble/booksearch/ui.dart';
import 'package:studybubble/librarySearch.dart';
import 'package:studybubble/booksearch/bookhelper.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late BooksHelper helper;
  List<dynamic> books = List<dynamic>.empty(growable: true);
  late int booksCount;

  @override
  void initState() {
    // TODO: implement initState
    helper = BooksHelper();
    //ref init method?
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isSmall = false;
    if (MediaQuery.of(context).size.width < 700) {
      isSmall = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Books"),
        actions: <Widget>[
          InkWell(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: (isSmall) ? Icon(Icons.home) : Text("Search Screen"),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => librarySearch()));
              }),
          InkWell(
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: (isSmall) ? Icon(Icons.home) : Text("favorites")),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(20.0),
              child: (isSmall)
                  ? BookList(books: books, isFavorite: false)
                  : BooksTable(books: books, isFavorite: false)),
        ],
      ),
    );
  }

  Future initialize() async {
    books = await helper.getFavorites();
    print(books);
    setState(() {
      booksCount = books.length;
      books = books;
    });
  }
}
