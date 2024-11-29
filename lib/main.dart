import 'package:artacode_challenge_app/view/screen/welcome_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:artacode_challenge_app/repository/themes.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
      theme: appLightTheme,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      }),
    );
  }
}
