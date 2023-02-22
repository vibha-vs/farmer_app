import 'dart:convert';
import 'dart:async';
import '../models/article_model.dart';
import 'package:http/http.dart' as http;

//    var response = await http.get(Uri.parse(url));
class News {
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    try {
      var url =
          "https://newsapi.org/v2/everything?apiKey=94bfe6dbb16e42f79ed369910f41842e&q=agriculture AND farmer AND India";
      //"https://newsapi.org/v2/everything?apiKey=94bfe6dbb16e42f79ed369910f41842e&q=India";
      var response = await http.get(Uri.parse(url));
      var jsonData = jsonDecode(response.body);
      print("Inside try");
      print(jsonData['totalResults']);
      if (jsonData['status'] == "ok") {
        jsonData["articles"].forEach((element) {
          // print(element["urlToImage"]);
          if (element['urlToImage'] != null && element['description'] != null) {
            ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element["author"],
              description: element['description'],
              url: element["url"],
              urlToImage: element['urlToImage'],
              content: element["content"],
            );
            news.add(articleModel);
          }
          // print(element["author"]);
        });
        // news.forEach((element) {
        //   print(element);
        //   print("\n");
        // });
        print(news.length);
      }
    } catch (ex) {
      print(ex);
      print("Inside exception");
    }
    // return news;
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];
  Future<void> getNews(String category) async {
    try {
      var url =
          "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=94bfe6dbb16e42f79ed369910f41842e";
      var response = await http.get(Uri.parse(url));
      var jsonData = jsonDecode(response.body);
      print("Inside try");
      print(jsonData['totalResults']);
      if (jsonData['status'] == "ok") {
        jsonData["articles"].forEach((element) {
          // print(element["urlToImage"]);
          if (element['urlToImage'] != null && element['description'] != null) {
            ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element["author"],
              description: element['description'],
              url: element["url"],
              urlToImage: element['urlToImage'],
              content: element["content"],
            );
            news.add(articleModel);
          }
          // print(element["author"]);
        });
        // news.forEach((element) {
        //   print(element);
        //   print("\n");
        // });
        print(news.length);
      }
    } catch (ex) {
      print(ex);
      print("Inside exception");
    }
    // return news;
  }
}
