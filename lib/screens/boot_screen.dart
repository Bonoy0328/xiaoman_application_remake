import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../models/article.dart';
import '../models/music.dart';
import '../models/poetry.dart';
import '../screens/home.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sized_context/sized_context.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BootPage extends StatefulWidget {
  const BootPage({Key? key}) : super(key: key);

  @override
  _BootPageState createState() => _BootPageState();
}

class _BootPageState extends State<BootPage> {
  double lineMarginTop = 10;
  int _lastPressedAt = 0;
  late Timer _timer;
  bool initSuccess = false;
  int timeoutCnt = 0;
  Poetry poetry = Poetry(
    id: 0,
    date: "date",
    content: "",
    author: "author",
    likes: 0,
    shares: 0,
  );
  Music music = Music(
      id: 0,
      date: "date",
      image: "image",
      name: "name",
      author: "author",
      file: "file",
      likes: 0,
      shares: 0);
  Article article = Article(
      id: 0,
      date: "date",
      title: "title",
      author: "author",
      image: "image",
      content: "content",
      likes: 0,
      shares: 0);

  Future<void> dataManager(Poetry poetry, Music music, Article article) async {
    DateTime dateTime = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(dateTime);
    bool isInitiateRequest = false;
    // String contentDate = " ";
    print(formattedDate.substring(0, 10));
    Dio dio = Dio();
    // check local time is match database time
    // if true don't initiate network request
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var contentDate = prefs.getString("contentDate");
    if (contentDate == null) {
      print("initiate request");
      isInitiateRequest = true;
    } else {}
// Date: "2021-6-2-21:58"
// ID: 1
// LikesNum: 2
// SharedNum: 5
// UpdatorName: "bonoy"
// poetryAuthor: "佚名"
// poetryContent: "我的豪迈烈骨给你看了，\n我的魅惑风情也被你收了，\n你要拿什么还我？\n诗人的情诗我自是不信的，\n我要你这浪子的余生。"
    Response response = await dio.get("https://www.bonoy0328.com/getPoetry");
    poetry.author = response.data["poetryAuthor"];
    poetry.content = response.data["poetryContent"];
    poetry.date = response.data["Date"];
    poetry.id = response.data["ID"];
    poetry.likes = response.data["LikesNum"];
    poetry.shares = response.data["SharedNum"];

    print("poerty data is OK!");

// Date: "2021-6-8-21:21:21"
// ID: 1
// LikesNum: 1
// SharedNum: 3
// UpdatorName: "bonoy"
// anthorName: "bonoy"
// musicImg: "/usr/local/bonoy/media/music/img/Doja Cat; SZA - Kiss Me More.PNG"
// musicName: "Doja Cat; SZA - Kiss Me More"
// musicfile: "/usr/local/bonoy/media/music/musicFile/Doja Cat; SZA - Kiss Me More.mp3"
    response = await dio.get("https://www.bonoy0328.com/getMusic");
    music.id = response.data["ID"];
    music.date = response.data["Date"];
    music.file = response.data["musicfile"];
    music.image = response.data["musicImg"];
    music.author = response.data["anthorName"];
    music.name = response.data["musicName"];
    music.likes = response.data["LikesNum"];
    music.shares = response.data["SharedNum"];

    print("music data is OK!");

    // download music to local
// ArticleAnthor: "me"
// Date: "2021-5-30-23:21:50"
// ID: 1
// LikesNum: 1
// SharedNum: 4
// UpdatorName: "bonoy"
// articleContent: "《印度哲学概论》至：“太子作狮子吼：‘我若不断生、老、病、死、优悲、苦恼，不得阿耨多罗三藐三菩提，要不还此。’”有感而作。我刚刚出了世，已经有了一个漆黑严密的圈儿，远远的罩定我，但是我不觉得。渐的我往外发展，就觉得有它限制阻抑着，并且它似乎也往里收缩─—好害怕啊！圈子里只有黑暗，苦恼悲伤。　　　　它往里收缩一点，我便起来沿着边儿奔走呼号一回。结果呢？它依旧严严密密的罩定我，我也只有屏声静气的，站在当中，不能再动。　　　　它又往里收缩一点，我又起来沿着边儿奔走呼号一回；回数多了，我也疲乏了，─—圈儿啊！难道我至终不能抵抗你？永远幽囚在这里面么？　　　　起来！忍耐！努力！　　　　呀！严密的圈儿，终竟裂了一缝。─—往外看时，圈子外只有光明，快乐，自由。─—只要我能跳出圈儿外！　　《印度哲学概论》至：“太子作狮子吼：‘我若不断生、老、病、死、优悲、苦恼，不得阿耨多罗三藐三菩提，要不还此。’”有感而作。我刚刚出了世，已经有了一个漆黑严密的圈儿，远远的罩定我，但是我不觉得。渐的我往外发展，就觉得有它限制阻抑着，并且它似乎也往里收缩─—好害怕啊！圈子里只有黑暗，苦恼悲伤。 　　它往里收缩一点，我便起来沿着边儿奔走呼号一回。结果呢？它依旧严严密密的罩定我，我也只有屏声静气的，站在当中，不能再动。 　　它又往里收缩一点，我又起来沿着边儿奔走呼号一回；回数多了，我也疲乏了，─—圈儿啊！难道我至终不能抵抗你？永远幽囚在这里面么？ 　　起来！忍耐！努力！　　 　　呀！严密的圈儿，终竟裂了一缝。─—往外看时，圈子外只有光明，快乐，自由。─—只要我能跳出圈儿外！ 　　前途有了希望了，我不是永远不能抵抗它，我不至于永远幽囚在这里面了。努力！忍耐！看我劈开了这苦恼悲伤，跳出圈儿外！"
// articleImg: "/usr/local/bonoy/media/article/img/Ydata_fAIvGPh.png"
// articleTitle: "我是你爸爸"
    response = await dio.get("https://www.bonoy0328.com/getArticle");
    article.author = response.data["ArticleAnthor"];
    article.content = response.data["articleContent"];
    article.date = response.data["Date"];
    article.id = response.data["ID"];
    article.image = response.data["articleImg"];
    article.title = response.data["articleTitle"];
    article.likes = response.data["LikesNum"];
    article.shares = response.data["SharedNum"];

    print("article data is OK!");
  }

  void tCallBack() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      timeoutCnt++;
      print("time cnt : $timeoutCnt");
      if (timeoutCnt >= 10) {
        if (initSuccess) {
          _timer.cancel();
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, ani1, ani2) {
                return HomePage(article, music, poetry);
              },
            ),
          );
        }
      } else if (timeoutCnt > 50) {
        if (timeoutCnt == 51) {
          Fluttertoast.showToast(
              msg: "网络超时，请稍后重试",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black45,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
    });
  }

  void startTimer() async {
    var _duration = const Duration(milliseconds: 100);
    Timer(_duration, tCallBack);
  }

  @override
  void initState() {
    startTimer();
    dataManager(poetry, music, article).whenComplete(() => initSuccess = true);
    super.initState();
  }

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
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFF3F3F1),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: context.widthPx * 0.5964),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/xiao.svg",
                    fit: BoxFit.cover,
                    width: context.widthPx * 0.152,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: context.widthPx * 0.152 * 0.5761,
                    ),
                    child: SvgPicture.asset(
                      "assets/images/man.svg",
                      fit: BoxFit.cover,
                      width: context.widthPx * 0.152,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SvgPicture.asset(
                    "assets/images/by.svg",
                    fit: BoxFit.cover,
                    width: context.widthPx * 0.1947,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
