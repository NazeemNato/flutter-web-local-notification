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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: sendLocalNotification,
              child: Text('Send notification'),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: scheduleLocalNotification,
              child: Text('Schedule notification'),
            ),
          ],
        ),
      ),
    );
  }

  void sendLocalNotification() async {
    var result = await html.Notification.requestPermission();
    if (result == 'granted') {
      var title = "Flutter web",
          body = "Test Notification From Flutter Web",
          icon = "http://friano.me/favicon.png";

      html.Notification(title, body: body, icon: icon);
    }
  }

  void scheduleLocalNotification() async {
    var reg = await html.window.navigator.serviceWorker.getRegistration();
    var result = await html.Notification.requestPermission();
    if (result == 'granted') {
      var timestamp = DateTime.now().microsecondsSinceEpoch + 100 * 1000;
      var data = {
        "tag": timestamp, 
        "body":"Schedule notification from flutter web",
        // "showTrigger": html.window.navigator.ti(timestamp)
      };
      reg.showNotification('flutter web',data);
    }
  }
}
