import 'package:flutter/material.dart';
import 'injection_container.dart' as di;
import 'features/home/main_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
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
