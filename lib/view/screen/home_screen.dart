import 'dart:ui';

import 'package:artacode_challenge_app/main.dart';
import 'package:artacode_challenge_app/repository/assets.dart';
import 'package:artacode_challenge_app/repository/colors.dart';
import 'package:artacode_challenge_app/repository/mock_data.dart';
import 'package:artacode_challenge_app/view/screen/login_screen.dart';
import 'package:artacode_challenge_app/view/screen/register_screen.dart';
import 'package:artacode_challenge_app/view/widget/app_button.dart';
import 'package:artacode_challenge_app/view/widget/product_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  color: AppColors.logoutButtonBg,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(8), topRight: Radius.circular(8)),
                  child: InkWell(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(8), topRight: Radius.circular(8)),
                    onTap: () {},
                    child: Container(
                      width: 75,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.logoutIcon,
                            width: 18,
                            color: AppColors.logoutButtonTextColor,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'خروج',
                            style: TextStyle(color: AppColors.logoutButtonTextColor, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ConstrainedBox(constraints: BoxConstraints(maxWidth: 200), child: Image.asset(AppAssets.logo)),
                const SizedBox(width: 75),
              ],
            ),
            Transform.translate(
              offset: Offset(0, -16),
              child: Text(
                'فروشگاه',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 360),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  childAspectRatio: 3 / 4,
                  children: [
                    ...MockData.productList.map(
                      (e) => ProductItem(
                        e,
                        onTap: () {
                          // TODO:Navigate to view item page
                          // Navigator.of(context).push(CupertinoPageRoute(builder: (_)=>));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}