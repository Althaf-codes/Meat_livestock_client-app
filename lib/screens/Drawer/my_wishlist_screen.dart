import 'package:flutter/material.dart';

class MyWishListScreen extends StatelessWidget {
  const MyWishListScreen({Key? key}) : super(key: key);
  static String _route = '/MyWishListScreen';

  static get route => _route;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyWishList '),
      ),
      body: Center(child: Text('MyWishList Screen')),
    );
  }
}
