import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:studybubble/booksearch/book.dart';
import 'package:studybubble/booksearch/favoriteScreen.dart';
import 'package:studybubble/librarySearch.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studybubble/booksearch/ui.dart';
import 'package:flutter_config/flutter_config.dart';

class BooksHelper {
  
   
  final String urlKey = "&key=AIzaSyBnoMH-TXH-KHFTgHw4DNjHmojolQG-ES8";
  final String urlQuery = "volumes?q=";
  final String urlBase = "https://www.googleapis.com/books/v1/";

  Future<List<dynamic>> getBooks(String query) async {
    final String url = urlBase + urlQuery + query;
    Response result = await http.get(Uri.parse(url));
    if (result.statusCode == 200) {
      final jsonResponse = json.decode(result.body);
      final booksMap = jsonResponse["items"];
      //9:50
      List<dynamic> books = List<dynamic>.from( booksMap.map((i) => Book.fromJson(i)));
      return books;
    } else {
      return [];
    }
  }

  Future<List<dynamic>> getFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<dynamic> favBooks = List<dynamic>.empty(growable: true);
    Set allKeys = prefs.getKeys();

    if (allKeys.isNotEmpty) {
      for (int i = 0; i < allKeys.length; i++) {
        String key = (allKeys.elementAt(i).toString());
        Object? value = prefs.get(key);
        dynamic json = jsonDecode(key);
        Book book = Book(json['id'], json['title'], json['authors'],
            json['description'], json['publisher']);
        favBooks.add(book);
      }
    }
    return favBooks;
  }

  Future addToFavorites(Book book) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? id = preferences.getString(book.id);
    if (id != '') {
      await preferences.setString(book.id, json.encode(book.toJson()));
    }
  }

  Future removeFromFavorites(Book book, BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? id = preferences.getString(book.id);
    if (id != '') {
      await preferences.remove(book.id);
      //book.remove(book);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FavoriteScreen()));
    }
  }
}
