import 'package:flutter/material.dart';

class ImageTitle extends StatelessWidget {
  String text;
  ImageTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Image(
                    alignment: Alignment.center,
                    height: 50,
                    width: 50,
                    image: AssetImage('assets/category/dog.png')),
              )),
          Align(
            // alignment: Alignment.center,
            child: Text(text,
                maxLines: 2,
                style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600)),
          )
        ],
      ),
    );
  }
}
