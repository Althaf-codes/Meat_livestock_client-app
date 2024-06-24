import 'package:flutter/material.dart';
import 'package:mq/constants/Global_Variables.dart';

class AdminAllSellersScreen extends StatelessWidget {
  const AdminAllSellersScreen({Key? key}) : super(key: key);

  static const String _route = '/AdminAllSellersScreen';

  static get route => _route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.selectedNavBarColor,
        title: const Text(
          'All Sellers',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(child: Text('AdminAllSellersScreen')),
    );
  }
}
