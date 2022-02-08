import 'package:flutter/material.dart';
import '../widgets/article_page.dart';
import '../widgets/music_page.dart';
import '../widgets/poetry_page.dart';
import '../models/article.dart';
import '../models/music.dart';
import '../models/poetry.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'dart:async';
import 'mfeedback.dart';

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
  int _lastPressedAt = 0;

  get _drawer => Drawer(
        child: ListView(
          ///edit start
          padding: EdgeInsets.zero,

          ///edit end
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.yellow.shade50,
              ),
              child: const Center(
                child: SizedBox(
                  width: 60.0,
                  height: 60.0,
                  child: CircleAvatar(
                    foregroundColor: Colors.black,
                    child: Text("Hi"),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () => {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return MFeedBack();
                    },
                  ),
                )
              },
              child: const ListTile(
                leading: Icon(Icons.feedback),
                title: Text('给出你的建议吧'),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return WillPopScope(
      onWillPop: () async {
        int nowExitTime = DateTime.now().millisecondsSinceEpoch;
        if (nowExitTime - _lastPressedAt > 2000) {
          _lastPressedAt = nowExitTime;
          Fluttertoast.showToast(
              msg: "再次点击退出",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black45,
              textColor: Colors.white,
              fontSize: 16.0);
          return await Future.value(false);
        } else {
          exit(0);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.07,
          leading: IconButton(
            onPressed: () => {},
            icon: const Icon(
              Icons.access_time,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          title: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/xiao.svg",
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                SvgPicture.asset(
                  "assets/images/man.svg",
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ),
          centerTitle: true,
          actions: [
            Builder(builder: (context) {
              return IconButton(
                onPressed: () => {
                  Scaffold.of(context).openDrawer(),
                },
                icon: const Icon(
                  Icons.dehaze,
                  color: Colors.black,
                ),
              );
            }),
          ],
        ),
        body: PageView.builder(
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
        ),
        drawer: _drawer,
      ),
    );
  }
}
