import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/Global_Variables.dart';
import '../../models/pet_imgName.dart';
import '../../widgets/imageTitle_widget.dart';
import '../../widgets/product_horizontal_List.dart';
import '../../widgets/product_vertical_List.dart';

class AccessoryScreen extends StatelessWidget {
  const AccessoryScreen({Key? key}) : super(key: key);
  static String _route = '/AccessoryScreen';

  static get route => _route;
  @override
  Widget build(BuildContext context) {
    List<PetImgName> allpets = GlobalVariables.allPet;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 29, 201, 192),
          title: Text('Pets',
              style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500)),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: Colors.black, size: 25),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.mic, color: Colors.black, size: 25),
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
                    icon: Icon(
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
                    label: Text('Sort',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                  ),
                  ElevatedButton.icon(
                    icon: Icon(
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
                    label: Text('Filter',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text('All Accessories ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Container(
                //    height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 29, 201, 192),
                    borderRadius: BorderRadius.circular(12)),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: allpets.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
              HorizontalProductList(),
              VerticalProductList(),
            ],
          ),
        ),
      ),
    );
  }
}
