// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:farmer_app/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import '../models/article_model.dart';
import '../models/categorie_model.dart';
//import 'package:news_api/helper/widgets.dart';
//import '../views/categorie_news.dart';
import '../helper/data.dart';
import '../helper/news.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;
  // var newslist;

  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];

  void getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    // newslist=newsClass.news;
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    // ignore: todo
    // TODO: implement initState
    super.initState();

    categories = getCategories();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
          title: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              // Text(
              //   "Flutter",
              //   style: TextStyle(color: Colors.white),
              // ),
              Padding(
                padding: EdgeInsets.fromLTRB(95, 10, 50, 10),
                child: Text(
                  "News",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          centerTitle: true,
          elevation: 0.0),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(children: <Widget>[
                //categories
                // Container(
                //   padding: const EdgeInsets.symmetric(horizontal: 16),
                //   height: 70,
                //   child: ListView.builder(
                //       physics: const NeverScrollableScrollPhysics(),
                //       itemCount: categories.length,
                //       shrinkWrap: true,
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) {
                //         return CategoryTile(
                //           imageUrl: categories[index].imageUrl,
                //           categoryName: categories[index].categoryName,
                //         );
                //       }),
                // ),

                //blogs
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: articles.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return BlogTile(
                          imageUrl: articles[index].urlToImage,
                          title: articles[index].title,
                          desc: articles[index].description);
                    })
              ]),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;

  const CategoryTile({super.key, this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc;
  const BlogTile(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              desc,
              style: TextStyle(color: Colors.black54),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
