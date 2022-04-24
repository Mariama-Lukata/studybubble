import 'package:flutter/material.dart';
import 'package:studybubble/booksearch/bookhelper.dart';

class BooksTable extends StatelessWidget {
  final List<dynamic> books;
  final bool isFavorite;

  BooksTable({Key? key, required this.books, required this.isFavorite})
      : super(key: key);
  final BooksHelper helper = BooksHelper();

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: {
        0: FlexColumnWidth(3),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(2),
        3: FlexColumnWidth(1),
      },
      border: TableBorder.all(color: Colors.black),
      children: books.map((book) {
        return TableRow(children: [
          TableCell(child: TableText(text: book.title)),
          TableCell(child: TableText(text:book.authors)),
          TableCell(child: TableText(text:book.publisher)),
          TableCell(
              child: IconButton(
            color: (isFavorite) ? Colors.lightGreen : Colors.amber,
            tooltip:
                (isFavorite) ? "Remove from favorites" : "Add to favorites",
            icon: Icon(Icons.star),
            onPressed: () {
              if (isFavorite == false) {
                helper.removeFromFavorites(book, context);
              } else {
                helper.addToFavorites(book);
              }
            },
          )),
        ]);
      }).toList(),
    );
  }
}

class BookList extends StatelessWidget {
  final List<dynamic> books;
  final bool isFavorite;

  BookList({Key? key, required this.books, required this.isFavorite})
      : super(key: key);
  final BooksHelper helper = BooksHelper();
  @override
  Widget build(BuildContext context) {
    final int bookCount = books.length;

    return Container(
      height: MediaQuery.of(context).size.height / 1.4,
      child: ListView.builder(
          itemCount: (bookCount == null) ? 0 : bookCount,
          itemBuilder: (BuildContext context, int position) {
            return ListTile(
              title: Text(books[position].title),
              subtitle: Text(books[position].authors),
              trailing: IconButton(
                color: (isFavorite) ? Colors.lightGreen : Colors.amber,
                tooltip:
                    (isFavorite) ? "Remove from favorites" : "Add to favorites",
                icon: Icon(Icons.star),
                onPressed: () {
                  if (isFavorite) {
                    helper.removeFromFavorites(books[position], context);
                  } else {
                    helper.addToFavorites(books[position]);
                  }
                },
              ),
            );
          }),
    );
  }
}

class TableText extends StatelessWidget {
  final String text;
  const TableText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        text,
        style: TextStyle(color: Theme.of(context).primaryColorDark),
      ),
    );
  }
}
