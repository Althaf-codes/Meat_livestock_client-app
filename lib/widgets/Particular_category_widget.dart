import 'package:flutter/material.dart';
import 'package:mq/models/pet_imgName.dart';

import '../constants/Global_Variables.dart';
import 'imageTitle_widget.dart';

class ParticularAllCategoryWidget extends StatelessWidget {
  String categoryTitle;
  String buttonName;
  List<PetImgName> categoryData;
  Color bgColor;
  // List<String?> imgUrls;

  ParticularAllCategoryWidget(
      {Key? key,
      required this.categoryTitle,
      required this.buttonName,
      required this.categoryData,
      this.bgColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(categoryTitle.toString(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: GlobalVariables.selectedNavBarColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(buttonName.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 13,
                    )
                  ],
                ))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          //    height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: bgColor, //Color.fromARGB(255, 29, 201, 192),
              borderRadius: BorderRadius.circular(12),
              border: bgColor == Colors.white
                  ? Border.all(
                      color: GlobalVariables.selectedNavBarColor, width: 2)
                  : const Border()),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categoryData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //mainAxisExtent: 300,
                    childAspectRatio: 3 / 4.5,
                    crossAxisCount: 4,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 8),
                itemBuilder: (context, index) {
                  return ImageTitle(text: categoryData[index].name.toString());
                }),
          ),
        )
      ],
    );
  }
}
