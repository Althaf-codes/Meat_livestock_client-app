import 'package:flutter/material.dart';
import 'package:mq/widgets/sponsored_image_widget.dart';

class SponsoredImageList extends StatelessWidget {
  const SponsoredImageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.19,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return SponsoredImagewidget(
              imgUrl: 'assets/category/medicine.png',
              offer: '60-90% off',
              price: 'Just ₹1,999',
            );
          }),
    );
  }
}
