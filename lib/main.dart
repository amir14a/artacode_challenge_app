import 'package:artacode_challenge_app/repository/consts.dart';
import 'package:artacode_challenge_app/view/screen/login_screen.dart';
import 'package:artacode_challenge_app/view/screen/register_screen.dart';
import 'package:artacode_challenge_app/view/screen/welcome_screen.dart';
import 'package:artacode_challenge_app/viewmodel/login_view_model.dart';
import 'package:artacode_challenge_app/viewmodel/register_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:artacode_challenge_app/repository/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Consts.navigatorKey,
      theme: appLightTheme,
      initialRoute: AppRoutes.welcome,
      onGenerateRoute: (routeSetting) {
        if (routeSetting.name == AppRoutes.login) {
          return CupertinoPageRoute(
            builder: (_) => ChangeNotifierProvider.value(
              value: LoginViewModel(),
              child: LoginScreen(),
            ),
          );
        } else if (routeSetting.name == AppRoutes.register) {
          return CupertinoPageRoute(
            builder: (_) => ChangeNotifierProvider.value(
              value: RegisterViewModel(),
              child: RegisterScreen(),
            ),
          );
        } else {
          return CupertinoPageRoute(
            builder: (_) => WelcomeScreen(),
          );
        }
      },
      scrollBehavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      }),
    );
  }
}

abstract class AppRoutes {
  static const welcome = 'welcome';
  static const login = 'login';
  static const register = 'register';
}
