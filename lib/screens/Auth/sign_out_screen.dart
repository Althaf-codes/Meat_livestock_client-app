import 'package:flutter/material.dart';
import 'package:mq/Utils/showOTP_dialog.dart';
import 'package:mq/services/auth_service.dart';
import 'package:mq/services/firebase_auth_methods.dart';
import 'package:provider/provider.dart';

class SignOutScreen extends StatelessWidget {
  const SignOutScreen({Key? key}) : super(key: key);
  static const _route = '/signOut';
  static get route => _route;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SignOut Screen'),
        ),
        body: Center(
            child: TextButton(
                child: Text('SignOut'),
                onPressed: () {
                  // context.read<FirebaseAuthMethods>().signOut(context);
                  AuthService().signOutSharedPreference(context);
                  Provider.of<FirebaseAuthMethods>(context, listen: false)
                      .signOut(context);
                })));
  }
}
