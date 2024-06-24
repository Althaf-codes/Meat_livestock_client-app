import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mq/Utils/showOTP_dialog.dart';
import 'package:mq/constants/Utils.dart';
import 'package:mq/screens/MainHomePage.dart';
import 'package:mq/services/auth_service.dart';
import 'package:mq/widgets/toggle.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class FirebaseAuthMethods {
  final AuthService authService = AuthService();
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  User get user => _auth.currentUser!;

  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();

  Future<void> phoneSignIn(BuildContext context,
      {String userName = "",
      String sellerName = "",
      String companyName = "",
      String address = "",
      List<String>? specializedCategory,
      required String userType,
      required String phoneNumber,
      required String password}) async {
    TextEditingController codeController = TextEditingController();

    if (kIsWeb) {
      try {
        print('its in kIsWeb');
        ConfirmationResult confirmationResult =
            await _auth.signInWithPhoneNumber(phoneNumber);
        showOTPDialog(
            context: context,
            codeController: codeController,
            onPressed: () async {
              PhoneAuthCredential credential = PhoneAuthProvider.credential(
                  verificationId: confirmationResult.verificationId,
                  smsCode: codeController.text.trim());
              try {
                await _auth.signInWithCredential(credential);
                Navigator.pop(context);
                if (userType == 'user') {
                  authService.signUpUser(
                      context: context,
                      phoneNumber: phoneNumber,
                      password: password,
                      userName: userName);
                }
                if (userType == 'seller') {
                  authService.sellerSignUp(
                      context: context,
                      phoneNumber: phoneNumber,
                      password: password,
                      sellerName: sellerName,
                      companyName: companyName,
                      address: address,
                      specializedCategory: specializedCategory!);
                }
              } on FirebaseAuthException catch (e) {
                Navigator.pop(context);
                showSnackBar(context, e.message.toString());
              }
              // await _auth.signInWithCredential(credential).then((value) {
              //   Navigator.pop(context);
              //   if (value != null && value != '') {
              //     authService.signUpUser(
              //         context: context,
              //         phoneNumber: phoneNumber,
              //         password: password,
              //         userName: userName);
              //   } else {
              //     showSnackBar(context, 'Enter a valid OTP');
              //   }
              // });
            });
        //return true;
      } on FirebaseAuthException catch (e) {
        showSnackBar(context, 'snackbar error msg :${e.message.toString()}');
        // return false;
      }
    }

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          showSnackBar(context, e.message.toString());
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        codeSent: (String verificationId, int? forceResendingToken) async {
          showOTPDialog(
              context: context,
              codeController: codeController,
              onPressed: () async {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: codeController.text.trim());

                // await _auth.signInWithCredential(credential);
                // Navigator.pop(context);

                await _auth.signInWithCredential(credential).then((value) {
                  Navigator.pop(context);
                  if (value.credential?.token != null &&
                      value.credential?.token != '') {
                    authService.signUpUser(
                        context: context,
                        phoneNumber: phoneNumber,
                        password: password,
                        userName: userName);
                  } else {
                    showSnackBar(context, 'Enter a valid OTP');
                  }
                });

                // Navigator.pushNamedAndRemoveUntil(
                //     context, MainHomePage.route, (route) => false);
              });
          // notifyListeners();
        },
      );
      //  return true;
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      //  return false;
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      //await deleteAccount(context);
      Navigator.pushNamedAndRemoveUntil(
          context, Toggle.route, (route) => false);
      //  notifyListeners();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
    }
  }

  Future<void> deleteAccount(BuildContext context) async {
    try {
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
    }
  }
}


// transitionsBuilder: (___, Animation<double> animation, ____, Widget child) {
//     return FadeTransition(
//       opacity: animation,
//       child: RotationTransition(
//         turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
//         child: child,
//       ),
//     );
//   }