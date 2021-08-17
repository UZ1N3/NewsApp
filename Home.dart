import 'package:flutter/material.dart';
import 'package:newsapp/helpers/news.dart';
import 'package:newsapp/model/article_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ArticleModel> articles = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getnews();
    articles = newsClass.news;

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Futurama"),
            Text(
              "Characters",
              style: TextStyle(color: Colors.purple),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount: articles.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return NewsTile(
                        main: articles[index].main,
                        name: articles[index].name,
                        species: articles[index].species,
                        homePlanet: articles[index].homePlanet,
                        occupation: articles[index].occupation,
                        age: articles[index].age,
                        gender: articles[index].gender,
                      );
                    }),
              ),
            ),
    );
  }
}

class NewsTile extends StatelessWidget {
  final String main;
  final String name;

  final String gender;
  final String species;
  final String occupation;
  final String homePlanet;
  final String age;

  NewsTile({
    required this.name,
    required this.gender,
    required this.species,
    required this.occupation,
    required this.homePlanet,
    required this.age,
    required this.main,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Image.network(main),
          SizedBox(
            height: 10,
          ),
          Text(
            "Name: " + name,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text("gender: " + gender),
          Text("age: " + age),
          Text("species: " + species),
          Text("homePlanet: " + homePlanet),
          Text("occupation: " + occupation),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
