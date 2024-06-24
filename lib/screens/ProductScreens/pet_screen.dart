import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mq/models/pet_imgName.dart';
import 'package:mq/widgets/imageTitle_widget.dart';
import 'package:mq/widgets/product_horizontal_List.dart';
import 'package:mq/widgets/product_vertical_List.dart';

import '../../Utils/search.dart';
import '../../constants/Global_Variables.dart';

class PetScreen extends StatelessWidget {
  const PetScreen({Key? key}) : super(key: key);
  static String _route = '/pets';

  static get route => _route;

  @override
  Widget build(BuildContext context) {
    List<PetImgName> allpets = GlobalVariables.allPet;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 29, 201, 192),
          title: const Text('Pets',
              style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500)),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegate());
              },
              icon: const Icon(Icons.search, color: Colors.black, size: 25),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.mic, color: Colors.black, size: 25),
            ),
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    label: const Text('Sort',
                        style: const TextStyle(
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
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    label: const Text('Filter',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('All Pets',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              Container(
                //    height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 29, 201, 192),
                    borderRadius: BorderRadius.circular(12)),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: allpets.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              //mainAxisExtent: 300,
                              childAspectRatio: 3 / 4.5,
                              crossAxisCount: 4,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 8),
                      itemBuilder: (context, index) {
                        return ImageTitle(text: allpets[index].name.toString());
                      }),
                ),
              ),
              const HorizontalProductList(),
              const VerticalProductList(),
            ],
          ),
        ),
      ),
    );
  }
}


// SingleChildScrollView(
//           child: Column(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height * 0.5,
//             width: MediaQuery.of(context).size.width,
//             color: Colors.red,
//           ),
//         ],