// @dart = 2.9

import 'package:flutter/material.dart';
import 'package:planeto/home.dart';

void main() {
  runApp(Planeto());
}

class Planeto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planeto',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}
