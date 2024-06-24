import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mq/constants/Global_Variables.dart';
import 'package:provider/provider.dart';

import '../../services/firebase_auth_methods.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfeild.dart';

class PhoneSignInScreen extends StatefulWidget {
  const PhoneSignInScreen({Key? key}) : super(key: key);

  static String _route = '/phone';
  static get route => _route;
  @override
  State<PhoneSignInScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneSignInScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  // void phoneSignIn() {
  //   context
  //       .read<FirebaseAuthMethods>()
  //       .phoneSignIn(context, phoneController.text);
  //   //    FirebaseAuthMethods(FirebaseAuth.instance)
  //   //     .phoneSignIn(context, phoneController.text);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.selectedNavBarColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
        title: Text('PhoneSignIn',
            style: TextStyle(
              color: Colors.white,
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            controller: phoneController,
            hintText: 'Enter phone number',
          ),
          CustomButton(
            onTap: () {
              //    phoneSignIn();

              // context.read<FirebaseAuthMethods>()
              //     .phoneSignIn(context, phoneController.text);
            },
            text: 'OK',
          ),
        ],
      ),
    );
  }
}
