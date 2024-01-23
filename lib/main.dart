import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'injection_container.dart' as di;
import 'features/home/main_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await JustAudioBackground.init(
    androidNotificationChannelId: 'audioQuran',
    androidNotificationChannelName: 'Audio Quran',
    androidNotificationOngoing: true,
    androidNotificationIcon: 'mipmap/launcher_icon',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Ahlul Quran',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MainMenuPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
