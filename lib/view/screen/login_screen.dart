import 'dart:ui';

import 'package:artacode_challenge_app/repository/assets.dart';
import 'package:artacode_challenge_app/repository/colors.dart';
import 'package:artacode_challenge_app/repository/enums.dart';
import 'package:artacode_challenge_app/view/screen/register_screen.dart';
import 'package:artacode_challenge_app/view/widget/app_button.dart';
import 'package:artacode_challenge_app/view/widget/app_input.dart';
import 'package:artacode_challenge_app/viewmodel/login_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (BuildContext context, LoginViewModel viewModel, Widget? child) => Scaffold(
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
                  ConstrainedBox(constraints: BoxConstraints(maxWidth: 200), child: Image.asset(AppAssets.logo)),
                  ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 320), child: Image.asset(AppAssets.loginIMG)),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: Text(
                        'ایمیل',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: AppInput(
                      controller: viewModel.emailCtrl,
                      hint: 'Info@example.com',
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: Text(
                        'رمز عبور',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: AppInput(
                      controller: viewModel.passCtrl,
                      hint: 'رمز عبور دلخواه حداقل 5 کاراکتر',
                    ),
                  ),
                  const SizedBox(height: 36),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: AppButton(
                      text: 'ورود',
                      onTap: () {
                        viewModel.doLogin();
                      },
                      isLoading: viewModel.requestState.value == AppApiRequestState.SENDING,
                    ),
                  ),
                  AnimatedSize(
                    duration: kThemeAnimationDuration,
                    child: viewModel.errorText.value == null
                        ? SizedBox()
                        : Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Text(
                              viewModel.errorText.value!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.errorText,
                              ),
                            ),
                          ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(builder: (c) => RegisterScreen()));
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'ایجاد حساب کاربری',
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
      ),
    );
  }
}
