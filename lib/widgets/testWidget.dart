import 'package:flutter/material.dart';
import 'package:mq/services/seller_service.dart';

import '../constants/Global_Variables.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SellerService sellerService = SellerService();
    return Scaffold(
      body: Container(
        child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                primary: GlobalVariables.selectedNavBarColor,
                shape: const StadiumBorder(),
                minimumSize: const Size(100, 50),
                maximumSize: Size(150, 50)),
            onPressed: () {
              sellerService.getProdID(context: context);
            },
            icon: const Image(
              height: 30,
              width: 35,
              image: AssetImage('assets/category/collar.png'),
              fit: BoxFit.fitHeight,
            ),
            label: const Text('Test')),
      ),
    );
  }
}
