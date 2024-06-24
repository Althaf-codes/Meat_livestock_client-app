import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  static String _route = '/NotificationScreen';

  static get route => _route;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications '),
      ),
      body: Center(child: Text('Notification Screen')),
    );
  }
}
