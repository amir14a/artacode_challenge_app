import 'dart:ui';

import 'package:artacode_challenge_app/main.dart';
import 'package:artacode_challenge_app/model/product_model.dart';
import 'package:artacode_challenge_app/repository/assets.dart';
import 'package:artacode_challenge_app/repository/colors.dart';
import 'package:artacode_challenge_app/view/widget/app_button.dart';
import 'package:artacode_challenge_app/view/widget/app_hero.dart';
import 'package:artacode_challenge_app/view/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ViewProductScreen extends StatefulWidget {
  final ProductModel model;

  const ViewProductScreen(this.model, {super.key});

  @override
  State<ViewProductScreen> createState() => _ViewProductScreenState();
}

class _ViewProductScreenState extends State<ViewProductScreen> {
  final _imageCtrl = PageController();
  bool isExpanded = false;
  int activeColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBg,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Transform.translate(
              offset: Offset(-80, -80),
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                child: Container(
                  width: 305,
                  height: 305,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.productBgShade1,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Transform.translate(
              offset: Offset(100, 100),
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                child: Container(
                  width: 305,
                  height: 305,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.productBgShade2,
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: AppHero(
              tag: 'hero${widget.model.id}',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Material(
                        color: AppColors.logoutButtonBg,
                        borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(8), topRight: Radius.circular(8)),
                        child: InkWell(
                          borderRadius:
                              BorderRadius.only(bottomRight: Radius.circular(8), topRight: Radius.circular(8)),
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SizedBox(
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
                                  'بازگشت',
                                  style: TextStyle(color: AppColors.logoutButtonTextColor, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.mainButtonBg,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.mainButtonBg.withOpacity(.3),
                              offset: Offset(0, 4),
                              blurRadius: 17,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        margin: EdgeInsets.only(right: 30),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                          child: Text(
                            'دسته بازی',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const SizedBox(width: 30),
                      Expanded(
                        child: Text(
                          widget.model.title,
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                        ),
                      ),
                      const SizedBox(width: 30),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(width: 30),
                      Text(
                        'تومان',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 13, color: AppColors.productPriceColor),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        intl.NumberFormat.decimalPattern().format(widget.model.price),
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                            color: AppColors.productPriceColor,
                            height: .9),
                      ),
                    ],
                  ),
                  LayoutBuilder(builder: (context, constraints) {
                    return Stack(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth,
                          height: constraints.maxWidth * .9,
                          child: PageView(
                            controller: _imageCtrl,
                            scrollDirection: Axis.vertical,
                            children: [
                              ...widget.model.images.map(
                                (e) => Transform.translate(
                                  offset: Offset(120, 0),
                                  child: SizedBox(
                                    width: constraints.maxWidth,
                                    height: constraints.maxWidth * .9,
                                    child: Stack(
                                      children: [
                                        if (widget.model.images.first == e)
                                          Opacity(
                                            opacity: 0,
                                            child: AppHero(
                                              tag: 'heroImage${widget.model.id}',
                                              child: Image.asset(e),
                                            ),
                                          ),
                                        Image.asset(e),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: SizedBox(
                            height: constraints.maxWidth * .9,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(AppAssets.upArrow, width: 24),
                                const SizedBox(height: 8),
                                SmoothPageIndicator(
                                  controller: _imageCtrl,
                                  // PageController
                                  count: widget.model.images.length,
                                  axisDirection: Axis.vertical,
                                  onDotClicked: (index) => _imageCtrl.animateToPage(index,
                                      duration: kThemeAnimationDuration, curve: Curves.linear),
                                  effect: WormEffect(
                                      dotColor: Colors.white,
                                      dotHeight: 10,
                                      dotWidth: 10,
                                      activeDotColor: AppColors.mainButtonBg),
                                ),
                                const SizedBox(height: 8),
                                RotatedBox(quarterTurns: 2, child: Image.asset(AppAssets.upArrow, width: 24)),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }),
                  Row(
                    children: [
                      const SizedBox(width: 30),
                      Expanded(
                        child: Text(
                          'توضیحات',
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                      ),
                      const SizedBox(width: 30),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          AnimatedSize(
                            duration: kThemeAnimationDuration,
                            child: ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (bounds) => LinearGradient(
                                colors: [
                                  AppColors.textSecondary.withOpacity(isExpanded ? 1 : 0),
                                  AppColors.textSecondary
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ).createShader(
                                Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                              ),
                              child: SizedBox(
                                height: isExpanded ? null : 80,
                                child: Row(
                                  children: [
                                    const SizedBox(width: 30),
                                    Expanded(
                                      child: Text(
                                        widget.model.description,
                                        textAlign: TextAlign.justify,
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: AppColors.textSecondary),
                                      ),
                                    ),
                                    const SizedBox(width: 30),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              const SizedBox(width: 30),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isExpanded = !isExpanded;
                                  });
                                },
                                borderRadius: BorderRadius.circular(8),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    isExpanded ? 'کمتر-' : 'بیشتر+',
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12, color: AppColors.mainButtonBg, fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              const SizedBox(width: 30),
                              Text(
                                'انتخاب رنگ',
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      for (int i = 0; i < widget.model.colorsWithImageIndex.length; i++)
                                        GestureDetector(
                                          onTap: () {
                                            setState(() => activeColorIndex = i);
                                            if (widget.model.colorsWithImageIndex[i].$2 != null) {
                                              _imageCtrl.animateToPage(widget.model.colorsWithImageIndex[i].$2!,
                                                  duration: kThemeAnimationDuration, curve: Curves.linear);
                                            }
                                          },
                                          child: AnimatedScale(
                                            duration: kThemeAnimationDuration,
                                            scale: i == activeColorIndex ? 1.4 : 1,
                                            child: Container(
                                              margin: EdgeInsets.symmetric(horizontal: 12),
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: widget.model.colorsWithImageIndex[i].$1,
                                                shape: BoxShape.circle,
                                                border: Border.all(color: AppColors.colorCircleBorder),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 30),
                            ],
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: AppButton(
                      minHeight: 56,
                      text: 'افزودن به سبد خرید',
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
