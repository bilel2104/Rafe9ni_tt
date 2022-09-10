import 'package:flutter/material.dart';
import 'package:rafe9ni/app/di.dart';
import 'package:rafe9ni/SplashScreen/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initAppModule();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Rafi9ni',
      home: SplashView(),
    );
  }
}
