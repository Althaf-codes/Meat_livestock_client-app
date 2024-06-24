import 'package:flutter/material.dart';
import 'package:mq/screens/Sell/premium_seller_screen.dart';

import '../../constants/Global_Variables.dart';
import '../../widgets/sellerAuthToggle.dart';
import 'meat_seller_screen.dart';

class SellerLoginRequestScreen extends StatelessWidget {
  const SellerLoginRequestScreen({Key? key}) : super(key: key);
  static const String _route = '/SellerLoginRequestScreen';

  static get route => _route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.workspace_premium_outlined,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, PremiumSellerScreen.route);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      primary: GlobalVariables.selectedNavBarColor),
                  label: const Text(
                    'SignIn as Premium Seller',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton.icon(
                  icon: const Icon(Icons.person_outline_outlined),
                  onPressed: () {
                    Navigator.pushNamed(context, SellerAuthToggle.route);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      primary: GlobalVariables.selectedNavBarColor),
                  label: const Text(
                    'SignIn as Normal Seller',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MeatSellerScreen.route);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      primary: GlobalVariables.selectedNavBarColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/category/chicken-leg.png')))),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'SignIn as MeatSeller',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
