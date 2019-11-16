import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Event {
  String expandedValue;
  String eventValue;
  String eventTime;
  bool isExpandedEvent;
  bool isExpanded;

  Event({
    this.expandedValue,
    this.eventValue,
    this.eventTime,
    this.isExpandedEvent = false,
    this.isExpanded = false,
  });
}

class User {
  final int indexUser;
  final String name;
  final String register;

  User({this.indexUser, this.name, this.register});
}

List<Event> generateEvents(int numberOfEvents) {
  return List.generate(numberOfEvents, (int index) {
    return Event(
      eventValue: 'Evento $index',
      eventTime: '12:00',
      expandedValue: 'Aluno do evento $index',
    );
  });
}

class EventActivity extends StatefulWidget {
  @override
  _EventActivityState createState() => _EventActivityState();
}

class _EventActivityState extends State<EventActivity> {
  List<Event> _data = generateEvents(1);
  List<Event> _dataEvent = generateEvents(3);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _buildPanel(),
    );
  }

  Widget _buildPanel() {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: Theme(
        data: Theme.of(context).copyWith(cardColor: Color(0xFF394964)),
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpandedEvent) {
            setState(() {
              _data[index].isExpandedEvent = !isExpandedEvent;
            });
          },
          children: _data.map<ExpansionPanel>((Event events) {
            return ExpansionPanel(
              canTapOnHeader: true,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(
                    'Thursday, July 1',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                );
              },
              body: Container(
                margin: EdgeInsets.all(12.0),
                child: Theme(
                  data:
                      Theme.of(context).copyWith(cardColor: Color(0xFFF4B549)),
                  child: ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        _dataEvent[index].isExpanded = !isExpanded;
                      });
                    },
                    children: _dataEvent.map<ExpansionPanel>((Event events) {
                      return ExpansionPanel(

                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  events.eventValue,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20),
                                ),
                                SizedBox(width: 50),
                                Text(
                                  events.eventTime,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          );
                        },
                        body: Column(
                          children: <Widget>[
                            Container(
                              color: Colors.white70,
                              child: ListTile(
                                title: Text(events.expandedValue),
                                trailing: Icon(Icons.delete),
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            new Container(
                                              margin: new EdgeInsets.all(25.0),
                                              child: new ListTile(
                                                leading: new Icon(Icons.photo),
                                                title: new Text('Photo'),
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            Container(
                              color: Colors.grey,
                              child: ListTile(
                                title: Text(events.expandedValue),
                                subtitle: Text(
                                    'To delete this panel, tap the trash can icon'),
                                trailing: Icon(Icons.delete),
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            new Container(
                                              margin: new EdgeInsets.all(25.0),
                                              child: new ListTile(
                                                leading: new Icon(Icons.photo),
                                                title: new Text('Photo'),
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            Container(
                              color: Colors.white70,
                              child: ListTile(
                                title: Text(events.expandedValue),
                                subtitle: Text(
                                    'To delete this panel, tap the trash can icon'),
                                trailing: Icon(Icons.delete),
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            new Container(
                                              margin: new EdgeInsets.all(25.0),
                                              child: new ListTile(
                                                leading: new Icon(Icons.photo),
                                                title: new Text('Photo'),
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        isExpanded: events.isExpanded,
                      );
                    }).toList(),
                  ),
                ),
              ),
              isExpanded: events.isExpandedEvent,
            );
          }).toList(),
        ),
      ),
    );
  }
}
