import 'package:flutter/material.dart';
import 'homeScreenLocal.dart';

class MyWeb extends StatelessWidget {
  const MyWeb({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Notification',
      home: HomeScreenLocal(),
    );
  }
}
