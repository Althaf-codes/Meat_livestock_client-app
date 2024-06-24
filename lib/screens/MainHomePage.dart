import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mq/constants/Global_Variables.dart';
import 'package:mq/screens/Account/accountScreen.dart';
import 'package:mq/screens/Auth/login_arguments.dart';
import 'package:mq/screens/Cart/cart_screen.dart';
import 'package:mq/screens/Category/category_screen.dart';
import 'package:mq/screens/Home/screen/home_screen.dart';
import 'package:mq/screens/Sell/sell_screen.dart';
import 'package:mq/widgets/ScrollToHideWidget.dart';
import 'package:mq/widgets/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  static const route = '/MainHomePage';

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _currentIndex = 0;
  bool isFab = false;
  bool isBottom = true;
  ScrollController bottomScrollController = ScrollController();
  String? sellerName;

  String? sellerPhoneNumber;
  bool? isSeller = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  void getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      sellerName = prefs.getString("x-sellerName");
      sellerPhoneNumber = prefs.getString("x-sellerPhoneNumber");
      isSeller = prefs.getBool("isSeller");
      print(
          'the name nd phno in setstae sellScreen file is $sellerName,$sellerPhoneNumber $isSeller');
    });
    if (isSeller == null) {
      setState(() {
        isSeller = false;
        print('its coming here and the value is $isSeller');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //  final Object? user = ModalRoute.of(context)!.settings.arguments;

    // final phnNum = widget.args.phnNum;
    // final name = widget.args.userName;
    // print("the phnNum in mainhomepage ${phnNum}");
    // print("the userName in mainhomePage  ${name}");
    List<Widget> screens = [
      HomeScreen(
        controller: bottomScrollController,
      ),
      const CategoryScreen(),
      const AccountScreen(),
      const CartScreen()
    ];
    // bool isPost = false;
    // bool true;
    return Scaffold(
      drawer: NavigationDrawer(),
      resizeToAvoidBottomInset: false,
      body: isFab
          ? SellScreen(
              isSeller: isSeller,
              sellerName: sellerName,
            )
          : screens[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: isFab
          ? ScrollToHideWidget(
              controller: bottomScrollController,
              child: FloatingActionButton.extended(
                  heroTag: 'MainFAB',
                  onPressed: () {
                    if (isFab == true) return;
                    if (isFab == false) {
                      setState(() {
                        isFab = true;
                      });
                    }
                  },
                  tooltip: 'Sell',
                  icon: const Icon(FontAwesomeIcons.telegram),
                  label: const Text(
                    "Sell",
                  ),
                  backgroundColor: GlobalVariables.selectedNavBarColor),
            )
          : ScrollToHideWidget(
              controller: bottomScrollController,
              child: FloatingActionButton(
                heroTag: 'MainFAB',
                onPressed: () {
                  if (isFab == true) return;
                  if (isFab == false) {
                    setState(() {
                      isFab = true;
                    });
                  }
                },
                backgroundColor:
                    isFab ? GlobalVariables.selectedNavBarColor : Colors.white,
                tooltip: 'Sell',
                child: Icon(
                  Icons.add_outlined,
                  color: isFab
                      ? Colors.white
                      : GlobalVariables.selectedNavBarColor,
                ),
              ),
            ),
      bottomNavigationBar: ScrollToHideWidget(
        controller: bottomScrollController,
        child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              padding: EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFab = false;
                        _currentIndex = 0;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.home,
                            color: _currentIndex == 0 && !isFab
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.unselectedNavBarColor,
                            size: _currentIndex == 0 && !isFab ? 28 : 24,
                          ),
                          Text(
                            _currentIndex == 0 && !isFab ? 'Home' : '',
                            style: TextStyle(
                                color: _currentIndex == 0 && !isFab
                                    ? GlobalVariables.selectedNavBarColor
                                    : GlobalVariables.unselectedNavBarColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFab = false;
                        _currentIndex = 1;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.category_outlined,
                            color: _currentIndex == 1 && !isFab
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.unselectedNavBarColor,
                            size: _currentIndex == 1 && !isFab ? 28 : 24,
                          ),
                          Text(
                            _currentIndex == 1 && !isFab ? 'Category' : '',
                            style: TextStyle(
                                color: _currentIndex == 1 && !isFab
                                    ? GlobalVariables.selectedNavBarColor
                                    : GlobalVariables.unselectedNavBarColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFab = false;
                        _currentIndex = 2;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.account_circle_rounded,
                            color: _currentIndex == 2 && !isFab
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.unselectedNavBarColor,
                            size: _currentIndex == 2 && !isFab ? 28 : 24,
                          ),
                          Text(
                            _currentIndex == 2 && !isFab ? 'Account' : '',
                            style: TextStyle(
                                color: _currentIndex == 2 && !isFab
                                    ? GlobalVariables.selectedNavBarColor
                                    : GlobalVariables.unselectedNavBarColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      setState(() {
                        isFab = false;
                        _currentIndex = 3;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.shopping_cart_checkout_outlined,
                            color: _currentIndex == 3 && !isFab
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.unselectedNavBarColor,
                            size: _currentIndex == 3 && !isFab ? 28 : 24,
                          ),
                          Text(
                            _currentIndex == 3 && !isFab ? 'Cart' : '',
                            style: TextStyle(
                                color: _currentIndex == 3 && !isFab
                                    ? GlobalVariables.selectedNavBarColor
                                    : GlobalVariables.unselectedNavBarColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  // const Icon(Icons.category_outlined),
                  // const Icon(Icons.account_circle_rounded),
                  // const Icon(Icons.shopping_cart_checkout_outlined),
                ],
              ),
            )),
      ),
    );
  }
}


// BottomNavigationBar(
//           // backgroundColor: Colors.greenAccent,
//           type: BottomNavigationBarType.fixed,
//           unselectedItemColor: GlobalVariables.unselectedNavBarColor,
//           selectedItemColor: isFab
//               ? GlobalVariables.unselectedNavBarColor
//               : GlobalVariables.selectedNavBarColor,
//           selectedLabelStyle:
//               TextStyle(
//color: _currentIndex==0&&!=isFab?GlobalVariables.selectedNavBarColor:GlobalVariables.unselectedNavBarColor,fontSize: 13, fontWeight: FontWeight.w600),
//           selectedIconTheme: IconThemeData(size: 28),
//           unselectedIconTheme: IconThemeData(size: 24),
//           currentIndex: _currentIndex,
//           onTap: (value) => setState(() {
//             _currentIndex = value;

//             isFab = false;

//             // isPost = false;
//             // true;
//           }),
//           items: [
//             BottomNavigationBarItem(
//               icon: const Icon(Icons.home),
//               label: _currentIndex == 0 && !isFab ? 'Home' : '',
//             ),
//             BottomNavigationBarItem(
//               icon: Padding(
//                 padding: const EdgeInsets.only(right: 18.0),
//                 child: const Icon(Icons.category_outlined),
//               ),
//               label: _currentIndex == 1 && !isFab ? 'Category    ' : '',
//             ),
//             BottomNavigationBarItem(
//               icon: Padding(
//                 padding: const EdgeInsets.only(left: 18.0),
//                 child: const Icon(Icons.account_circle_rounded),
//               ),
//               label: _currentIndex == 2 && !isFab ? '    Account' : '',
//             ),
//             BottomNavigationBarItem(
//               icon: const Icon(Icons.shopping_cart_checkout_outlined),
//               label: _currentIndex == 3 && !isFab ? 'Cart' : '',
//             ),
//           ],
//         ),





