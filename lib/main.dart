import 'package:flutter/material.dart';
import 'package:ushoez/screens/list_shoe.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI challenge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListShoePage(),
    );
  }
}

