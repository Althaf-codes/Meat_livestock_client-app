import 'package:flutter/material.dart';

import 'package:mq/screens/Sell/seller_login_request_screen.dart';
import 'package:mq/screens/Sell/seller_screen.dart';

class SellScreen extends StatelessWidget {
  bool? isSeller;
  String? sellerName;
  SellScreen({Key? key, required this.isSeller, required this.sellerName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mheight = MediaQuery.of(context).size.height;
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: !isSeller!
            ? const SellerLoginRequestScreen()
            : SellerScreen(
                sellerName: sellerName,
              ));
  }
}
