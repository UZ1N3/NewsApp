import 'dart:convert';

import 'package:newsapp/model/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getnews() async {
    const String url = "https://api.sampleapis.com/futurama/characters";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (int i = 0; i < 7; i++) {
        ArticleModel articleModel = ArticleModel(
            main: jsonData[i]["images"]["main"],
            gender: jsonData[i]["gender"],
            species: jsonData[i]["species"],
            age: jsonData[i]["age"],
            name: jsonData[i]["name"]["first"],
            homePlanet: jsonData[i]["homePlanet"],
            occupation: jsonData[i]["occupation"]);
        news.add(articleModel);
      }
    }
  }
}
