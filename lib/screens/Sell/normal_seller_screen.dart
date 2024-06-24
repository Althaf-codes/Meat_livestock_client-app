import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';
import 'package:mq/constants/Global_Variables.dart';
import 'package:provider/provider.dart';

import '../../services/firebase_auth_methods.dart';

class NormalSellerScreen extends StatefulWidget {
  Function toggleView;
  NormalSellerScreen({Key? key, required this.toggleView}) : super(key: key);

  static const String _route = '/NormalSellerScreen';

  static get route => _route;

  @override
  State<NormalSellerScreen> createState() => _NormalSellerScreenState();
}

class _NormalSellerScreenState extends State<NormalSellerScreen> {
  List<dynamic> cities = [
    {"name": "Cow", "code": "Cow"},
    {"name": "Dog", "code": "Dog"},
    {"name": "All Pets", "code": "=all pets"},
    {"name": "Donkey", "code": "donkey"},
    {"name": "Monkey", "code": "Monkey"},
    {"name": "Cat", "code": "cat"},
    {"name": "Pet Toys", "code": "Pet Toys"},
    {"name": "Pet Accessories", "code": "Pet Accessories"},
    {"name": "Horse", "code": "horse"},
    {"name": "Rabbit", "code": "rabbit"},
    {"name": "Hamster", "code": "hamster"},
    {"name": "Bull", "code": "bull"},
    {"name": "Buffalo", "code": "buffalo"},
    {"name": "Birds", "code": "birds"},
  ];
  final TextEditingController sellerNameController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  List<String>? selectedValues = [];
  final formGlobalKey = GlobalKey<FormState>();
  bool isObscure = true;
  ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    super.dispose();
    sellerNameController.dispose();
    companyNameController.dispose();
    passwordController.dispose();
    locationController.dispose();
    phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: GlobalVariables.selectedNavBarColor,
          title: const Text('Normal SellerScreen'),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
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
                                color: const Color.fromARGB(255, 29, 201, 192)),
                            hintText: 'Enter your name',
                            labelText: 'SellerName',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none),
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
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 29, 201, 192),
                                  style: BorderStyle.solid,
                                  width: 1),
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
                        controller: sellerNameController,
                        validator: (name) {
                          if (name != null && name.length < 5)
                            return "The username should have atleast 5 characters ";
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
                          cursorColor: const Color.fromARGB(255, 29, 201, 192),
                          decoration: InputDecoration(
                              labelStyle: const TextStyle(
                                  color:
                                      const Color.fromARGB(255, 29, 201, 192)),
                              hintText: 'Enter your PhoneNumber',
                              labelText: 'PhoneNumber',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
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
                                borderSide: const BorderSide(
                                    color:
                                        const Color.fromARGB(255, 29, 201, 192),
                                    style: BorderStyle.solid,
                                    width: 1),
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
                                  Icons.phone,
                                  color:
                                      const Color.fromARGB(255, 29, 201, 192),
                                ),
                                onPressed: () {},
                              ),
                              fillColor: Colors.white,
                              filled: true),
                          controller: phoneNumberController,
                          validator: (phoneNumber) {
                            // final re = RegExp(
                            //     r'/(\+\d{1,3}\s?)?((\(\d{3}\)\s?)|(\d{3})(\s|-?))(\d{3}(\s|-?))(\d{4})(\s?(([E|e]xt[:|.|]?)|x|X)(\s?\d+))?/g');

                            // Iterable<RegExpMatch> hasMatch =
                            //     re.allMatches(phoneNumber.toString());
                            if (phoneNumber != null &&
                                phoneNumber.length < 10) {
                              return 'Enter a valid phonenumber ';
                            } else if (phoneNumber != null &&
                                phoneNumber.length < 10) {
                              return null;
                            }
                          }),
                    ),
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
                                color: Color.fromARGB(255, 29, 201, 192)),
                            hintText: 'Enter your password',
                            labelText: 'Password',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none),
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
                              borderSide: const BorderSide(
                                  color:
                                      const Color.fromARGB(255, 29, 201, 192),
                                  style: BorderStyle.solid,
                                  width: 1),
                            ),
                            focusColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  style: BorderStyle.solid,
                                  width: 5),
                            ),
                            prefixIconColor:
                                const Color.fromARGB(255, 29, 201, 192),
                            prefixIcon: IconButton(
                              icon: const Icon(
                                Icons.lock,
                                color: Color.fromARGB(255, 29, 201, 192),
                              ),
                              onPressed: () {},
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isObscure
                                    ? Icons.visibility_off_outlined
                                    : Icons.remove_red_eye,
                                color: const Color.fromARGB(255, 29, 201, 192),
                              ),
                              onPressed: () {
                                setState(() {
                                  isObscure = isObscure == true ? false : true;
                                });
                              },
                            ),
                            fillColor: Colors.white,
                            filled: true),
                        controller: passwordController,
                        obscureText: isObscure ? true : false,
                        validator: (password) {
                          if (password != null && password.length >= 5) {
                            return null;
                          } else {
                            return "password must atleast have 5 character";
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
                        cursorColor: const Color.fromARGB(255, 29, 201, 192),
                        decoration: InputDecoration(
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 29, 201, 192)),
                            hintText: 'Enter your CompanyName',
                            labelText: 'CompanyName',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none),
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
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 29, 201, 192),
                                  style: BorderStyle.solid,
                                  width: 1),
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
                        controller: companyNameController,
                        validator: (name) {
                          if (name != null && name.length < 5)
                            return "The CompanyName should have atleast 5 characters ";
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
                        cursorColor: const Color.fromARGB(255, 29, 201, 192),
                        decoration: InputDecoration(
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 29, 201, 192)),
                            hintText: 'Enter your address',
                            labelText: 'Address',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none),
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
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 29, 201, 192),
                                  style: BorderStyle.solid,
                                  width: 1),
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
                        controller: locationController,
                        validator: (name) {
                          if (name != null && name.length < 5)
                            return "The Address should have atleast 5 characters ";
                          else if (name!.length >= 5) {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MultiSelect(
                    enabledBorderColor: GlobalVariables.selectedNavBarColor,
                    errorBorderColor: Colors.red,
                    inputBoxFillColor: Colors.white,
                    titleTextColor: GlobalVariables.selectedNavBarColor,
                    selectIconColor: GlobalVariables.selectedNavBarColor,
                    selectedOptionsBoxColor: Colors.white,
                    searchBoxFillColor: Colors.white,

                    selectedOptionsInfoTextColor:
                        GlobalVariables.selectedNavBarColor,
                    maxLengthIndicatorColor: Colors.red,

                    buttonBarColor: Colors.white,
                    //  searchBoxFillColor: Colors.blue,
                    searchBoxIcon: Icons.person,

                    autovalidateMode: AutovalidateMode.always,
                    initialValue: ['Cow', 'Dog'],
                    titleText: 'I will sell..',
                    maxLength: 5, // optional
                    validator: (dynamic value) {
                      return value == null
                          ? 'Please select one or more option(s)'
                          : null;
                    },
                    errorText: 'Please select one or more option(s)',
                    dataSource: cities,
                    textField: 'name',
                    valueField: 'name',
                    filterable: true,
                    required: true,
                    onSaved: (value) {
                      print('The saved values are $value');
                    },
                    change: (value) {
                      print('The selected values are $value');
                      setState(() {
                        selectedValues = value;
                      });

                      print(
                          'the selected values after setState is $selectedValues');
                    },
                    selectIcon: Icons.arrow_drop_down_circle,
                    saveButtonColor: GlobalVariables.selectedNavBarColor,
                    checkBoxColor: GlobalVariables.selectedNavBarColor,
                    cancelButtonColor: Colors.red,
                    responsiveDialogSize: const Size(600, 800),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Builder(builder: (context) {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: GlobalVariables.selectedNavBarColor),
                        onPressed: () async {
                          if (formGlobalKey.currentState!.validate()) {
                            formGlobalKey.currentState!.save();
                            // final prefs = await SharedPreferences.getInstance();

                            print(
                                'the datas are ${sellerNameController.text},${phoneNumberController.text},${passwordController.text},${selectedValues},${locationController.text},${companyNameController.text}');
                            await context
                                .read<FirebaseAuthMethods>()
                                .phoneSignIn(
                                  context,
                                  userType: "seller",
                                  sellerName: sellerNameController.text,
                                  companyName: companyNameController.text,
                                  address: locationController.text,
                                  specializedCategory: selectedValues,
                                  phoneNumber: phoneNumberController.text,
                                  password: passwordController.text,
                                );
                          }
                        },
                        child: const Text("Submit"));
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      InkWell(
                        onTap: () {
                          widget.toggleView();
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const LoginScreen()));
                        },
                        child: const Text(
                          "Log In",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 29, 201, 192)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
