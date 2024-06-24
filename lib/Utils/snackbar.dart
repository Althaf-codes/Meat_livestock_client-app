import 'package:flutter/material.dart';
import 'package:mq/constants/Global_Variables.dart';

void showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        msg,
        style: TextStyle(color: Colors.white),
      )));
}
