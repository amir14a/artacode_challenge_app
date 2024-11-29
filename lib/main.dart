import 'package:artacode_challenge_app/repository/consts.dart';
import 'package:artacode_challenge_app/view/screen/welcome_screen.dart';
import 'package:artacode_challenge_app/viewmodel/login_view_model.dart';
import 'package:artacode_challenge_app/viewmodel/register_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:artacode_challenge_app/repository/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginViewModel>(create: (_) => LoginViewModel()),
        ChangeNotifierProvider<RegisterViewModel>(create: (_) => RegisterViewModel()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
      navigatorKey: Consts.navigatorKey,
      theme: appLightTheme,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      }),
    );
  }
}
