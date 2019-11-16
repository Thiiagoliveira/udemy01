import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy01/ui/activities/home_activities.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomeActivity(title: 'Primeiro Projeto'),
      /*home: MyHomePage(title: 'Primeiro Projeto'),*/
    );
  }
}
