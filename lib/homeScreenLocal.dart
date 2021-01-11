import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class HomeScreenLocal extends StatefulWidget {
  HomeScreenLocal({Key key}) : super(key: key);

  @override
  _HomeScreenLocalState createState() => _HomeScreenLocalState();
}

class _HomeScreenLocalState extends State<HomeScreenLocal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: notification,
          child: Text('Web Local Notificatin'),
        ),
      ),
    );
  }

  void notification() async {
    var result = await html.Notification.requestPermission();
    if (result == 'granted') {
      sendLocalNotification();
    }
  }

  void sendLocalNotification() async {
    //https://friano.me/favicon.png
    var title = "Flutter web";
    var body = "Test Notification From Flutter Web";
    var icon = "http://friano.me/favicon.png";

    html.Notification(title, body: body, icon: icon);
  }
}
