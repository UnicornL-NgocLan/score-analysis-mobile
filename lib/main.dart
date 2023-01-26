import 'package:flutter/material.dart';

import 'package:tada_score_analysis/screens/Home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tada',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}