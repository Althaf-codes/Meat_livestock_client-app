import 'package:flutter/material.dart';
import 'package:mq/screens/Auth/phone_sigin_screen.dart';
import 'package:mq/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/Global_Variables.dart';

class TestSignUpScreen extends StatefulWidget {
  const TestSignUpScreen({Key? key}) : super(key: key);
  static String _route = '/testSignUpScreen';
  static get route => _route;
  @override
  State<TestSignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<TestSignUpScreen> {
  final AuthService authService = AuthService();

  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController phoneNumbercontroller = TextEditingController();
  bool isObscure = true;
  final formGlobalKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void dispose() {
    super.dispose();

    passwordcontroller.dispose();
    phoneNumbercontroller.dispose();
  }

  void signInUser(BuildContext context) {
    authService.signIn(
      context: context,
      phoneNumber: phoneNumbercontroller.text,
      password: passwordcontroller.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.zero,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 232, 240, 236),
        //backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formGlobalKey,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //   TextField(controller: usernamecontroller),
                  // Container(
                  //   height: MediaQuery.of(context).size.height * 0.30,
                  //   width: MediaQuery.of(context).size.width * 0.90,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(12), color: pinkcolor),
                  // ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Welcome !,",
                              style: TextStyle(
                                  shadows: [
                                    Shadow(
                                        color:
                                            Color.fromARGB(255, 29, 201, 192),
                                        offset: Offset.zero,
                                        blurRadius: 4),
                                  ],
                                  color: Color.fromARGB(255, 29, 201, 192),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                            hintText: 'Enter your phone number',
                            labelText: 'Ph No:',
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
                                Icons.email,
                                color: const Color.fromARGB(255, 29, 201, 192),
                              ),
                              onPressed: () {},
                            ),
                            fillColor: Colors.white,
                            filled: true),
                        controller: phoneNumbercontroller,
                        validator: (phoneNumber) {
                          // final re = RegExp(
                          //     r'/(\+\d{1,3}\s?)?((\(\d{3}\)\s?)|(\d{3})(\s|-?))(\d{3}(\s|-?))(\d{4})(\s?(([E|e]xt[:|.|]?)|x|X)(\s?\d+))?/g');

                          // Iterable<RegExpMatch> hasMatch =
                          //     re.allMatches(phoneNumber.toString());
                          if (phoneNumber != null && phoneNumber.length < 10) {
                            return 'Enter a valid phonenumber ';
                          } else if (phoneNumber != null &&
                              phoneNumber.length >= 10) {
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
                                color: const Color.fromARGB(255, 29, 201, 192),
                              ),
                              onPressed: () {},
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isObscure
                                    ? Icons.remove_red_eye
                                    : Icons.visibility_off_outlined,
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
                        controller: passwordcontroller,
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

                  const SizedBox(
                    height: 20,
                  ),
                  // Container(
                  //   height: 50,
                  //   width: MediaQuery.of(context).size.width * 0.70,
                  //   child: ElevatedButton(
                  //       style: ElevatedButton.styleFrom(
                  //           primary:   Color.fromARGB(255, 29, 201, 192),
                  //           shadowColor: darkbluecolor,
                  //           shape: StadiumBorder(side: BorderSide.none)),
                  //       onPressed: () {},
                  //       child: Text("Sign in with Google")),
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // Container(
                  //   height: 50,
                  //   width: MediaQuery.of(context).size.width * 0.70,
                  //   child: ElevatedButton(
                  //       style: ElevatedButton.styleFrom(
                  //           primary:   Color.fromARGB(255, 29, 201, 192),
                  //           shadowColor: darkbluecolor,
                  //           shape: StadiumBorder(side: BorderSide.none)),
                  //       onPressed: () {},
                  //       child: Text("Sign in with FaceBook")),
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // Container(
                  //   height: 50,
                  //   width: MediaQuery.of(context).size.width * 0.70,
                  //   child: ElevatedButton(
                  //       style: ElevatedButton.styleFrom(
                  //           primary:   Color.fromARGB(255, 29, 201, 192),
                  //           shadowColor: darkbluecolor,
                  //           shape: StadiumBorder(side: BorderSide.none)),
                  //       onPressed: () {},
                  //       child: Text("Sign in with Github")),
                  // ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Container(
                  //       padding: EdgeInsets.all(8),
                  //       decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           shape: BoxShape.rectangle,
                  //           borderRadius: BorderRadius.circular(12),
                  //           border: Border.all(
                  //               color: Color.fromARGB(255, 29, 201, 192))),
                  //       child: const GradientIcon(
                  //         icon: FontAwesomeIcons.google,
                  //         size: 30,
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       width: 20,
                  //     ),
                  //     Container(
                  //       padding: EdgeInsets.all(8),
                  //       decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           shape: BoxShape.rectangle,
                  //           borderRadius: BorderRadius.circular(12),
                  //           border: Border.all(
                  //               color: Color.fromARGB(255, 29, 201, 192))),
                  //       child: const GradientIcon(
                  //         icon: FontAwesomeIcons.phone,
                  //         size: 30,
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       width: 10,
                  //     ),
                  //     // Container(
                  //     //   padding: EdgeInsets.all(8),
                  //     //   decoration: BoxDecoration(
                  //     //       color: Colors.white,
                  //     //       shape: BoxShape.rectangle,
                  //     //       borderRadius: BorderRadius.circular(12),
                  //     //       border: Border.all(
                  //     //           color: Color.fromARGB(255, 29, 201, 192))),
                  //     //   child: const GradientIcon(
                  //     //     icon: FontAwesomeIcons.facebook,
                  //     //     size: 30,
                  //     //   ),
                  //     // ),
                  //     // const SizedBox(
                  //     //   width: 10,
                  //     // ),
                  //     // Container(
                  //     //   padding: EdgeInsets.all(8),
                  //     //   decoration: BoxDecoration(
                  //     //       color: Colors.white,
                  //     //       shape: BoxShape.rectangle,
                  //     //       borderRadius: BorderRadius.circular(12),
                  //     //       border: Border.all(
                  //     //           color: Color.fromARGB(255, 29, 201, 192))),
                  //     //   child: const GradientIcon(
                  //     //     icon: FontAwesomeIcons.github,
                  //     //     size: 30,
                  //     //   ),
                  //     // ),
                  //   ],
                  // ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 29, 201, 192),
                            shadowColor: GlobalVariables.selectedNavBarColor,
                            shape: const StadiumBorder(side: BorderSide.none)),
                        onPressed: () {},
                        child: const Text("Sign in with Google")),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Container(
                  //   height: 50,
                  //   width: MediaQuery.of(context).size.width * 0.70,
                  //   child: ElevatedButton(
                  //       style: ElevatedButton.styleFrom(
                  //           primary: Color.fromARGB(255, 29, 201, 192),
                  //           shadowColor: GlobalVariables.selectedNavBarColor,
                  //           shape: StadiumBorder(side: BorderSide.none)),
                  //       onPressed: () {},
                  //       child: Text("Sign in with FaceBook")),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 29, 201, 192),
                            shadowColor: GlobalVariables.selectedNavBarColor,
                            shape: const StadiumBorder(side: BorderSide.none)),
                        onPressed: () {
                          Navigator.pushNamed(context, PhoneSignInScreen.route);
                        },
                        child: const Text("Sign in with Phone Number")),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       "Already have an account?",
                  //       style: TextStyle(
                  //         color: Colors.grey[500],
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       width: 4,
                  //     ),
                  //     InkWell(
                  //       onTap: () {
                  //         widget.toggleView();
                  //         // Navigator.push(
                  //         //     context,
                  //         //     MaterialPageRoute(
                  //         //         builder: (context) => const LoginScreen()));
                  //       },
                  //       child: const Text(
                  //         "Log In",
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             color: Color.fromARGB(255, 29, 201, 192)),
                  //       ),
                  //     )
                  //   ],
                  // ),
                  Builder(builder: (context) {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: GlobalVariables.selectedNavBarColor),
                        onPressed: () async {
                          if (formGlobalKey.currentState!.validate()) {
                            formGlobalKey.currentState!.save();
                            final prefs = await SharedPreferences.getInstance();
                            // await prefs.setString("x-phnNum",
                            //     phoneNumbercontroller.text.toString());

                            // final testName =
                            //     await prefs.getString("x-userName");
                            // final testphnum = await prefs.getString("x-phnNum");
                            // print(
                            //     'testName id ${testName}, testphnum is ${testphnum}');

                            // print("The validation finished Successfully");
                            // print(
                            //     "the phnNum is ${phoneNumbercontroller.text.toString()}");

                            signInUser(context);
                          }
                        },
                        child: const Text("Submit"));
                  })
                  // TextField(
                  //   controller: passwordcontroller,
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




//*********************** round icons  ******************************


// Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                   CircleAvatar(
//                       backgroundColor: Colors.white,
//                       child: GradientIcon(
//                         icon: FontAwesomeIcons.google,
//                         size: 20,
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                    
//                     CircleAvatar(
//                       backgroundColor: Colors.white,
//                       child: GradientIcon(
//                         icon: FontAwesomeIcons.facebook,
//                         size: 20,
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     CircleAvatar(
//                       backgroundColor: Colors.white,
//                       child: GradientIcon(
//                         icon: FontAwesomeIcons.github,
//                         size: 20,
//                       ),
//                     ),
//                   ],
//                 ),