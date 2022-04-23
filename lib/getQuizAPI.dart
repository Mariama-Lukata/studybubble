import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

class QuizApi {
  static Future<List> getQuiz() async {
    await FlutterConfig.loadEnvVariables();
    var key = FlutterConfig.get("quizAPIKey");
    var uri = Uri.https("https://quizapi.io/api/v1/questions", "");
    final response = await http.get(uri, headers: {
      "apiKey": key,
      "limit": "10",
      "category": "Linux",
      "difficulty": "easy"
    });

    List data = jsonDecode(response.body);

    return data;
  }


}
