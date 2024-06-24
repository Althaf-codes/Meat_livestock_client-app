import 'package:flutter/material.dart';
import 'package:mq/widgets/EssentialWidgets.dart';
import 'package:mq/widgets/carousel.dart';
import 'package:mq/widgets/categoryList.dart';

import 'package:mq/widgets/similarProduct_widget.dart';
import 'package:mq/widgets/sliverAppbar.dart';
import 'package:mq/widgets/specialOfferWidget.dart';
import 'package:mq/widgets/sponsored_imageList.dart';
import 'package:mq/widgets/topDeals.dart';

class HomeScreen extends StatelessWidget {
  ScrollController controller;
  HomeScreen({Key? key, required this.controller}) : super(key: key);

  static const String _route = '/Home';

  static get route => _route;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      //controller: controller,
      floatHeaderSlivers: true,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          sliverAppBar(context,
              isSecondIcon: true,
              icon1: notificationWidget('1', () {}),
              flexibleChild: searchBar(context, () {})),
        ];
      },
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12, top: 10),
              child: CategoryList(),
            ),
            Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: CarouselWidget()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SponsoredImageList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TopDealWidget(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SimilarProductWidget(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SpecialOfferWidget(),
            ),
            SizedBox(
              height: 500,
            )
          ],
        ),
      ),
    ));
  }
}
   


// Expanded(
//                 child: Container(
//                   height: 42,
//                   margin: const EdgeInsets.only(left: 13),
//                   child: Material(
//                     borderRadius: BorderRadius.circular(7),
//                     elevation: 1,
//                     child: TextFormField(
//                       onFieldSubmitted: (String text) {},
//                       decoration: InputDecoration(
//                         prefixIcon: InkWell(
//                           onTap: () {},
//                           child: const Padding(
//                             padding: EdgeInsets.only(
//                               left: 6,
//                             ),
//                             child: Icon(
//                               Icons.search,
//                               color: Colors.black,
//                               size: 23,
//                             ),
//                           ),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                         contentPadding: const EdgeInsets.only(top: 10),
//                         border: const OutlineInputBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(7),
//                           ),
//                           borderSide: BorderSide.none,
//                         ),
//                         enabledBorder: const OutlineInputBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(7),
//                           ),
//                           borderSide: BorderSide(
//                             color: Colors.black38,
//                             width: 1,
//                           ),
//                         ),
//                         hintText: 'Search...',
//                         hintStyle: const TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 17,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
        //),






        //ENTIRE APPBAR
        // PreferredSize(
        // preferredSize: const Size.fromHeight(100),
        // child: AppBar(
        //   title: Text(
        //     'Mq',
        //     style: TextStyle(
        //         color: Colors.white,
        //         fontSize: 15,
        //         fontWeight: FontWeight.bold,
        //         letterSpacing: 1),
        //   ),
        //   actions: [
        //     Container(
        //       color: Colors.transparent,
        //       height: 42,
        //       margin: const EdgeInsets.symmetric(horizontal: 10),
        //       child: const Icon(Icons.notifications_outlined,
        //           color: Colors.black, size: 25),
        //     ),
        //     Container(
        //       color: Colors.transparent,
        //       height: 42,
        //       margin: const EdgeInsets.symmetric(horizontal: 10),
        //       child: const Icon(Icons.mic, color: Colors.black, size: 25),
        //     ),
        //   ],
        //   bottom: PreferredSize(
        //     preferredSize: const Size.fromHeight(40.0),
        //     child: Expanded(
        //       child: Container(
        //         height: 40,
        //         margin: const EdgeInsets.only(
        //           left: 15,
        //           right: 15,
        //         ),
        //         child: Material(
        //           borderRadius: BorderRadius.circular(10),
        //           elevation: 1,
        //           child: TextFormField(
        //             onFieldSubmitted: (String text) {},
        //             decoration: InputDecoration(
        //               prefixIcon: InkWell(
        //                 onTap: () {},
        //                 child: const Padding(
        //                   padding: EdgeInsets.only(
        //                     left: 6,
        //                   ),
        //                   child: Icon(
        //                     Icons.search,
        //                     color: Colors.black,
        //                     size: 23,
        //                   ),
        //                 ),
        //               ),
        //               filled: true,
        //               fillColor: Colors.white,
        //               contentPadding: const EdgeInsets.only(top: 10),
        //               border: const OutlineInputBorder(
        //                 borderRadius: BorderRadius.all(
        //                   Radius.circular(10),
        //                 ),
        //                 borderSide: BorderSide.none,
        //               ),
        //               enabledBorder: const OutlineInputBorder(
        //                 borderRadius: BorderRadius.all(
        //                   Radius.circular(10),
        //                 ),
        //                 borderSide: BorderSide.none,
        //               ),
        //               hintText: 'Search...',
        //               hintStyle: const TextStyle(
        //                 fontWeight: FontWeight.w500,
        //                 fontSize: 17,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        //   elevation: 0.0,
        //   flexibleSpace: Container(
        //     decoration: const BoxDecoration(
        //       gradient: GlobalVariables.appBarGradient,
        //     ),
        //   ),
        // ),
      //),