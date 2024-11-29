import 'dart:ui';

import 'package:artacode_challenge_app/repository/assets.dart';
import 'package:artacode_challenge_app/repository/colors.dart';
import 'package:artacode_challenge_app/view/screen/login_screen.dart';
import 'package:artacode_challenge_app/view/screen/register_screen.dart';
import 'package:artacode_challenge_app/view/widget/app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBg,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Transform.translate(
              offset: Offset(-50, -75),
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.mainBgShade1,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Transform.translate(
              offset: Offset(60, 30),
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                child: Container(
                  width: 256,
                  height: 256,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.mainBgShade2,
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(),
                ConstrainedBox(constraints: BoxConstraints(maxWidth: 390), child: Image.asset(AppAssets.mainIMG)),
                ConstrainedBox(constraints: BoxConstraints(maxWidth: 200), child: Image.asset(AppAssets.logo)),
                Text(
                  'فروشگاه گیمینو',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                ),
                const SizedBox(height: 8),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 256),
                  child: Text(
                    'فروشگاه تخصصی لوازم بازی های رایانه ای و کنسول بازی',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: AppButton(
                    minHeight: 56,
                    text: 'ایجاد حساب کاربری',
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(builder: (c) => RegisterScreen()));
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(builder: (c) => LoginScreen()));
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'قبلا ثبت نام کرده ام',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondaryLight,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          )
        ],
      ),
    );
  }
}
