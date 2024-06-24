import 'package:flutter/material.dart';
import 'package:mq/constants/Global_Variables.dart';

class PremiumSellerScreen extends StatelessWidget {
  const PremiumSellerScreen({Key? key}) : super(key: key);

  static const String _route = '/PremiumSellerScreen';

  static get route => _route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.selectedNavBarColor,
        title: const Text('Premium SellerScreen'),
      ),
      body: const Center(child: const Text('PremiumSellerScreen')),
    );
  }
}
