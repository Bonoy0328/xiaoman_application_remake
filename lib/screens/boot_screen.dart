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
import '../data_manager.dart';

class BootPage extends StatefulWidget {
  static const String routeName = "/boot";

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
  late Map<String, Object> resDict;

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
                return HomePage(
                  resDict['article'] as Article,
                  resDict["music"] as Music,
                  resDict["poetry"] as Poetry,
                );
              },
            ),
          );
        }
      }
      if (timeoutCnt > 50) {
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
    DateTime dateTime = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate =
        formatter.format(dateTime.add(const Duration(hours: 8)));
    // print(formattedDate);
    // print(formattedDate.substring(0, 10));
    dataManager(formattedDate)
        .then((value) => resDict = value)
        .whenComplete(() => initSuccess = true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Container(
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
          ),
          // ElevatedButton(
          //   onPressed: () async {
          //     DateTime dateTime = DateTime.now();
          //     var formatter = DateFormat('yyyy-MM-dd');
          //     String formattedDate = formatter.format(dateTime);
          //     print(formattedDate);
          //     resDict = await dataManager(formattedDate);
          //   },
          //   child: const Icon(Icons.add_reaction_rounded),
          // ),
        ],
      ),
    );
  }
}
