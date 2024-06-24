import 'package:flutter/material.dart';

class TraceProductScreen extends StatelessWidget {
  const TraceProductScreen({Key? key}) : super(key: key);
  static String _route = '/TraceProductScreen';

  static get route => _route;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trace Product '),
      ),
      body: Center(child: Text('Trace Product Screen')),
    );
  }
}
