import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'view/HomePage.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expenses",
      home: HomePage(),
    );
  }
}
