import 'package:flutter/material.dart';

class SponsoredImagewidget extends StatelessWidget {
  String offer;
  String price;
  String imgUrl;
  SponsoredImagewidget(
      {Key? key,
      required this.offer,
      required this.price,
      required this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              //  color: Colors.amber,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    imgUrl,
                  ))),
        ),
        Text(offer,
            style: const TextStyle(
                color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w300)),
        Text(price,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w500)),
      ]),
    );
    ;
  }
}
