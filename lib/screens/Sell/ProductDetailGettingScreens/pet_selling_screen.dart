import 'package:flutter/material.dart';
import 'package:mq/screens/Sell/ProductDetailGettingScreens/product_selling_screen_widget.dart';

class PetSelling extends StatefulWidget {
  const PetSelling({Key? key}) : super(key: key);

  @override
  State<PetSelling> createState() => _PetSellingState();
}

class _PetSellingState extends State<PetSelling> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController highlightDescriptionController =
      TextEditingController();
  final TextEditingController elaborateDescriptionController =
      TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController deliverableSpanController =
      TextEditingController();

  final formGlobalKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    highlightDescriptionController.dispose();
    elaborateDescriptionController.dispose();
    quantityController.dispose();
    priceController.dispose();
    stockController.dispose();
    discountController.dispose();
    deliverableSpanController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          // ProductSellingScreen(
          //   formGlobalKey: formGlobalKey,
          //   productNameController: productNameController,
          //   descriptionController: descriptionController,
          //   deliverableSpanController: deliverableSpanController,
          //   discountController: discountController,
          //   elaborateDescriptionController: elaborateDescriptionController,
          //   highlightDescriptionController: highlightDescriptionController,
          //   priceController: priceController,
          //   quantityController: quantityController,
          //   stockController: stockController,
          //   onSubmit: () {
          //     if (formGlobalKey.currentState!.validate()) {
          //       formGlobalKey.currentState!.save();
          //     }
          //   },
          // ),
          Container(
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
