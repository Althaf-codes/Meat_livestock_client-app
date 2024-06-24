import 'package:flutter/material.dart';
import 'package:mq/constants/Global_Variables.dart';

class MeatSellerScreen extends StatelessWidget {
  const MeatSellerScreen({Key? key}) : super(key: key);

  static const String _route = '/MeatSellerScreen';

  static get route => _route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.selectedNavBarColor,
        title: const Text('Meat SellerScreen'),
      ),
      body: const Center(child: Text('MeatSellerScreen')),
    );
  }
}
