import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mq/constants/Global_Variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/snackbar.dart';
import '../constants/errror_handling.dart';

class SellerService {
  void sellAnimal({
    required BuildContext context,
    required String productName,
    required String description,
    required String highlightDescription,
    required String elaborateDescription,
    required List<String> images,
    required int quantity,
    required int price,
    required String categoryName,
    required List<String> deliverablespan,
    required bool isHavingStock,
    required int stockQuantity,
    required bool isDiscountable,
    required int discount,
    required String subCategoryType,
    required String breedType,
    required String color,
    required String gender,
    int? milkCapacityPerMilking,
    int? milkCapacityPerday,
    required int teeth,
    required int age,
    required int approximateHeight,
    required int approximateLength,
    required int approximateWeight,
    required int numberOfOffSpring,
    required bool isPregnant,
    required int pregnancyMonth,
    required bool isSellingWithOffspring,
    required int numberOfBirthGiven,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      String? sellerToken = prefs.getString('x-sellerAuth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      if (sellerToken == null) {
        prefs.setString('x-sellerAuth-token', '');
      }

      http.Response res = await http.post(
        Uri.parse(('$uri/api/postProduct')),
        body: json.encode({
          'product': {
            'productName': productName,
            'description': description,
            'highlightDescription': highlightDescription,
            'elaborateDescription': elaborateDescription,
            'images': images,
            'quantity': quantity,
            'price': price,
            'categoryName': categoryName,
            'deliverablespan': deliverablespan,
            'isHavingStock': isHavingStock,
            'stockQuantity': stockQuantity,
            'isDiscountable': isDiscountable,
            'discount': discount
          },
          'animal': {
            'subCategoryType': subCategoryType,
            'breedType': breedType,
            'color': color,
            'gender': gender,
            'milkCapacityPerMilking': milkCapacityPerMilking,
            'milkCapacityPerday': milkCapacityPerday,
            'teeth': teeth,
            'age': age,
            'approximateHeight': approximateHeight,
            'approximateLength': approximateLength,
            'approximateWeight': approximateWeight,
            'numberOfOffSpring': numberOfOffSpring,
            'isPregnant': isPregnant,
            'pregnancyMonth': pregnancyMonth,
            'isSellingWithOffspring': isSellingWithOffspring,
            'numberOfBirthGiven': numberOfBirthGiven
          },
          'feed': '',
          "toy": "",
          "accessory": "",
          "fishAndAquatics": "",
          "meat": ""
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
          'x-sellerAuth-token': sellerToken!
        },
      );

      final productRes = jsonDecode(res.body);
      print('the productRes is ${productRes}');

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            showSnackBar(context, productRes['msg']);
          });
    } catch (e) {
      print('the err is ${e.toString()}');
      showSnackBar(context, e.toString());
    }
  }

  void sellFeed({
    required BuildContext context,
    required String productName,
    required String description,
    required String highlightDescription,
    required String elaborateDescription,
    required List<String> images,
    required int quantity,
    required int price,
    required String categoryName,
    required List<String> deliverablespan,
    required bool isHavingStock,
    required int stockQuantity,
    required bool isDiscountable,
    required int discount,
    required String feedBrandName,
    required List<String> includedIngredients,
    required List<int> feedWeight,
    required List<String> targetSpecies,
    required List<String> feedSizes,
    required String flavour,
    required String itemForm,
    required String ageRange,
    required String packageType,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      String? sellerToken = prefs.getString('x-sellerAuth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      if (sellerToken == null) {
        prefs.setString('x-sellerAuth-token', '');
      }
      http.Response res = await http.post(
        Uri.parse(('$uri/api/postProduct')),
        body: json.encode({
          'product': {
            'productName': productName,
            'description': description,
            'highlightDescription': highlightDescription,
            'elaborateDescription': elaborateDescription,
            'images': images,
            'quantity': quantity,
            'price': price,
            'categoryName': categoryName,
            'deliverablespan': deliverablespan,
            'isHavingStock': isHavingStock,
            'stockQuantity': stockQuantity,
            'isDiscountable': isDiscountable,
            'discount': discount
          },
          'feed': {
            'feedBrandName': feedBrandName,
            'includedIngredients': includedIngredients,
            'feedWeight': feedWeight,
            'targetSpecies': targetSpecies,
            'feedSizes': feedSizes,
            'flavour': flavour,
            'itemForm': itemForm,
            'ageRange': ageRange,
            'packageType': packageType
          }
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
          'x-sellerAuth-token': sellerToken!
        },
      );
    } catch (e) {
      print('the err is ${e.toString()}');
      showSnackBar(context, e.toString());
    }
  }

  void sellToy({
    required BuildContext context,
    required String productName,
    required String description,
    required String highlightDescription,
    required String elaborateDescription,
    required List<String> images,
    required int quantity,
    required int price,
    required String categoryName,
    required List<String> deliverablespan,
    required bool isHavingStock,
    required int stockQuantity,
    required bool isDiscountable,
    required int discount,
    required String toyBrandName,
    required String toyCategory,
    required String toyType,
    required String toyUsage,
    required List<String> toyColors,
    required List<String> toySizes,
    required List<int> toyWeight,
    required List<String> toyDimensions,
    required String toyMaterial,
    required String toyCountryOfOrigin,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      String? sellerToken = prefs.getString('x-sellerAuth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      if (sellerToken == null) {
        prefs.setString('x-sellerAuth-token', '');
      }
      http.Response res = await http.post(
        Uri.parse(('$uri/api/postProduct')),
        body: json.encode({
          'product': {
            'productName': productName,
            'description': description,
            'highlightDescription': highlightDescription,
            'elaborateDescription': elaborateDescription,
            'images': images,
            'quantity': quantity,
            'price': price,
            'categoryName': categoryName,
            'deliverablespan': deliverablespan,
            'isHavingStock': isHavingStock,
            'stockQuantity': stockQuantity,
            'isDiscountable': isDiscountable,
            'discount': discount
          },
          'toy': {
            'toyBrandName': toyBrandName,
            'toyCategory': toyCategory,
            'toyType': toyType,
            'toyUsage': toyUsage,
            'toyColors': toyColors,
            'toySizes': toySizes,
            'toyWeight': toyWeight,
            'toyDimensions': toyDimensions,
            'toyMaterial': toyMaterial,
            'toyCountryOfOrigin': toyCountryOfOrigin
          }
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
          'x-sellerAuth-token': sellerToken!
        },
      );
    } catch (e) {
      print('the err is ${e.toString()}');
      showSnackBar(context, e.toString());
    }
  }

  void sellAccessory({
    required BuildContext context,
    required String productName,
    required String description,
    required String highlightDescription,
    required String elaborateDescription,
    required List<String> images,
    required int quantity,
    required int price,
    required String categoryName,
    required List<String> deliverablespan,
    required bool isHavingStock,
    required int stockQuantity,
    required bool isDiscountable,
    required int discount,
    required String accessoryBrandName,
    required String accessoryCategory,
    required String accessoryType,
    required String accessoryUsage,
    required List<String> accessoryColors,
    required List<int> accessorySizes,
    required List<int> accessoryWeight,
    required List<String> accessoryDimensions,
    required String accessoryMaterial,
    required String accessoryCountryOfOrigin,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      String? sellerToken = prefs.getString('x-sellerAuth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      if (sellerToken == null) {
        prefs.setString('x-sellerAuth-token', '');
      }
      http.Response res = await http.post(
        Uri.parse(('$uri/api/postProduct')),
        body: json.encode({
          'product': {
            'productName': productName,
            'description': description,
            'highlightDescription': highlightDescription,
            'elaborateDescription': elaborateDescription,
            'images': images,
            'quantity': quantity,
            'price': price,
            'categoryName': categoryName,
            'deliverablespan': deliverablespan,
            'isHavingStock': isHavingStock,
            'stockQuantity': stockQuantity,
            'isDiscountable': isDiscountable,
            'discount': discount
          },
          'accessory': {
            'accessoryBrandName': accessoryBrandName,
            'accessoryCategory': accessoryCategory,
            'accessoryType': accessoryType,
            'accessoryUsage': accessoryUsage,
            'accessoryColors': accessoryColors,
            'accessorySizes': accessorySizes,
            'accessoryWeight': accessoryWeight,
            'accessoryDimensions': accessoryDimensions,
            'accessoryMaterial': accessoryMaterial,
            'accessoryCountryOfOrigin': accessoryCountryOfOrigin,
          }
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
          'x-sellerAuth-token': sellerToken!
        },
      );
    } catch (e) {
      print('the err is ${e.toString()}');
      showSnackBar(context, e.toString());
    }
  }

  void sellFishAndAquatics({
    required BuildContext context,
    required String productName,
    required String description,
    required String highlightDescription,
    required String elaborateDescription,
    required List<String> images,
    required int quantity,
    required int price,
    required String categoryName,
    required List<String> deliverablespan,
    required bool isHavingStock,
    required int stockQuantity,
    required bool isDiscountable,
    required int discount,
    required String aquaticName,
    required String aquaticCategory,
    required String aquaticBreed,
    required List<String> aquaticSize,
    required List<String> aquaticAge,
    required List<String> aquaticColors,
    required List<String> aquaticWeight,
    required String aquaticPackageType,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      String? sellerToken = prefs.getString('x-sellerAuth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      if (sellerToken == null) {
        prefs.setString('x-sellerAuth-token', '');
      }
      http.Response res = await http.post(
        Uri.parse(('$uri/api/postProduct')),
        body: json.encode({
          'product': {
            'productName': productName,
            'description': description,
            'highlightDescription': highlightDescription,
            'elaborateDescription': elaborateDescription,
            'images': images,
            'quantity': quantity,
            'price': price,
            'categoryName': categoryName,
            'deliverablespan': deliverablespan,
            'isHavingStock': isHavingStock,
            'stockQuantity': stockQuantity,
            'isDiscountable': isDiscountable,
            'discount': discount
          },
          'fishAndAquatics': {
            'AquaticName': aquaticName,
            'AquaticCategory': aquaticCategory,
            'AquaticBreed': aquaticBreed,
            'AquaticSize': aquaticSize,
            'AquaticAge': aquaticAge,
            'AquaticColors': aquaticColors,
            'AquaticWeight': aquaticWeight,
            'AquaticPackageType': aquaticPackageType
          }
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
          'x-sellerAuth-token': sellerToken!
        },
      );
    } catch (e) {
      print('the err is ${e.toString()}');
      showSnackBar(context, e.toString());
    }
  }

  void sellMeat({
    required BuildContext context,
    required String productName,
    required String description,
    required String highlightDescription,
    required String elaborateDescription,
    required List<String> images,
    required int quantity,
    required int price,
    required String categoryName,
    required List<String> deliverablespan,
    required bool isHavingStock,
    required int stockQuantity,
    required bool isDiscountable,
    required int discount,
    required String meatBrandName,
    required String meatMeatName,
    required List<String> meatParts,
    required List<int> meatWeight,
    required List<String> meatPackageType,
    required int meatDeliveryCharge,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      String? sellerToken = prefs.getString('x-sellerAuth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      if (sellerToken == null) {
        prefs.setString('x-sellerAuth-token', '');
      }
      http.Response res = await http.post(
        Uri.parse(('$uri/api/postProduct')),
        body: json.encode({
          'product': {
            'productName': productName,
            'description': description,
            'highlightDescription': highlightDescription,
            'elaborateDescription': elaborateDescription,
            'images': images,
            'quantity': quantity,
            'price': price,
            'categoryName': categoryName,
            'deliverablespan': deliverablespan,
            'isHavingStock': isHavingStock,
            'stockQuantity': stockQuantity,
            'isDiscountable': isDiscountable,
            'discount': discount
          },
          'meat': {
            'meatBrandName': meatBrandName,
            'meatMeatName': meatMeatName,
            'meatParts': meatParts,
            'meatWeight': meatWeight,
            'meatPackageType': meatPackageType,
            'meatDeliveryCharge': meatDeliveryCharge
          }
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
          'x-sellerAuth-token': sellerToken!
        },
      );
    } catch (e) {
      print('the err is ${e.toString()}');
      showSnackBar(context, e.toString());
    }
  }

  void getProdID({required BuildContext context}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      String? sellerToken = prefs.getString('x-sellerAuth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      if (sellerToken == null) {
        prefs.setString('x-sellerAuth-token', '');
      }

      http.Response res = await http.get(
        Uri.parse(('$uri/api/seller/getProductsId')),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyYjQ1OWFiMjgzM2RmOTVmZmVkZTI4ZCIsImlhdCI6MTY1NzYxOTc3N30.sk05whEfyyltJpOLmG0uc3gpGHyBOSUAoYrb-Okh95k', //token!,
          'x-sellerAuth-token':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyYjdkODhjMTViMDRjNzY0MWNkMzU3NCIsImlhdCI6MTY1NzYxOTczMn0.vZsN9MuynytEv8kYvoWS_v4AvgezWlDDp916rbpvo80' //sellerToken!
        },
      );

      final productRes = jsonDecode(res.body);
      print('the productRes is ${productRes}');

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            int prodlen = productRes.length;
            List<dynamic> prodsID = [];
            prodsID = productRes['productsID'];
            print('the prodsId 1 is $prodsID');

            prodsID.retainWhere(
              (element) {
                print('the element is ${element}');
                return element.contains('_ProductID');
              },
            );

            print('the prodsId2 is $prodsID');

            showSnackBar(context, 'Retreived successfully');
          });
    } catch (e) {
      print('the err is ${e.toString()}');
      showSnackBar(context, e.toString());
    }
  }
}
