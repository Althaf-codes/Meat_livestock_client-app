import 'package:flutter/material.dart';
import 'package:mq/widgets/sponsored_image_widget.dart';
import 'package:mq/widgets/view_all_screen.dart';

import '../constants/Global_Variables.dart';

class TopDealWidget extends StatelessWidget {
  const TopDealWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Top Deals',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ViewAllScreen(
                              title: 'Top Deals ', onSearchTap: () {})));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: GlobalVariables.selectedNavBarColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('View All',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500)),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                          size: 18,
                        )
                      ],
                    ))
              ],
            ),
            Container(
              //color: Colors.red,
              height: 320,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  // clipBehavior: Clip.none,
                  shrinkWrap: true,
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return Center(
                      child: SponsoredImagewidget(
                        imgUrl: 'assets/category/cow.png',
                        offer: '50% off',
                        price: 'At just ₹2999',
                      ),
                    );
                  }),
            )
          ],
        ));
  }
}
