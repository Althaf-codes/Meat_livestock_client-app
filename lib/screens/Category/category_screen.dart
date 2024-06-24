import 'package:flutter/material.dart';
import 'package:mq/widgets/Particular_category_widget.dart';

import '../../constants/Global_Variables.dart';
import '../../models/pet_imgName.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  static String _route = '/Category';

  static get route => _route;
  @override
  Widget build(BuildContext context) {
    List<PetImgName> allpets = GlobalVariables.allPet;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 29, 201, 192),
          title: const Text('All Category',
              style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500)),
          actions: [
            IconButton(
              onPressed: () {},
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
          children: [
            ParticularAllCategoryWidget(
                categoryTitle: 'Pets',
                buttonName: 'Explore',
                categoryData: allpets),
            const SizedBox(
              height: 10,
            ),
            ParticularAllCategoryWidget(
              categoryTitle: 'Meat',
              buttonName: 'View',
              categoryData: allpets,
              bgColor: const Color.fromARGB(255, 29, 201, 192),
            ),
            const SizedBox(
              height: 10,
            ),
            ParticularAllCategoryWidget(
              categoryTitle: 'Feed',
              buttonName: 'More',
              categoryData: allpets,
              bgColor: const Color.fromARGB(255, 255, 243, 136),
            ),
            const SizedBox(
              height: 10,
            ),
            ParticularAllCategoryWidget(
              categoryTitle: 'Accessories',
              buttonName: 'View All',
              categoryData: allpets,
              bgColor: const Color.fromARGB(255, 168, 216, 255),
            )
          ],
        ),
      )),
    );
  }
}
