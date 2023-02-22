import 'package:farmer_app/models/article_model.dart';
import 'package:flutter/material.dart';

import '../helper/news.dart';

class CategoryNews extends StatefulWidget {
  // CategoryNews({super.key});
  String category = '';
  CategoryNews({required this.category});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = [];
  bool _loading = true;

  void initState() {
    super.initState();
    getCategoryNews();
  }

  void getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    // newslist=newsClass.news;
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        elevation: 0.0,
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              //physics: const ClampingScrollPhysics(),
              // child: Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   height: 70,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: articles.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return BlogTile(
                    imageUrl: articles[index].urlToImage,
                    title: articles[index].title,
                    desc: articles[index].description,
                  );
                },
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
