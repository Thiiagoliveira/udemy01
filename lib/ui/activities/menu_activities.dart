import 'package:flutter/material.dart';
import 'package:udemy01/ui/activities/present_list_activities.dart';

class MenuActivity extends StatefulWidget {
  @override
  _MenuActivityState createState() => _MenuActivityState();
}

class _MenuActivityState extends State<MenuActivity> {
  @override
  Widget build(BuildContext context) {
    return Container(
      /*child: Text('aaaaaa'),*/
      child: EventActivity(),
    );
  }
}
