import 'package:flutter/material.dart';
import '../models/enum.dart';
import 'package:like_button/like_button.dart';

Widget likeShareButton(ButtonId buttonId) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      LikeButton(
        likeCount: 0,
        countBuilder: (int? count, bool isLiked, String texts) {
          var color = isLiked ? const Color(0xFFF44336) : Colors.grey;
          Widget result;
          if (count == 0) {
            result = Text(
              "Like",
              style: TextStyle(
                color: color,
                fontSize: 20,
                decoration: TextDecoration.none,
              ),
            );
          } else {
            result = Text(
              texts,
              style: TextStyle(
                color: color,
                fontSize: 20,
                decoration: TextDecoration.none,
              ),
            );
          }
          return result;
        },
      ),
      LikeButton(
        circleColor:
            const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
        bubblesColor: const BubblesColor(
          dotPrimaryColor: Color(0xff33b5e5),
          dotSecondaryColor: Color(0xff0099cc),
        ),
        likeCount: 0,
        countBuilder: (int? count, bool isLiked, String texts) {
          var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
          Widget result;
          if (count == 0) {
            result = Text(
              "Share",
              style: TextStyle(
                color: color,
                fontSize: 20,
                decoration: TextDecoration.none,
              ),
            );
          } else {
            result = Text(
              texts,
              style: TextStyle(
                color: color,
                fontSize: 20,
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
            size: 30,
          );
        },
      ),
    ],
  );
}
