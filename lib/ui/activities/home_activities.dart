import 'package:flutter/material.dart';
import 'package:udemy01/ui/activities/menu_activities.dart';

class HomeActivity extends StatefulWidget {
  HomeActivity({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MenuActivity(),
    );
  }
}
