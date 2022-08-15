import 'package:alquran_mobile_apps/features/home/main_menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ahlul Quran',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainMenuPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
