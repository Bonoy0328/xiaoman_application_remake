import 'package:flutter/material.dart';

Widget dividingLine(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.92,
    height: 2,
    decoration:
        const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.05), boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.05),
        spreadRadius: 1,
        blurRadius: 2,
        offset: Offset(0, 2),
      ),
    ]),
  );
}
