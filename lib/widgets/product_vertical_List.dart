import 'package:flutter/material.dart';

class VerticalProductList extends StatelessWidget {
  const VerticalProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 300,
              childAspectRatio: 3 / 4.5,
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5),
          itemBuilder: (context, index) {
            return Container(
              // height: 200,
              // width: 50,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.21,
                    width: MediaQuery.of(context).size.width * 0.45,
                    //  padding: EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        // color: Color.fromARGB(255, 243, 69, 56),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)),
                        image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: AssetImage('assets/category/collar.png'))),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.17,
                    width: MediaQuery.of(context).size.width * 0.45,
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('REEBOK',
                            maxLines: 1,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        const Text('Trendy Sports Collar ',
                            maxLines: 1,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w700)),
                        RichText(
                          text: TextSpan(
                              text: '',
                              style: const TextStyle(wordSpacing: 3),
                              children: [
                                TextSpan(
                                    text: '1,299  ',
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey[800])),
                                const TextSpan(
                                    text: '₹189  ',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                                const TextSpan(
                                    text: '85% off',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.green))
                              ]),
                        ),
                        const Text(
                          'Free delivery',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        Expanded(
                          child: Text('****',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.green[700])),
                        ),
                        const Text('''Deal of the Day, 
 20h 46m 34s''',
                            maxLines: 2,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.green))
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}

// height: MediaQuery.of(context).size.height * 0.24*,
//      width: MediaQuery.of(context).size.width,
