import 'package:flutter/material.dart';

class MyOrderScreen extends StatelessWidget {
  bool isBottomNavPage;
  MyOrderScreen({Key? key, this.isBottomNavPage = false}) : super(key: key);
  static String _route = '/MyOrderScreen';

  static get route => _route;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isBottomNavPage
          ? AppBar(
              title: Text('MyOrders '),
            )
          : PreferredSize(
              preferredSize: Size.fromHeight(10),
              child: Container(),
            ),
      body: Center(child: Text('MyOrder   Screen')),
    );
  }
}
