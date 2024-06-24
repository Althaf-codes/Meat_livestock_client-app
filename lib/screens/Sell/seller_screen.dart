import 'package:flutter/material.dart';
import 'package:mq/screens/Sell/ProductDetailGettingScreens/pet_selling_screen.dart';
import 'package:mq/screens/Sell/ProductDetailGettingScreens/product_selling_screen_widget.dart';
import 'package:mq/widgets/horizontal_text_title.dart';
import 'package:mq/widgets/multiTextFeild.dart';
import 'package:mq/widgets/testWidget.dart';

import '../../constants/Global_Variables.dart';

class SellerScreen extends StatelessWidget {
  String? sellerName;
  SellerScreen({Key? key, required this.sellerName}) : super(key: key);
  static const String _route = '/SellerScreen';

  static get route => _route;
  @override
  Widget build(BuildContext context) {
    final mheight = MediaQuery.of(context).size.height;
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: 'SellerFAB',
        tooltip: 'Sell',
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (route) => const ProductSellingScreen()));
        },
        backgroundColor: GlobalVariables.secondaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Hi, ${sellerName!}',
                    style: TextStyle(
                        wordSpacing: 1,
                        color: GlobalVariables.selectedNavBarColor,
                        fontSize: 19,
                        fontWeight: FontWeight.w700)),
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Text(
                    'Sell New Product',
                    style: TextStyle(
                        letterSpacing: 1,
                        color: GlobalVariables.selectedNavBarColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: GlobalVariables.selectedNavBarColor,
                              shape: const StadiumBorder(),
                              minimumSize: const Size(100, 50),
                              maximumSize: Size(150, 50)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (route) =>
                                        const ProductSellingScreen()));
                          },
                          icon: const Image(
                            height: 30,
                            width: 35,
                            image: AssetImage('assets/category/dog.png'),
                            fit: BoxFit.fitHeight,
                          ),
                          label: const Text('Pet')),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: GlobalVariables.selectedNavBarColor,
                              shape: const StadiumBorder(),
                              minimumSize: const Size(100, 50),
                              maximumSize: Size(150, 50)),
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (route) => MyForm(
                            //               label: 'Enter Sizes',
                            //               hint: '1,2,3',
                            //             )));
                          },
                          icon: const Image(
                            height: 30,
                            width: 35,
                            image: AssetImage(
                              'assets/category/cow.png',
                            ),
                            fit: BoxFit.fitHeight,
                          ),
                          label: const Text('Cattle')),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: GlobalVariables.selectedNavBarColor,
                              shape: const StadiumBorder(),
                              minimumSize: const Size(100, 50),
                              maximumSize: Size(150, 50)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (route) => TestWidget()));
                          },
                          icon: const Image(
                            height: 30,
                            width: 35,
                            image: AssetImage('assets/category/collar.png'),
                            fit: BoxFit.fitHeight,
                          ),
                          label: const Text('Accessories')),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: GlobalVariables.selectedNavBarColor,
                              shape: const StadiumBorder(),
                              minimumSize: const Size(100, 50),
                              maximumSize: Size(150, 50)),
                          onPressed: () {},
                          icon: const Image(
                            height: 30,
                            width: 35,
                            image: AssetImage('assets/category/dog-food.png'),
                            fit: BoxFit.fitHeight,
                          ),
                          label: const Text('Feed')),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: GlobalVariables.selectedNavBarColor,
                              shape: const StadiumBorder(),
                              minimumSize: const Size(100, 50),
                              maximumSize: Size(150, 50)),
                          onPressed: () {},
                          icon: const Image(
                            height: 30,
                            width: 35,
                            image: AssetImage('assets/category/medicine.png'),
                            fit: BoxFit.fitHeight,
                          ),
                          label: const Text('Medicine')),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: GlobalVariables.selectedNavBarColor,
                              shape: const StadiumBorder(),
                              minimumSize: const Size(100, 50),
                              maximumSize: Size(150, 50)),
                          onPressed: () {},
                          icon: const Image(
                            height: 30,
                            width: 35,
                            image: AssetImage(
                              'assets/category/collar.png',
                            ),
                            fit: BoxFit.fitHeight,
                          ),
                          label: const Text('Toy')),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: GlobalVariables.selectedNavBarColor,
                              shape: const StadiumBorder(),
                              minimumSize: const Size(100, 50),
                              maximumSize: Size(150, 50)),
                          onPressed: () {},
                          icon: const Image(
                            height: 30,
                            width: 35,
                            image: AssetImage('assets/category/medicine.png'),
                            fit: BoxFit.fitHeight,
                          ),
                          label: const Text('Others')),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Text(
                    'Your Products',
                    style: TextStyle(
                        letterSpacing: 1,
                        wordSpacing: 1,
                        color: GlobalVariables.selectedNavBarColor,
                        fontSize: 19,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Container(
                            height: mheight * 0.3,
                            width: mwidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 1.5,
                                  color: GlobalVariables.secondaryColor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: mheight,
                                  width: mwidth * 0.5,
                                  decoration: BoxDecoration(
                                    color: GlobalVariables.secondaryColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        bottomLeft: Radius.circular(12)),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      // mainAxisAlignment:
                                      //       MainAxisAlignment.start,
                                      //   crossAxisAlignment:
                                      //       CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Product Name',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          'Product Description ..........................876543465768790ijgchfrd6r7tgv jkjkvcjj bv gjj bjvkv ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        HorizontalTitleText(
                                            title: 'Category',
                                            text: 'Cattle',
                                            maxline: 1),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        HorizontalTitleText(
                                            title: 'Price',
                                            text: '₹25000',
                                            maxline: 2),
                                        SizedBox(
                                          height: 3,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
