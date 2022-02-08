import 'package:flutter/material.dart';
import '../models/enum.dart';
import 'package:like_button/like_button.dart';
import '../utilities/method.dart';

Widget likeShareButton(
    ButtonId buttonId, int likeNum, int shareNum, String date) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    // crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      LikeButton(
        likeCount: likeNum,
        countBuilder: (int? count, bool isLiked, String texts) {
          var color = isLiked ? const Color(0xFFF44336) : Colors.grey;
          Widget result;
          if (count == 0) {
            result = Text(
              "Like",
              style: TextStyle(
                color: color,
                fontSize: 15,
                decoration: TextDecoration.none,
              ),
            );
          } else {
            result = Text(
              texts,
              style: TextStyle(
                color: color,
                fontSize: 15,
                decoration: TextDecoration.none,
              ),
            );
          }
          return result;
        },
        likeBuilder: (bool isLiked) {
          return Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: isLiked ? Colors.red : Colors.grey,
            size: 25,
          );
        },
        onTap: (isLiked) async {
          if (!isLiked) {
            switch (buttonId) {
              case ButtonId.poetry:
                sendLikeMsg(true, "poetry", date);
                break;
              case ButtonId.music:
                sendLikeMsg(true, "music", date);
                break;
              case ButtonId.article:
                sendLikeMsg(true, "article", date);
                break;
            }
          } else {
            switch (buttonId) {
              case ButtonId.poetry:
                sendLikeMsg(false, "poetry", date);
                break;
              case ButtonId.music:
                sendLikeMsg(false, "music", date);
                break;
              case ButtonId.article:
                sendLikeMsg(false, "article", date);
                break;
            }
          }
          return !isLiked;
        },
      ),
      LikeButton(
        circleColor:
            const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
        bubblesColor: const BubblesColor(
          dotPrimaryColor: Color(0xff33b5e5),
          dotSecondaryColor: Color(0xff0099cc),
        ),
        likeCount: shareNum,
        countBuilder: (int? count, bool isLiked, String texts) {
          var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
          Widget result;
          if (count == 0) {
            result = Text(
              "Share",
              style: TextStyle(
                color: color,
                fontSize: 15,
                decoration: TextDecoration.none,
              ),
            );
          } else {
            result = Text(
              texts,
              style: TextStyle(
                color: color,
                fontSize: 15,
                decoration: TextDecoration.none,
              ),
            );
          }
          return result;
        },
        likeBuilder: (bool isLiked) {
          return Icon(
            Icons.share,
            color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
            size: 25,
          );
        },
        onTap: (isLiked) async {
          if (!isLiked) {
            switch (buttonId) {
              case ButtonId.poetry:
                sendShareMsg(true, "poetry", date);
                break;
              case ButtonId.music:
                sendShareMsg(true, "music", date);
                break;
              case ButtonId.article:
                sendShareMsg(true, "article", date);
                break;
            }
          } else {
            switch (buttonId) {
              case ButtonId.poetry:
                sendShareMsg(false, "poetry", date);
                break;
              case ButtonId.music:
                sendShareMsg(false, "music", date);
                break;
              case ButtonId.article:
                sendShareMsg(false, "article", date);
                break;
            }
          }
          return !isLiked;
        },
      ),
    ],
  );
}
