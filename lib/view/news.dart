import 'dart:convert';
import '../model/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=329d391d36044f478471b6ad1a0957e6'));

    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element["author"],
              description: element['description'],
              url: element['url'],
              urlToImage: element["urlToImage"],
              content: element['context']);
          news.add(articleModel);
        }
      });
    } else {
      throw ("Cant get the article");
    }
  }
}
