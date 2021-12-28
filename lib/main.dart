import 'package:flutter/material.dart';
import './screens/boot_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        colorScheme: const ColorScheme(
          primary: Colors.blue,
          primaryVariant: Colors.black,
          onPrimary: Colors.white,
          secondary: Colors.purple,
          secondaryVariant: Colors.teal,
          onSecondary: Colors.green,
          surface: Colors.amber,
          onSurface: Colors.blueGrey,
          background: Color.fromRGBO(255, 254, 229, 1),
          onBackground: Colors.black,
          error: Colors.lime,
          onError: Colors.red,
          brightness: Brightness.light,
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Colors.black87,
              fontSize: 20,
              height: 1.5,
              fontFamily: 'zhanku',
            ),
            button: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
            )),
      ),
      home: const BootPage(),
    );
  }
}
