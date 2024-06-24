import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mq/services/seller_service.dart';
import 'package:mq/widgets/textfomFeildWidget.dart';

import '../../../constants/Global_Variables.dart';
import '../../../widgets/multiTextFeild.dart';

class ProductSellingScreen extends StatefulWidget {
  // VoidCallback onSubmit;
  // GlobalKey<FormState> formGlobalKey;
  // TextEditingController productNameController;
  // TextEditingController descriptionController;
  // TextEditingController highlightDescriptionController;
  // TextEditingController elaborateDescriptionController;
  // TextEditingController quantityController;
  // TextEditingController priceController;
  // TextEditingController stockController;
  // TextEditingController discountController;
  // TextEditingController deliverableSpanController;
  const ProductSellingScreen({
    Key? key,
  }) : super(key: key);

  // required this.onSubmit,
  // required this.formGlobalKey,
  // required this.productNameController,
  // required this.descriptionController,
  // required this.deliverableSpanController,
  // required this.discountController,
  // required this.elaborateDescriptionController,
  // required this.highlightDescriptionController,
  // required this.priceController,
  // required this.quantityController,
  // required this.stockController})

  @override
  State<ProductSellingScreen> createState() => _ProductSellingScreenState();
}

class _ProductSellingScreenState extends State<ProductSellingScreen> {
  //Product
  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController highlightDescriptionController =
      TextEditingController();
  TextEditingController elaborateDescriptionController =
      TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController deliverableSpanController = TextEditingController();

//AnimalCategory
  TextEditingController subCategoryTypeController = TextEditingController();
  TextEditingController breedTypeController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController milkCapacityPerdayController = TextEditingController();
  TextEditingController milkCapacityPerMilkingController =
      TextEditingController();
  TextEditingController teethController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController numberOfOffSpringController = TextEditingController();
  TextEditingController approximateWeightController = TextEditingController();
  TextEditingController pregnancyMonthController = TextEditingController();
  TextEditingController numberOfBirthGivenController = TextEditingController();
  TextEditingController approximateHeightController = TextEditingController();
  TextEditingController approximateLengthController = TextEditingController();
  TextEditingController isSellingWithOffspringController =
      TextEditingController();

//Accessory

  TextEditingController brandNameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController usageController = TextEditingController();
  TextEditingController colorsController = TextEditingController();
  TextEditingController sizesController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController dimensionsController = TextEditingController();
  TextEditingController materialController = TextEditingController();
  TextEditingController countryOfOriginController = TextEditingController();

//FishAndAquatics

  TextEditingController nameController = TextEditingController();
  TextEditingController fishCategoryController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController fishAgeController = TextEditingController();
  TextEditingController fishColorsController = TextEditingController();
  TextEditingController fishWeightController = TextEditingController();
  TextEditingController packageTypeController = TextEditingController();

// Toy

  TextEditingController toybrandNameController = TextEditingController();
  TextEditingController toycategoryController = TextEditingController();
  TextEditingController toytypeController = TextEditingController();
  TextEditingController toyusageController = TextEditingController();
  TextEditingController toycolorsController = TextEditingController();
  TextEditingController toysizesController = TextEditingController();
  TextEditingController toyweightController = TextEditingController();
  TextEditingController toydimensionsController = TextEditingController();
  TextEditingController toymaterialController = TextEditingController();
  TextEditingController toycountryOfOriginController = TextEditingController();

  //Feed
  TextEditingController feedbrandNameController = TextEditingController();
  TextEditingController feedincludedIngredientsController =
      TextEditingController();
  TextEditingController feedweightController = TextEditingController();
  TextEditingController feedtargetSpeciesController = TextEditingController();
  TextEditingController feedsizesController = TextEditingController();
  TextEditingController feedflavourController = TextEditingController();
  TextEditingController feeditemFormController = TextEditingController();
  TextEditingController feedageRangeController = TextEditingController();
  TextEditingController feedpackageTypeController = TextEditingController();

//Meat

  TextEditingController meatbrandNameController = TextEditingController();
  TextEditingController meatmeatNameController = TextEditingController();
  TextEditingController meatpartsController = TextEditingController();
  TextEditingController meatweightController = TextEditingController();
  TextEditingController meatpackageTypeController = TextEditingController();
  TextEditingController meatcutAtController = TextEditingController();
  TextEditingController meatdeliveryChargeController = TextEditingController();

  bool isPregnant = false;

  bool isSellingWithOffSpring = false;
  final formGlobalKey = GlobalKey<FormState>();
  bool isObscure = true;
  ScrollController _scrollController = ScrollController();
  bool isHavingStock = false;
  bool isDiscountable = false;
  bool isDeliverable = false;

  SellerService sellerService = SellerService();
  @override
  void dispose() {
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

  final selectCategory = [
    'pets',
    'cattle',
    'birds',
    'fishAndAquatics',
    'poultry',
    'accessories',
    'medicine',
    'toy',
    'meat',
    'feed'
  ];
  String? selectedCategory = 'pets';
  bool isPet = true;
  bool isCattle = false;
  bool isbirds = false;
  bool isfishAndAquatics = false;
  bool ispoultry = false;
  bool isaccessories = false;
  bool ismedicine = false;
  bool istoy = false;
  bool ismeat = false;
  bool isfeed = false;

  static List<String?> friendsList = [null];
  static List<String?> randomList = [null];

  List<String?> test1 = [""];
  List<String?> test2 = [""];

  List<Widget> list1 = [];
  List<Widget> list2 = [];

  @override
  build(BuildContext context) {
    Widget form1 = MyForm(hint: "new label", label: "label", list: test1);
    Widget form2 = MyForm(hint: "mylabel", label: "my label", list: test2);
    return Scaffold(
        // backgroundColor: const Color.fromARGB(255, 29, 201, 192),
        appBar: AppBar(
          backgroundColor: GlobalVariables.selectedNavBarColor,
          title: const Text('Normal SellerScreen'),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://previews.123rf.com/images/jenemilia/jenemilia1303/jenemilia130300189/18640769-pet-paw-imprint-seamless-pattern-in-green-and-white-colors.jpg"),
                    // "https://t3.ftcdn.net/jpg/02/00/12/40/360_F_200124079_6ayr4VU5AhLMfwPaDOxIk6Dgv0JWaCwX.jpg"),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formGlobalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0),
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: TextFormField(
                          cursorColor: const Color.fromARGB(255, 29, 201, 192),
                          decoration: InputDecoration(
                              labelStyle: const TextStyle(
                                  //   color: Colors.white,
                                  // ),
                                  color:
                                      const Color.fromARGB(255, 29, 201, 192)),
                              hintText: 'Enter your ProductName',
                              labelText: 'ProductName',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 29, 201, 192),
                                      style: BorderStyle.solid,
                                      width: 2)),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: Colors.red,
                                    style: BorderStyle.solid,
                                    width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                gapPadding: 10,
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: GlobalVariables.selectedNavBarColor,
                                    style: BorderStyle.solid,
                                    width: 2),
                              ),
                              focusColor: Colors.white,
                              // border: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(20),
                              //   borderSide: const BorderSide(
                              //       color: Colors.transparent,
                              //       style: BorderStyle.solid,
                              //       width: 5),
                              // ),
                              prefixIcon: IconButton(
                                icon: const Icon(
                                  Icons.person,
                                  color: Color.fromARGB(255, 29, 201, 192),
                                ),
                                onPressed: () {},
                              ),
                              fillColor: Colors.white,
                              filled: true),
                          controller: productNameController,
                          validator: (name) {
                            if (name != null && name.length < 5)
                              return "The Username Should Have Atleast 3 letter ";
                            else if (name!.length >= 5) {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0),
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: TextFormField(
                          maxLines: 3,
                          cursorColor: const Color.fromARGB(255, 29, 201, 192),
                          decoration: InputDecoration(
                              labelStyle: const TextStyle(
                                  color:
                                      const Color.fromARGB(255, 29, 201, 192)),
                              hintText: 'Short description..',
                              labelText: 'Description',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: GlobalVariables.secondaryColor,
                                    style: BorderStyle.solid,
                                    width: 2),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: Colors.red,
                                    style: BorderStyle.solid,
                                    width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                gapPadding: 10,
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: GlobalVariables.selectedNavBarColor,
                                    style: BorderStyle.solid,
                                    width: 2),
                              ),
                              focusColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    style: BorderStyle.solid,
                                    width: 5),
                              ),
                              prefixIcon: IconButton(
                                icon: const Icon(
                                  Icons.person,
                                  color: Color.fromARGB(255, 29, 201, 192),
                                ),
                                onPressed: () {},
                              ),
                              fillColor: Colors.white,
                              filled: true),
                          controller: descriptionController,
                          validator: (name) {
                            if (name != null && name.length < 5)
                              return "The Description Should Have Atleast 1 line ";
                            else if (name!.length >= 5) {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0),
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: TextFormField(
                          maxLines: 1,
                          cursorColor: const Color.fromARGB(255, 29, 201, 192),
                          decoration: InputDecoration(
                              labelStyle: const TextStyle(
                                  color:
                                      const Color.fromARGB(255, 29, 201, 192)),
                              hintText: 'Product highlights i.e(6litres/day,)',
                              labelText: 'Highlights (i.e. Optional)',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: GlobalVariables.secondaryColor,
                                    style: BorderStyle.solid,
                                    width: 2),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: Colors.red,
                                    style: BorderStyle.solid,
                                    width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                gapPadding: 10,
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: GlobalVariables.selectedNavBarColor,
                                    style: BorderStyle.solid,
                                    width: 2),
                              ),
                              focusColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    style: BorderStyle.solid,
                                    width: 5),
                              ),
                              prefixIcon: IconButton(
                                icon: const Icon(
                                  Icons.person,
                                  color: Color.fromARGB(255, 29, 201, 192),
                                ),
                                onPressed: () {},
                              ),
                              fillColor: Colors.white,
                              filled: true),
                          controller: highlightDescriptionController,
                          validator: (name) {
                            if (name != null && name.length < 5)
                              return "The Highlight Should Have Atleast 2 Property ";
                            else if (name!.length >= 5) {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0),
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: TextFormField(
                          maxLines: 20,
                          cursorColor: const Color.fromARGB(255, 29, 201, 192),
                          decoration: InputDecoration(
                              labelStyle: const TextStyle(
                                  color:
                                      const Color.fromARGB(255, 29, 201, 192)),
                              hintText: '''
Example :
-Complete & balanced dog food, a perfect food for adult dogs
-Contains 20% crude Protein, 10% crude Fat, and 5% crude Fibre
-Provides strong muscles, bones & teeth and healthier & shinier coat
-Developed by experts at the Waltham Centre for Pet Nutrition
''',
                              labelText: 'About This Product ',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: GlobalVariables.secondaryColor,
                                    style: BorderStyle.solid,
                                    width: 2),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: Colors.red,
                                    style: BorderStyle.solid,
                                    width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                gapPadding: 10,
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: GlobalVariables.selectedNavBarColor,
                                    style: BorderStyle.solid,
                                    width: 2),
                              ),
                              focusColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    style: BorderStyle.solid,
                                    width: 5),
                              ),
                              prefixIcon: IconButton(
                                icon: const Icon(
                                  Icons.person,
                                  color: Color.fromARGB(255, 29, 201, 192),
                                ),
                                onPressed: () {},
                              ),
                              fillColor: Colors.white,
                              filled: true),
                          controller: elaborateDescriptionController,
                          validator: (name) {
                            if (name != null && name.length < 5)
                              return "The about should have atleast 3-4 lines ";
                            else if (name!.length >= 5) {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 15.0),
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                cursorColor:
                                    const Color.fromARGB(255, 29, 201, 192),
                                decoration: InputDecoration(
                                    labelStyle: const TextStyle(
                                        color: const Color.fromARGB(
                                            255, 29, 201, 192)),
                                    hintText: 'Enter quantity',
                                    labelText: 'Quantity',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: GlobalVariables.secondaryColor,
                                          style: BorderStyle.solid,
                                          width: 2),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.red,
                                          style: BorderStyle.solid,
                                          width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      gapPadding: 10,
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: GlobalVariables
                                              .selectedNavBarColor,
                                          style: BorderStyle.solid,
                                          width: 2),
                                    ),
                                    focusColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          style: BorderStyle.solid,
                                          width: 5),
                                    ),
                                    prefixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.person,
                                        color:
                                            Color.fromARGB(255, 29, 201, 192),
                                      ),
                                      onPressed: () {},
                                    ),
                                    fillColor: Colors.white,
                                    filled: true),
                                controller: quantityController,
                                validator: (value) {
                                  if (value!.isEmpty || value == null)
                                    return "The Quantity Feild is Necessary  ";
                                  else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 15.0),
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                cursorColor:
                                    const Color.fromARGB(255, 29, 201, 192),
                                decoration: InputDecoration(
                                    labelStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 29, 201, 192)),
                                    hintText: 'Enter the Product price',
                                    labelText: '₹Price',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: GlobalVariables.secondaryColor,
                                          style: BorderStyle.solid,
                                          width: 2),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.red,
                                          style: BorderStyle.solid,
                                          width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      gapPadding: 10,
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: GlobalVariables
                                              .selectedNavBarColor,
                                          style: BorderStyle.solid,
                                          width: 2),
                                    ),
                                    focusColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          style: BorderStyle.solid,
                                          width: 5),
                                    ),
                                    prefixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.person,
                                        color:
                                            Color.fromARGB(255, 29, 201, 192),
                                      ),
                                      onPressed: () {},
                                    ),
                                    fillColor: Colors.white,
                                    filled: true),
                                controller: priceController,
                                validator: (value) {
                                  if (value!.isEmpty || value == null)
                                    return "The Price Feild is Necessary  ";
                                  else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: GlobalVariables.secondaryColor,
                              style: BorderStyle.solid,
                              width: 2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Do you have Stock ?',
                              style: TextStyle(
                                  color: GlobalVariables.secondaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            Switch(
                              value: isHavingStock,
                              onChanged: (value) {
                                setState(() {
                                  isHavingStock = value;
                                  print(isHavingStock);
                                });
                              },
                              activeTrackColor: GlobalVariables.secondaryColor,
                              activeColor: GlobalVariables.selectedNavBarColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    isHavingStock
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 15.0),
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                cursorColor:
                                    const Color.fromARGB(255, 29, 201, 192),
                                decoration: InputDecoration(
                                    labelStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 29, 201, 192)),
                                    hintText: 'Enter StockQuantity',
                                    labelText: 'Stock Quantity',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: GlobalVariables.secondaryColor,
                                          style: BorderStyle.solid,
                                          width: 2),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.red,
                                          style: BorderStyle.solid,
                                          width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      gapPadding: 10,
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: GlobalVariables
                                              .selectedNavBarColor,
                                          style: BorderStyle.solid,
                                          width: 2),
                                    ),
                                    focusColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          style: BorderStyle.solid,
                                          width: 5),
                                    ),
                                    prefixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.person,
                                        color:
                                            Color.fromARGB(255, 29, 201, 192),
                                      ),
                                      onPressed: () {},
                                    ),
                                    fillColor: Colors.white,
                                    filled: true),
                                controller: stockController,
                                validator: (value) {
                                  if (value!.isEmpty || value == null)
                                    return "Please Enter Total No.Of.Stock  ";
                                  else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          )
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: GlobalVariables.secondaryColor,
                              style: BorderStyle.solid,
                              width: 2),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Will you offer discount?',
                                  style: TextStyle(
                                      color: GlobalVariables.secondaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Switch(
                                  value: isDiscountable,
                                  onChanged: (value) {
                                    setState(() {
                                      isDiscountable = value;
                                      print(isDiscountable);
                                    });
                                  },
                                  activeTrackColor:
                                      GlobalVariables.secondaryColor,
                                  activeColor:
                                      GlobalVariables.selectedNavBarColor,
                                ),
                              ],
                            ),
                            isDiscountable
                                ? const Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Text(
                                      'Note: The dicount amount will be deducted from the original price',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    isDiscountable
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 15.0),
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: TextFormField(
                                cursorColor:
                                    const Color.fromARGB(255, 29, 201, 192),
                                decoration: InputDecoration(
                                    labelStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 29, 201, 192)),
                                    hintText: 'Enter discount percentage',
                                    labelText: 'Discount (i.e. 5%)',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: GlobalVariables.secondaryColor,
                                          style: BorderStyle.solid,
                                          width: 2),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.red,
                                          style: BorderStyle.solid,
                                          width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      gapPadding: 10,
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: GlobalVariables
                                              .selectedNavBarColor,
                                          style: BorderStyle.solid,
                                          width: 2),
                                    ),
                                    focusColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          style: BorderStyle.solid,
                                          width: 5),
                                    ),
                                    prefixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.person,
                                        color:
                                            Color.fromARGB(255, 29, 201, 192),
                                      ),
                                      onPressed: () {},
                                    ),
                                    fillColor: Colors.white,
                                    filled: true),
                                controller: discountController,
                                validator: (value) {
                                  if (value!.isEmpty || value == null)
                                    return "The quantity feild is necessary  ";
                                  else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          )
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15.0),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: GlobalVariables.secondaryColor,
                              style: BorderStyle.solid,
                              width: 2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Do you deliver this product?',
                              style: TextStyle(
                                  color: GlobalVariables.secondaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            Switch(
                              value: isDeliverable,
                              onChanged: (value) {
                                setState(() {
                                  isDeliverable = value;
                                  print(isDeliverable);
                                });
                              },
                              activeTrackColor: GlobalVariables.secondaryColor,
                              activeColor: GlobalVariables.selectedNavBarColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    isDeliverable
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 15.0),
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: TextFormField(
                                cursorColor:
                                    const Color.fromARGB(255, 29, 201, 192),
                                decoration: InputDecoration(
                                    labelStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 29, 201, 192)),
                                    hintText:
                                        'TamilNadu,Kerala,Andhra Pradesh..',
                                    labelText: 'Deliverable regions',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: GlobalVariables.secondaryColor,
                                          style: BorderStyle.solid,
                                          width: 2),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.red,
                                          style: BorderStyle.solid,
                                          width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      gapPadding: 10,
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: GlobalVariables
                                              .selectedNavBarColor,
                                          style: BorderStyle.solid,
                                          width: 2),
                                    ),
                                    focusColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          style: BorderStyle.solid,
                                          width: 5),
                                    ),
                                    prefixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.person,
                                        color:
                                            Color.fromARGB(255, 29, 201, 192),
                                      ),
                                      onPressed: () {},
                                    ),
                                    fillColor: Colors.white,
                                    filled: true),
                                controller: deliverableSpanController,
                                validator: (name) {
                                  if (name != null && name.length < 5)
                                    return "Enter a valid region ";
                                  else if (name!.length >= 5) {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          )
                        : Container(),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Select Category',
                            style: TextStyle(
                                fontSize: 16,
                                color: GlobalVariables.selectedNavBarColor,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            alignment: Alignment.center,
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.90,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: GlobalVariables.selectedNavBarColor,
                                    width: 2)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                underline: Divider(color: Colors.black),
                                elevation: 0,
                                value: selectedCategory,
                                iconSize: 20,
                                icon: Icon(
                                    Icons.arrow_drop_down_circle_outlined,
                                    color: GlobalVariables.selectedNavBarColor),
                                items:
                                    selectCategory.map(buildMenuItem).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedCategory = newValue;
                                  });
                                  if (newValue == 'pets') {
                                    setState(() {
                                      isPet = true;

                                      isCattle = false;
                                      isbirds = false;
                                      isfishAndAquatics = false;
                                      ispoultry = false;
                                      isaccessories = false;
                                      ismedicine = false;
                                      istoy = false;
                                      ismeat = false;
                                      isfeed = false;
                                    });
                                  }
                                  if (newValue == 'cattle') {
                                    setState(() {
                                      isCattle = true;
                                      isPet = false;
                                      isbirds = false;
                                      isfishAndAquatics = false;
                                      ispoultry = false;
                                      isaccessories = false;
                                      ismedicine = false;
                                      istoy = false;
                                      ismeat = false;
                                      isfeed = false;
                                    });
                                  }
                                  if (newValue == 'birds') {
                                    setState(() {
                                      isbirds = true;
                                      isPet = false;
                                      isCattle = false;
                                      isbirds = false;
                                      isfishAndAquatics = false;
                                      ispoultry = false;
                                      isaccessories = false;
                                      ismedicine = false;
                                      istoy = false;
                                      ismeat = false;
                                      isfeed = false;
                                    });
                                  }
                                  if (newValue == 'fishAndAquatics') {
                                    setState(() {
                                      isfishAndAquatics = true;
                                      isPet = false;
                                      isCattle = false;
                                      isbirds = false;
                                      ispoultry = false;
                                      isaccessories = false;
                                      ismedicine = false;
                                      istoy = false;
                                      ismeat = false;
                                      isfeed = false;
                                    });
                                  }
                                  if (newValue == 'poultry') {
                                    setState(() {
                                      ispoultry = true;
                                      isCattle = false;
                                      isbirds = false;
                                      isfishAndAquatics = false;
                                      isaccessories = false;
                                      ismedicine = false;
                                      istoy = false;
                                      ismeat = false;
                                      isfeed = false;
                                    });
                                  }
                                  if (newValue == 'accessories') {
                                    setState(() {
                                      isaccessories = true;
                                      isPet = false;
                                      isCattle = false;
                                      isbirds = false;
                                      isfishAndAquatics = false;
                                      ispoultry = false;

                                      ismedicine = false;
                                      istoy = false;
                                      ismeat = false;
                                      isfeed = false;
                                    });
                                  }
                                  if (newValue == 'medicine') {
                                    setState(() {
                                      ismedicine = true;
                                      isPet = false;
                                      isCattle = false;
                                      isbirds = false;
                                      isfishAndAquatics = false;
                                      ispoultry = false;
                                      isaccessories = false;
                                      istoy = false;
                                      ismeat = false;
                                      isfeed = false;
                                    });
                                  }
                                  if (newValue == 'toy') {
                                    setState(() {
                                      istoy = true;
                                      isPet = false;
                                      isCattle = false;
                                      isbirds = false;
                                      isfishAndAquatics = false;
                                      ispoultry = false;
                                      isaccessories = false;
                                      ismedicine = false;
                                      ismeat = false;
                                      isfeed = false;
                                    });
                                  }
                                  if (newValue == 'meat') {
                                    setState(() {
                                      ismeat = true;
                                      isPet = false;
                                      isCattle = false;
                                      isbirds = false;
                                      isfishAndAquatics = false;
                                      ispoultry = false;
                                      isaccessories = false;
                                      ismedicine = false;
                                      istoy = false;
                                      isfeed = false;
                                    });
                                  }
                                  if (newValue == 'feed') {
                                    setState(() {
                                      isfeed = true;
                                      isPet = false;
                                      isCattle = false;
                                      isbirds = false;
                                      isfishAndAquatics = false;
                                      ispoultry = false;
                                      isaccessories = false;
                                      ismedicine = false;
                                      istoy = false;
                                      ismeat = false;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    isPet || isCattle
                        ? ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0, top: 15.0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: TextFormField(
                                    cursorColor:
                                        const Color.fromARGB(255, 29, 201, 192),
                                    decoration: InputDecoration(
                                        labelStyle: const TextStyle(
                                            color: const Color.fromARGB(
                                                255, 29, 201, 192)),
                                        hintText: 'i.e Cow,horse',
                                        labelText: 'Animal Name',
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Colors.red,
                                              style: BorderStyle.solid,
                                              width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          gapPadding: 10,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 29, 201, 192),
                                              style: BorderStyle.solid,
                                              width: 1),
                                        ),
                                        focusColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              style: BorderStyle.solid,
                                              width: 5),
                                        ),
                                        prefixIcon: IconButton(
                                          icon: const Icon(
                                            Icons.person,
                                            color: Color.fromARGB(
                                                255, 29, 201, 192),
                                          ),
                                          onPressed: () {},
                                        ),
                                        fillColor: Colors.white,
                                        filled: true),
                                    controller: subCategoryTypeController,
                                    validator: (name) {
                                      if (name!.isEmpty || name == null)
                                        return "The Animal Name is Missing ";
                                      else if (name.length >= 5) {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0, top: 15.0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: TextFormField(
                                    cursorColor:
                                        const Color.fromARGB(255, 29, 201, 192),
                                    decoration: InputDecoration(
                                        labelStyle: const TextStyle(
                                            color: const Color.fromARGB(
                                                255, 29, 201, 192)),
                                        hintText: 'i.e Gir,Kangayam,Kangrej..',
                                        labelText: 'Breed Type',
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Colors.red,
                                              style: BorderStyle.solid,
                                              width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          gapPadding: 10,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 29, 201, 192),
                                              style: BorderStyle.solid,
                                              width: 1),
                                        ),
                                        focusColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              style: BorderStyle.solid,
                                              width: 5),
                                        ),
                                        prefixIcon: IconButton(
                                          icon: const Icon(
                                            Icons.person,
                                            color: Color.fromARGB(
                                                255, 29, 201, 192),
                                          ),
                                          onPressed: () {},
                                        ),
                                        fillColor: Colors.white,
                                        filled: true),
                                    controller: breedTypeController,
                                    validator: (name) {
                                      if (name!.isEmpty || name == null)
                                        return "The Breed Type is Missing ";
                                      else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0, top: 15.0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: TextFormField(
                                    cursorColor:
                                        const Color.fromARGB(255, 29, 201, 192),
                                    decoration: InputDecoration(
                                        labelStyle: const TextStyle(
                                            color: const Color.fromARGB(
                                                255, 29, 201, 192)),
                                        hintText: 'black,white,brown..',
                                        labelText: 'Colors',
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Colors.red,
                                              style: BorderStyle.solid,
                                              width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          gapPadding: 10,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 29, 201, 192),
                                              style: BorderStyle.solid,
                                              width: 1),
                                        ),
                                        focusColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              style: BorderStyle.solid,
                                              width: 5),
                                        ),
                                        prefixIcon: IconButton(
                                          icon: const Icon(
                                            Icons.person,
                                            color: Color.fromARGB(
                                                255, 29, 201, 192),
                                          ),
                                          onPressed: () {},
                                        ),
                                        fillColor: Colors.white,
                                        filled: true),
                                    controller: colorController,
                                    validator: (name) {
                                      if (name!.isEmpty || name == null)
                                        return "The Color Feild is Missing ";
                                      else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0, top: 15.0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: TextFormField(
                                    cursorColor:
                                        const Color.fromARGB(255, 29, 201, 192),
                                    decoration: InputDecoration(
                                        labelStyle: const TextStyle(
                                            color: const Color.fromARGB(
                                                255, 29, 201, 192)),
                                        hintText: isCattle
                                            ? 'Bull,Cow'
                                            : isPet
                                                ? 'Male,Female'
                                                : '',
                                        labelText: 'Gender',
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Colors.red,
                                              style: BorderStyle.solid,
                                              width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          gapPadding: 10,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 29, 201, 192),
                                              style: BorderStyle.solid,
                                              width: 1),
                                        ),
                                        focusColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              style: BorderStyle.solid,
                                              width: 5),
                                        ),
                                        prefixIcon: IconButton(
                                          icon: const Icon(
                                            Icons.person,
                                            color: Color.fromARGB(
                                                255, 29, 201, 192),
                                          ),
                                          onPressed: () {},
                                        ),
                                        fillColor: Colors.white,
                                        filled: true),
                                    controller: genderController,
                                    validator: (name) {
                                      if (name!.isEmpty || name == null)
                                        return "The Gender Feild is Missing";
                                      else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ),
                              isCattle
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15.0, top: 15.0),
                                      child: Container(
                                        decoration: const BoxDecoration(),
                                        child: TextFormField(
                                          cursorColor: const Color.fromARGB(
                                              255, 29, 201, 192),
                                          decoration: InputDecoration(
                                              labelStyle: const TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 29, 201, 192)),
                                              hintText: '6 liters/day..',
                                              labelText:
                                                  'MilkCapacity(per day)',
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  borderSide: BorderSide.none),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    color: Colors.red,
                                                    style: BorderStyle.solid,
                                                    width: 2),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                gapPadding: 10,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 29, 201, 192),
                                                    style: BorderStyle.solid,
                                                    width: 1),
                                              ),
                                              focusColor: Colors.white,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    style: BorderStyle.solid,
                                                    width: 5),
                                              ),
                                              prefixIcon: IconButton(
                                                icon: const Icon(
                                                  Icons.person,
                                                  color: Color.fromARGB(
                                                      255, 29, 201, 192),
                                                ),
                                                onPressed: () {},
                                              ),
                                              fillColor: Colors.white,
                                              filled: true),
                                          controller:
                                              milkCapacityPerdayController,
                                          validator: (name) {
                                            if (name!.isEmpty || name == null)
                                              return "This Feild is Missing";
                                            else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    )
                                  : Container(),
                              isCattle
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15.0, top: 15.0),
                                      child: Container(
                                        decoration: const BoxDecoration(),
                                        child: TextFormField(
                                          cursorColor: const Color.fromARGB(
                                              255, 29, 201, 192),
                                          decoration: InputDecoration(
                                              labelStyle: const TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 29, 201, 192)),
                                              hintText: '3liters',
                                              labelText:
                                                  'MilkCapacityPerMilking',
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  borderSide: BorderSide.none),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    color: Colors.red,
                                                    style: BorderStyle.solid,
                                                    width: 2),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                gapPadding: 10,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 29, 201, 192),
                                                    style: BorderStyle.solid,
                                                    width: 1),
                                              ),
                                              focusColor: Colors.white,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    style: BorderStyle.solid,
                                                    width: 5),
                                              ),
                                              prefixIcon: IconButton(
                                                icon: const Icon(
                                                  Icons.person,
                                                  color: Color.fromARGB(
                                                      255, 29, 201, 192),
                                                ),
                                                onPressed: () {},
                                              ),
                                              fillColor: Colors.white,
                                              filled: true),
                                          controller: genderController,
                                          validator: (name) {
                                            if (name!.isEmpty || name == null)
                                              return "This Feild is Missing";
                                            else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    )
                                  : Container(),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0, top: 15.0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: TextFormField(
                                    cursorColor:
                                        const Color.fromARGB(255, 29, 201, 192),
                                    decoration: InputDecoration(
                                        labelStyle: const TextStyle(
                                            color: const Color.fromARGB(
                                                255, 29, 201, 192)),
                                        hintText: '2,4..',
                                        labelText: 'No.of.Teeth',
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Colors.red,
                                              style: BorderStyle.solid,
                                              width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          gapPadding: 10,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 29, 201, 192),
                                              style: BorderStyle.solid,
                                              width: 1),
                                        ),
                                        focusColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              style: BorderStyle.solid,
                                              width: 5),
                                        ),
                                        prefixIcon: IconButton(
                                          icon: const Icon(
                                            Icons.person,
                                            color: Color.fromARGB(
                                                255, 29, 201, 192),
                                          ),
                                          onPressed: () {},
                                        ),
                                        fillColor: Colors.white,
                                        filled: true),
                                    controller: teethController,
                                    validator: (name) {
                                      if (name!.isEmpty || name == null)
                                        return "The Teeth Feild is Missing";
                                      else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0, top: 15.0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: TextFormField(
                                    cursorColor:
                                        const Color.fromARGB(255, 29, 201, 192),
                                    decoration: InputDecoration(
                                        labelStyle: const TextStyle(
                                            color: const Color.fromARGB(
                                                255, 29, 201, 192)),
                                        hintText: '1 year, 7 months..',
                                        labelText: 'Age',
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Colors.red,
                                              style: BorderStyle.solid,
                                              width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          gapPadding: 10,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 29, 201, 192),
                                              style: BorderStyle.solid,
                                              width: 1),
                                        ),
                                        focusColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              style: BorderStyle.solid,
                                              width: 5),
                                        ),
                                        prefixIcon: IconButton(
                                          icon: const Icon(
                                            Icons.person,
                                            color: Color.fromARGB(
                                                255, 29, 201, 192),
                                          ),
                                          onPressed: () {},
                                        ),
                                        fillColor: Colors.white,
                                        filled: true),
                                    controller: ageController,
                                    validator: (name) {
                                      if (name!.isEmpty || name == null)
                                        return "The Gender Feild is Missing";
                                      else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0, top: 15.0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: TextFormField(
                                    cursorColor:
                                        const Color.fromARGB(255, 29, 201, 192),
                                    decoration: InputDecoration(
                                        labelStyle: const TextStyle(
                                            color: const Color.fromARGB(
                                                255, 29, 201, 192)),
                                        hintText: '1,2,4..',
                                        labelText: 'Total No.of.OffSpring',
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Colors.red,
                                              style: BorderStyle.solid,
                                              width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          gapPadding: 10,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 29, 201, 192),
                                              style: BorderStyle.solid,
                                              width: 1),
                                        ),
                                        focusColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              style: BorderStyle.solid,
                                              width: 5),
                                        ),
                                        prefixIcon: IconButton(
                                          icon: const Icon(
                                            Icons.person,
                                            color: Color.fromARGB(
                                                255, 29, 201, 192),
                                          ),
                                          onPressed: () {},
                                        ),
                                        fillColor: Colors.white,
                                        filled: true),
                                    controller: numberOfOffSpringController,
                                    validator: (name) {
                                      if (name!.isEmpty || name == null)
                                        return "The Gender Feild is Missing";
                                      else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0, top: 15.0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: TextFormField(
                                    cursorColor:
                                        const Color.fromARGB(255, 29, 201, 192),
                                    decoration: InputDecoration(
                                        labelStyle: const TextStyle(
                                            color: const Color.fromARGB(
                                                255, 29, 201, 192)),
                                        hintText: '100Kg,50Kg,200Kg',
                                        labelText: 'ApproximateWeight',
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Colors.red,
                                              style: BorderStyle.solid,
                                              width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          gapPadding: 10,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 29, 201, 192),
                                              style: BorderStyle.solid,
                                              width: 1),
                                        ),
                                        focusColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              style: BorderStyle.solid,
                                              width: 5),
                                        ),
                                        prefixIcon: IconButton(
                                          icon: const Icon(
                                            Icons.person,
                                            color: Color.fromARGB(
                                                255, 29, 201, 192),
                                          ),
                                          onPressed: () {},
                                        ),
                                        fillColor: Colors.white,
                                        filled: true),
                                    controller: approximateWeightController,
                                    validator: (name) {
                                      if (name!.isEmpty || name == null)
                                        return "The Gender Feild is Missing";
                                      else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ),
                              MySwitch(
                                  onChanged: (value) {
                                    setState(() {
                                      isPregnant = value;
                                    });
                                  },
                                  switchValue: isPregnant,
                                  title: 'Is now Pregnant ?'),
                              isPregnant
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 15.0, top: 15.0),
                                      child: Container(
                                        decoration: const BoxDecoration(),
                                        child: TextFormField(
                                          cursorColor: const Color.fromARGB(
                                              255, 29, 201, 192),
                                          decoration: InputDecoration(
                                              labelStyle: const TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 29, 201, 192)),
                                              hintText: '2nd month, 5th month',
                                              labelText: 'PregnancyMonth',
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  borderSide: BorderSide.none),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    color: Colors.red,
                                                    style: BorderStyle.solid,
                                                    width: 2),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                gapPadding: 10,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 29, 201, 192),
                                                    style: BorderStyle.solid,
                                                    width: 1),
                                              ),
                                              focusColor: Colors.white,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    style: BorderStyle.solid,
                                                    width: 5),
                                              ),
                                              prefixIcon: IconButton(
                                                icon: const Icon(
                                                  Icons.person,
                                                  color: Color.fromARGB(
                                                      255, 29, 201, 192),
                                                ),
                                                onPressed: () {},
                                              ),
                                              fillColor: Colors.white,
                                              filled: true),
                                          controller: pregnancyMonthController,
                                          validator: (name) {
                                            if (name!.isEmpty || name == null)
                                              return "The PregnancyMonth Feild is Missing";
                                            else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    )
                                  : Container(),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0, top: 15.0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: TextFormField(
                                    cursorColor:
                                        const Color.fromARGB(255, 29, 201, 192),
                                    decoration: InputDecoration(
                                        labelStyle: const TextStyle(
                                            color: const Color.fromARGB(
                                                255, 29, 201, 192)),
                                        hintText: '2,3..',
                                        labelText: 'No.Of.BirthGiven',
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Colors.red,
                                              style: BorderStyle.solid,
                                              width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          gapPadding: 10,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 29, 201, 192),
                                              style: BorderStyle.solid,
                                              width: 1),
                                        ),
                                        focusColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              style: BorderStyle.solid,
                                              width: 5),
                                        ),
                                        prefixIcon: IconButton(
                                          icon: const Icon(
                                            Icons.person,
                                            color: Color.fromARGB(
                                                255, 29, 201, 192),
                                          ),
                                          onPressed: () {},
                                        ),
                                        fillColor: Colors.white,
                                        filled: true),
                                    controller: numberOfBirthGivenController,
                                    validator: (name) {
                                      if (name!.isEmpty || name == null)
                                        return "This Feild is Missing";
                                      else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0, top: 15.0),
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: TextFormField(
                                    cursorColor:
                                        const Color.fromARGB(255, 29, 201, 192),
                                    decoration: InputDecoration(
                                        labelStyle: const TextStyle(
                                            color: const Color.fromARGB(
                                                255, 29, 201, 192)),
                                        hintText: '5ft,2ft..',
                                        labelText: 'ApproximateHeight',
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Colors.red,
                                              style: BorderStyle.solid,
                                              width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          gapPadding: 10,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 29, 201, 192),
                                              style: BorderStyle.solid,
                                              width: 1),
                                        ),
                                        focusColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              style: BorderStyle.solid,
                                              width: 5),
                                        ),
                                        prefixIcon: IconButton(
                                          icon: const Icon(
                                            Icons.person,
                                            color: Color.fromARGB(
                                                255, 29, 201, 192),
                                          ),
                                          onPressed: () {},
                                        ),
                                        fillColor: Colors.white,
                                        filled: true),
                                    controller: approximateHeightController,
                                    validator: (name) {
                                      if (name!.isEmpty || name == null)
                                        return "This Feild is Missing";
                                      else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ),
                              MyTextFeild(
                                  icon: FontAwesomeIcons.ruler,
                                  hint: '2ft, 5ft',
                                  label: 'ApproximateLength',
                                  controller: approximateLengthController),
                              MySwitch(
                                  onChanged: (value) {
                                    setState(() {
                                      isSellingWithOffSpring = value;
                                    });
                                  },
                                  switchValue: isSellingWithOffSpring,
                                  title: 'Is Selling With OffSpring'),
                            ],
                          )
                        : Container(),
                    isaccessories
                        ? ListView(
                            shrinkWrap: true,
                            children: [
                              MyTextFeild(
                                  icon: FontAwesomeIcons.brandsFontAwesome,
                                  hint: 'Pedigree,..',
                                  label: 'BrandName',
                                  controller: brandNameController),
                              MyTextFeild(
                                  icon: Icons.category,
                                  hint: 'Wearables,playable..',
                                  label: 'Category',
                                  controller: categoryController),
                              MyTextFeild(
                                  icon: Icons.group_work,
                                  hint: 'Belt,Chain,Cover..',
                                  label: 'Type',
                                  controller: typeController),
                              MyTextFeild(
                                  icon: Icons.hotel_class_outlined,
                                  hint: 'Used as a collar belt..',
                                  label: 'Usage',
                                  controller: usageController),
                              MyTextFeild(
                                  icon: Icons.colorize,
                                  hint: 'red,blue,green',
                                  label: 'Colors',
                                  controller: colorsController),
                              MyTextFeild(
                                  icon: Icons.linear_scale,
                                  type: TextInputType.number,
                                  hint: ' 20, 12, 18',
                                  label: 'Sizes',
                                  controller: sizesController),
                              MyTextFeild(
                                  icon: Icons.scale,
                                  type: TextInputType.number,
                                  hint: '1, 2, 3',
                                  label: 'Weight',
                                  controller: weightController),
                              MyTextFeild(
                                  icon: FontAwesomeIcons.ruler,
                                  hint: " 13'2'6, 14'3'7, 9'6'4",
                                  label: 'Dimensions',
                                  controller: dimensionsController),
                              MyTextFeild(
                                  icon: FontAwesomeIcons.box,
                                  hint: 'leather,plastic..',
                                  label: 'Material',
                                  controller: materialController),
                              MyTextFeild(
                                  icon: FontAwesomeIcons.solidMap,
                                  hint: 'India,Japan,..',
                                  label: 'CountryOfOrigin',
                                  controller: countryOfOriginController)
                            ],
                          )
                        : Container(),
                    isfishAndAquatics
                        ? ListView(
                            shrinkWrap: true,
                            children: [
                              MyTextFeild(
                                  icon: FontAwesomeIcons.fish,
                                  hint: 'salmon,Tilapia..',
                                  label: 'Name',
                                  controller: nameController),
                              MyTextFeild(
                                  icon: Icons.category,
                                  hint:
                                      'eatable,decoration/aesthetic,astrology..',
                                  label: 'Category',
                                  controller: fishCategoryController),
                              MyTextFeild(
                                  icon: Icons.new_label,
                                  hint: 'salmon x tilapia..',
                                  label: 'Breed',
                                  controller: breedController),
                              MyTextFeild(
                                  icon: Icons.linear_scale,
                                  hint: '10cm , 5cm..',
                                  label: 'Size',
                                  controller: sizeController),
                              MyTextFeild(
                                  icon: Icons.calendar_view_day_outlined,
                                  hint: '3 months,8 months 2 years..',
                                  label: 'Age',
                                  controller: fishAgeController),
                              MyTextFeild(
                                  icon: Icons.colorize,
                                  hint: 'Gold, black..',
                                  label: 'Colors',
                                  controller: fishColorsController),
                              MyTextFeild(
                                  icon: FontAwesomeIcons.weightScale,
                                  hint: ' 10gm, 1kg ',
                                  label: 'Weight',
                                  controller: fishWeightController),
                              MyTextFeild(
                                  icon: FontAwesomeIcons.box,
                                  hint: 'Box, Pot,Plastic Cover',
                                  label: 'PackageType',
                                  controller: packageTypeController)
                            ],
                          )
                        : Container(),
                    istoy
                        ? ListView(
                            shrinkWrap: true,
                            children: [
                              MyTextFeild(
                                  hint: ' Lego, Hot wheels..',
                                  label: 'BrandName',
                                  controller: toybrandNameController),
                              MyTextFeild(
                                  hint: 'Activity, Wearable',
                                  label: 'Category',
                                  controller: toycategoryController),
                              MyTextFeild(
                                  hint: ' Chewable,..',
                                  label: 'Type',
                                  controller: toytypeController),
                              MyTextFeild(
                                  hint: 'Increase Jaw Power..',
                                  label: 'Usage',
                                  controller: toyusageController),
                              MyTextFeild(
                                  hint: ' Green, Blue, Yellow',
                                  label: 'Colors',
                                  controller: toycolorsController),
                              MyTextFeild(
                                  hint: ' 10,11,12',
                                  label: 'Sizes',
                                  controller: toysizesController),
                              MyTextFeild(
                                  hint: ' 100gm, 1Kg',
                                  label: 'Weight',
                                  controller: toyweightController),
                              MyTextFeild(
                                  hint: " 13'2'6, 14'3'7, 9'6'4 ",
                                  label: 'Dimensions',
                                  controller: toydimensionsController),
                              MyTextFeild(
                                  hint: ' leather, plastic',
                                  label: 'Material',
                                  controller: toymaterialController),
                              MyTextFeild(
                                  hint: 'India,Japan..',
                                  label: 'CountryOfOrigin',
                                  controller: toycountryOfOriginController),
                            ],
                          )
                        : Container(),
                    isfeed
                        ? ListView(
                            shrinkWrap: true,
                            children: [
                              MyTextFeild(
                                  hint: 'Pedigree,...',
                                  label: 'BrandName',
                                  controller: feedbrandNameController),
                              MyTextFeild(
                                  hint: 'Barley,Rice..',
                                  label: 'IncludedIngredients',
                                  controller:
                                      feedincludedIngredientsController),
                              MyTextFeild(
                                  hint: 'Cow,Dog',
                                  label: 'TargetSpecies',
                                  controller: feedtargetSpeciesController),
                              MyTextFeild(
                                  hint: " 1'2'3, 1'3'3, 1'4'5",
                                  label: 'Package Sizes',
                                  controller: feedsizesController),
                              MyTextFeild(
                                  hint: 'Sweet, Sour',
                                  label: 'Flavour',
                                  controller: feedflavourController),
                              MyTextFeild(
                                  hint: 'Dry,wet,liquid..',
                                  label: 'ItemForm',
                                  controller: feeditemFormController),
                              MyTextFeild(
                                  hint: 'D/m/y',
                                  label: 'ExpiryDate',
                                  controller: feedageRangeController),
                              MyTextFeild(
                                  hint: 'Box,Bag..',
                                  label: 'PackageType',
                                  controller: feedpackageTypeController)
                            ],
                          )
                        : Container(),
                    ismeat
                        ? ListView(
                            shrinkWrap: true,
                            children: [
                              MyTextFeild(
                                  hint: 'i.e. Suguna chicken..',
                                  label: 'BrandName',
                                  controller: meatbrandNameController),
                              MyTextFeild(
                                  hint: 'i.e chicken,mutton..',
                                  label: 'MeatName',
                                  controller: meatmeatNameController),
                              MyTextFeild(
                                  hint: 'i.e Breast,leg,wings',
                                  label: 'Parts',
                                  controller: meatpartsController),
                              MyTextFeild(
                                  hint: 'i.e 1Kg, 500gm,2Kg',
                                  label: 'Weight',
                                  controller: meatweightController),
                              MyTextFeild(
                                  hint: 'i.e Box,Cover',
                                  label: 'PackageType',
                                  controller: meatpackageTypeController),
                              MyTextFeild(
                                  hint: 'i.e ₹10, ₹20',
                                  label: 'DeliveryCharge',
                                  controller: meatdeliveryChargeController),
                              // ..._getFriends(
                              //     hint: ' 1,2,3 ',
                              //     label: 'Size',
                              //     listVal:
                              //         _ProductSellingScreenState.friendsList,
                              //     widList: list1),
                              form1,
                              MyTextFeild(
                                  hint: 'i.e ₹10, ₹20',
                                  label: 'DeliveryCharge',
                                  controller: meatdeliveryChargeController),
                              // ..._getFriends(
                              //     hint: ' bla,bla,bla ',
                              //     label: 'Random',
                              //     listVal:
                              //         _ProductSellingScreenState.randomList,
                              //     widList: list2)
                              form2,
                            ],
                          )
                        : Container(),
                    const SizedBox(
                      height: 20,
                    ),
                    Builder(builder: (context) {
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: GlobalVariables.selectedNavBarColor),
                          onPressed: () {
                            sellerService.sellAnimal(
                                context: context,
                                productName: productNameController.text,
                                description: descriptionController.text,
                                highlightDescription: 'highlightDescription',
                                elaborateDescription: 'elaborateDescription',
                                images: ['image1,image2'],
                                quantity: 1,
                                price: 8000,
                                categoryName: 'pet',
                                deliverablespan: ['TN', 'kerala'],
                                isHavingStock: true,
                                stockQuantity: 22,
                                isDiscountable: true,
                                discount: 2,
                                subCategoryType: 'dogy1',
                                breedType: 'golden retreiver',
                                color: 'Gold',
                                gender: 'male',
                                teeth: 2,
                                age: 3,
                                approximateHeight: 3,
                                approximateLength: 3,
                                approximateWeight: 20,
                                numberOfOffSpring: 10,
                                isPregnant: true,
                                pregnancyMonth: 3,
                                isSellingWithOffspring: false,
                                numberOfBirthGiven: 3);

                            // print('the friends list are ${friendsList}');
                            if (formGlobalKey.currentState!.validate()) {
                              formGlobalKey.currentState!.save();

                              if (isPet) {
                                // sellerService.sellAnimal(
                                //     context: context,
                                //     productName: productNameController.text,
                                //     description: descriptionController.text,
                                //     highlightDescription:
                                //         highlightDescriptionController.text,
                                //     elaborateDescription:
                                //         elaborateDescriptionController.text,
                                //     images: ['image1,image2'],
                                //     quantity: int.parse(
                                //         quantityController.text.toString()),
                                //     price: int.parse(
                                //         priceController.text.toString()),
                                //     categoryName: 'pets',
                                //     deliverablespan:
                                //         deliverableSpanController.text.split(","),
                                //     isHavingStock: isHavingStock,
                                //     stockQuantity: stockController as int,
                                //     isDiscountable: isDiscountable,
                                //     discount: int.parse(
                                //         discountController.text.toString()),
                                //     subCategoryType:
                                //         subCategoryTypeController.text,
                                //     breedType: breedTypeController.text,
                                //     color: colorController.text,
                                //     gender: genderController.text,
                                //     teeth: int.parse(
                                //         teethController.text.toString()),
                                //     age: int.parse(ageController.text),
                                //     approximateHeight: int.parse(
                                //         approximateHeightController.text
                                //             .toString()),
                                //     approximateLength:
                                //         int.parse(approximateLengthController.text.toString()),
                                //     approximateWeight: int.parse(approximateWeightController.text.toString()),
                                //     numberOfOffSpring: int.parse(numberOfOffSpringController.text.toString()),
                                //     isPregnant: isPregnant,
                                //     pregnancyMonth: int.parse(pregnancyMonthController.text.toString()),
                                //     isSellingWithOffspring: isSellingWithOffSpring,
                                //     numberOfBirthGiven: int.parse(numberOfBirthGivenController.text.toString()));
                              }
                            }
                          },
                          child: const Text("Submit"));
                    }),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
              color: GlobalVariables.selectedNavBarColor,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ));
  }

  /// get firends text-fields
  List<Widget> _getFriends(
      {required String hint,
      required String label,
      required List<String?> listVal,
      required List<Widget> widList}) {
    // List<Widget> friendsTextFields = [];
    for (int i = 0; i < listVal.length; i++) {
      widList.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Expanded(
                child: FriendTextFields(
              i,
              hint: hint,
              label: label,
              nameControllerText: listVal[i] ?? '',
              onChange: (v) {
                listVal[i] = v;
              },
            )),
            SizedBox(
              width: 16,
            ),
            // we need add button at last friends row
            _addRemoveButton(i == listVal.length - 1, i, listVal),
          ],
        ),
      ));
    }
    return widList;
  }

  /// add / remove button
  Widget _addRemoveButton(
    bool add,
    int index,
    List<String?> listVal,
  ) {
    return InkWell(
      onTap: () {
        if (add) {
          // add new text-fields at the top of all friends textfields
          listVal.insert(index + 1, null);
        } else
          listVal.removeAt(index);
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}

class FriendTextFields extends StatefulWidget {
  final int index;
  String hint;
  String label;
  String nameControllerText;
  Function(String) onChange;
  FriendTextFields(this.index,
      {Key? key,
      required this.hint,
      required this.label,
      required this.nameControllerText,
      required this.onChange})
      : super(key: key);
  @override
  _FriendTextFieldsState createState() => _FriendTextFieldsState();
}

class _FriendTextFieldsState extends State<FriendTextFields> {
  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameController.text = widget.nameControllerText;
    });

    return TextFormField(
      cursorColor: const Color.fromARGB(255, 29, 201, 192),
      decoration: InputDecoration(
          labelStyle:
              const TextStyle(color: const Color.fromARGB(255, 29, 201, 192)),
          hintText: widget.hint,
          labelText: widget.label,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
                color: Colors.red, style: BorderStyle.solid, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 10,
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 29, 201, 192),
                style: BorderStyle.solid,
                width: 1),
          ),
          focusColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
                color: Colors.transparent, style: BorderStyle.solid, width: 5),
          ),
          prefixIcon: IconButton(
            icon: const Icon(
              Icons.expand_circle_down,
              color: Color.fromARGB(255, 29, 201, 192),
            ),
            onPressed: () {},
          ),
          fillColor: Colors.white,
          filled: true),
      controller: _nameController,
      onChanged: widget.onChange,
      validator: (v) {
        if (v!.trim().isEmpty) return 'Please enter something';
        return null;
      },
    );
  }
}
