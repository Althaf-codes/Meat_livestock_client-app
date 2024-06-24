import 'package:flutter/material.dart';
import 'package:mq/widgets/product_bigcard_List.dart';

import '../../constants/Global_Variables.dart';

class MyCartScreen extends StatelessWidget {
  bool isBottomNavPage;
  MyCartScreen({Key? key, this.isBottomNavPage = false}) : super(key: key);
  static String _route = '/MyCartScreen';

  static get route => _route;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isBottomNavPage
          ? AppBar(
              title: Text('MyCart '),
            )
          : PreferredSize(
              preferredSize: Size.fromHeight(10),
              child: Container(),
            ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Deliver To : ',
                                style: TextStyle(
                                    wordSpacing: 3,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                                children: [
                                  TextSpan(
                                      text: 'Althaf',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: ' ..., ',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: '604303',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: ' Home ',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          backgroundColor: Colors.black12,
                                          color: Colors.black))
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                text: '',
                                style: TextStyle(wordSpacing: 3),
                                children: [
                                  TextSpan(
                                      text: '2.241, Ecr main road, Marakkanam',
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey[800])),
                                ]),
                          ),
                        ],
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(),
                              side: BorderSide(
                                color: GlobalVariables.selectedNavBarColor,
                              )),
                          onPressed: () {},
                          child: Text(
                            'Change',
                            style: TextStyle(
                                color: GlobalVariables.selectedNavBarColor),
                          ))
                    ],
                  )),
              BigProductCardList()
            ],
          ),
        ),
      ),
    );
  }
}
