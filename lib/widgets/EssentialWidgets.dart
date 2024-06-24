import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/Global_Variables.dart';

Widget notificationWidget(String text, VoidCallback ontap) {
  return InkWell(
    onTap: () {
      ontap;
    },
    child: Container(
      width: 72,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(Icons.notifications_outlined, color: Colors.black, size: 25),
              // Text('2', overflow: TextOverflow.ellipsis),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.red),
              alignment: Alignment.center,
              child: const Text(
                '1',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget searchBar(BuildContext context, VoidCallback ontap) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 7),
    child: Container(
      alignment: Alignment.bottomCenter,
      height: 20,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        onFieldSubmitted: (String text) {},
        decoration: InputDecoration(
          prefixIcon: InkWell(
            onTap: () {
              ontap;
            },
            child: const Padding(
              padding: EdgeInsets.only(
                left: 6,
              ),
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 23,
              ),
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.only(top: 10),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide.none,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide.none,
          ),
          hintText: 'Search...',
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
        ),
      ),
    ),
  );
}

Widget sortFilter(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      ElevatedButton.icon(
        icon: const Icon(
          FontAwesomeIcons.sort,
          color: Colors.white,
          size: 18,
        ),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: GlobalVariables.selectedNavBarColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        label: const Text('Sort',
            style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500)),
      ),
      ElevatedButton.icon(
        icon: const Icon(
          Icons.sort,
          color: Colors.white,
          size: 18,
        ),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: GlobalVariables.selectedNavBarColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        label: const Text('Filter',
            style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500)),
      ),
    ],
  );
}
