import 'package:flutter/material.dart';
import 'package:cryptocoins/screen/home.dart';

void main() => runApp(CoinApp());

class CoinApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptocoins',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
