import 'package:flutter/material.dart';
import '../models/article.dart';

// ignore: must_be_immutable
class ArticlePage extends StatefulWidget {
  Article article;
  ArticlePage(this.article, {Key? key}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Text(widget.article.content),
      ),
    );
  }
}
