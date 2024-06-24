import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mq/screens/Drawer/my_order_screen.dart';

import '../../widgets/EssentialWidgets.dart';
import '../../widgets/sliverAppbar.dart';
import '../Drawer/my_cart_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static String _route = '/Cart';

  static get route => _route;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                sliverAppBar(context,
                    title: '',
                    icon1: IconButton(
                      onPressed: () {
                        // showSearch(context: context, delegate: MySearchDelegate());
                      },
                      icon: const Icon(Icons.search,
                          color: Colors.black, size: 25),
                    ),
                    flexibleChild:
                        const TabBar(indicatorColor: Colors.black, tabs: [
                      Tab(
                        icon: Icon(Icons.shopping_cart_checkout_outlined),
                        text: 'My Cart',
                      ),
                      Tab(
                        icon: Icon(FontAwesomeIcons.firstOrder),
                        text: 'My Orders',
                      ),
                    ]))
              ];
            },
            body: TabBarView(
              children: [MyCartScreen(), MyOrderScreen()],
            )),
      ),
    );
  }
}
