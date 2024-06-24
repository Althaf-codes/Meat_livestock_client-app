import 'package:flutter/material.dart';
import 'package:mq/constants/Global_Variables.dart';

import '../../services/auth_service.dart';
import '../../widgets/toggle.dart';

class AdminAllProductsScreen extends StatelessWidget {
  const AdminAllProductsScreen({Key? key}) : super(key: key);

  static const String _route = '/AdminAllProductsScreen';

  static get route => _route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.selectedNavBarColor,
        title: const Text(
          'All Products',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                AuthService().signOutSharedPreference(context);
                Navigator.pushNamedAndRemoveUntil(
                    context, Toggle.route, (route) => false);
              },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: const Center(child: Text('AdminAllProductsScreen')),
    );
  }
}
