import 'package:flutter/material.dart';
import '../widgets/article_page.dart';
import '../widgets/music_page.dart';
import '../widgets/poetry_page.dart';
import '../models/article.dart';
import '../models/music.dart';
import '../models/poetry.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  static const String routeName = "/home";

  Article article;
  Music music;
  Poetry poetry;
  HomePage(this.article, this.music, this.poetry, {Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return PoetryPage(widget.poetry);
          case 1:
            return MusicPage(widget.music);
          case 2:
            return ArticlePage(widget.article);
          default:
            return PoetryPage(widget.poetry);
        }
      },
      itemCount: 3,
    );
  }
}
