import 'package:flutter/material.dart';

import 'package:mq/widgets/EssentialWidgets.dart';
import 'package:mq/widgets/product_vertical_List.dart';
import 'package:mq/widgets/sliverAppbar.dart';

class ViewAllScreen extends StatelessWidget {
  String title;
  VoidCallback onSearchTap;
  ViewAllScreen({Key? key, required this.title, required this.onSearchTap})
      : super(key: key);

  static const _route = '/ViewAllScreen';
  static get route => _route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            sliverAppBarWithBackarrow(context,
                icon1: IconButton(
                  onPressed: () {
                    onSearchTap;
                    // showSearch(context: context, delegate: MySearchDelegate());
                  },
                  icon: const Icon(Icons.search, color: Colors.black, size: 25),
                ),
                isSecondIcon: true,
                flexibleChild: sortFilter(context))
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  title.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const VerticalProductList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
