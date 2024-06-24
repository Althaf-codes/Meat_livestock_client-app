import 'package:flutter/material.dart';
import 'package:mq/screens/Auth/normal_seller_signIn.dart';
import 'package:mq/screens/Sell/normal_seller_screen.dart';
import 'package:mq/screens/Sell/sell_screen.dart';

import '../screens/Auth/sign_in.dart';

import '../screens/Auth/sign_up.dart';

class SellerAuthToggle extends StatefulWidget {
  const SellerAuthToggle({Key? key}) : super(key: key);

  @override
  State<SellerAuthToggle> createState() => _SellerAuthState();

  static String _route = '/sellerAuthToggle';

  static get route => _route;
}

class _SellerAuthState extends State<SellerAuthToggle> {
  bool showSignIn = true;

  void toggleview() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return NormalSellerScreen(toggleView: toggleview);
    } else {
      return NormalSellerSignInScreen(toggleView: toggleview);
    }
  }
}
