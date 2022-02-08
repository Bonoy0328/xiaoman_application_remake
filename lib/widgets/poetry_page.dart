import 'package:flutter/material.dart';
import '../models/enum.dart';
import '../models/poetry.dart';
import 'dividing_line.dart';
import 'like_share_button.dart';
import 'package:sized_context/sized_context.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class PoetryPage extends StatefulWidget {
  Poetry poetry;
  PoetryPage(
    this.poetry, {
    Key? key,
  }) : super(key: key);

  @override
  _PoetryPageState createState() => _PoetryPageState();
}

class _PoetryPageState extends State<PoetryPage> {
  double lineMarginTop = 10;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 4,
            child: Center(
              child: Container(
                // color: Colors.amber,
                child: Text(
                  widget.poetry.content,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ),
          dividingLine(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.loose,
            child: Container(
              // color: Colors.pink,
              child: likeShareButton(ButtonId.poetry, widget.poetry.likes,
                  widget.poetry.shares, widget.poetry.date),
            ),
          ),
        ],
      ),
    );
  }
}
