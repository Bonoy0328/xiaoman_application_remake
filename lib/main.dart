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
        // canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        canvasColor: Colors.white,
        colorScheme: const ColorScheme(
          primary: Colors.blue,
          primaryVariant: Colors.black,
          onPrimary: Colors.white,
          secondary: Colors.purple,
          secondaryVariant: Colors.teal,
          onSecondary: Colors.green,
          surface: Colors.amber,
          onSurface: Colors.blueGrey,
          // background: Color.fromRGBO(255, 254, 229, 1),
          background: Colors.white,
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
              bodyText2: TextStyle(
                color: Colors.blueGrey.shade700,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              button: const TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
              headline1: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              headline2: TextStyle(
                color: Colors.blueGrey.shade700,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              headline3: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              headline4: const TextStyle(
                color: Colors.black87,
                fontSize: 15,
                height: 1.5,
                fontFamily: 'zhanku',
              ),
            ),
      ),
      home: const BootPage(),
    );
  }
}
