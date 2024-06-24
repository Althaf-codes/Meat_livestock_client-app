import 'package:flutter/material.dart';

import '../constants/Global_Variables.dart';

class BigProductCardList extends StatefulWidget {
  const BigProductCardList({Key? key}) : super(key: key);

  @override
  State<BigProductCardList> createState() => _BigProductCardListState();
}

class _BigProductCardListState extends State<BigProductCardList> {
  final qty = ['1', '2', '3', 'more...'];
  String? initalqty = '1';
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              // color: Color.fromARGB(255, 164, 214, 255),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.yellow,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fitHeight,
                                        image: AssetImage(
                                            'assets/category/cow.png'))),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                alignment: Alignment.center,
                                height: 30,
                                width: 110,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: Colors.black,
                                    )),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    underline:
                                        const Divider(color: Colors.black),
                                    elevation: 0,
                                    value: initalqty,
                                    iconSize: 15,
                                    icon: const Icon(
                                      Icons.arrow_drop_down_circle_outlined,
                                      color: Colors.black,
                                    ),
                                    items: qty.map(buildMenuItem).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        initalqty = newValue;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 4),
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: MediaQuery.of(context).size.width - 150,
                          //  color: Color.fromARGB(255, 252, 157, 150),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'Title of the product',
                                maxLines: 1,
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Higlighted Description',
                                maxLines: 1,
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: '',
                                    style: const TextStyle(wordSpacing: 3),
                                    children: [
                                      const TextSpan(
                                          text: '*****',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.green)),
                                      TextSpan(
                                          text: ' (1,237) ',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey[800])),
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    text: '',
                                    style: const TextStyle(wordSpacing: 3),
                                    children: [
                                      TextSpan(
                                          text: '₹59999',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey[800])),
                                      const TextSpan(
                                          text: ' ₹39999 ',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      const TextSpan(
                                          text: '  35% off',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.green))
                                    ]),
                              ),
                              const Text(
                                '2 offers available',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.green),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Text(
                      'only 2 left', // 'Currently out of stock for 604303',
                      maxLines: 2,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text(
                          'Delivery by Thu Jun 16',
                          style: TextStyle(
                              color: Colors.black,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          ' | ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Free ₹100',
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.green,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            style: TextButton.styleFrom(
                                shape: const RoundedRectangleBorder(),
                                side: BorderSide(
                                  color: GlobalVariables.selectedNavBarColor,
                                )),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.save_outlined,
                                  color: GlobalVariables.selectedNavBarColor,
                                ),
                                Text(
                                  'Save for later',
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color:
                                          GlobalVariables.selectedNavBarColor),
                                ),
                              ],
                            )),
                        TextButton(
                            style: TextButton.styleFrom(
                                shape: const RoundedRectangleBorder(),
                                side: BorderSide(
                                  color: GlobalVariables.selectedNavBarColor,
                                )),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.delete_outline,
                                  color: GlobalVariables.selectedNavBarColor,
                                ),
                                Text(
                                  'Remove',
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color:
                                          GlobalVariables.selectedNavBarColor),
                                ),
                              ],
                            )),
                        TextButton(
                            style: TextButton.styleFrom(
                                shape: const RoundedRectangleBorder(),
                                side: BorderSide(
                                  color: GlobalVariables.selectedNavBarColor,
                                )),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.ads_click_outlined,
                                  color: GlobalVariables.selectedNavBarColor,
                                ),
                                Text(
                                  'Buy this now',
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color:
                                          GlobalVariables.selectedNavBarColor),
                                ),
                              ],
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
        value: item,
        child: Text(
          'Qty: $item',
          style: const TextStyle(
              color: Colors.black, fontSize: 11, fontWeight: FontWeight.w800),
        ));
  }
}
