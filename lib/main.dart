import 'package:flutter/material.dart';
import 'package:game_sn/snake.dart';
import 'HomePage.dart';
import 'game0.dart';
import 'game1.dart';
import 'game2.dart';
import 'Hard.dart';
import 'Easy.dart';
import 'Medium.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "All Games",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: <String,WidgetBuilder>{
        "\0":(BuildContext context) => HomePage0(),
        "\1":(BuildContext context) => HomePage1(),
        "\2":(BuildContext context) => HomePage2(),
        "\a": (BuildContext context) => Easy(),
        "\b": (BuildContext context) => Medium(),
        "\c": (BuildContext context) => Hard(),
        "\d": (BuildContext context) => MyHomePage(),
      },
    );
  }
}