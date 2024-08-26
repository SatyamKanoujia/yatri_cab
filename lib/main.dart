import 'package:flutter/material.dart';
import 'package:yatri_cab/screens/yatri_cabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const YatriCabsPage(),
    );
  }
}