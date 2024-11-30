import 'package:artacode_challenge_app/model/product_model.dart';
import 'package:artacode_challenge_app/repository/assets.dart';
import 'package:artacode_challenge_app/repository/consts.dart';
import 'package:flutter/material.dart';

abstract class MockData {
  static final productList = [
    ProductModel(
      id: 1,
      title: 'دسته مخصوص Xbox',
      price: 2000000,
      description: Consts.lorem,
      images: [
        AppAssets.controller,
        AppAssets.controllerYellow,
        AppAssets.controllerBlue,
      ],
      colorsWithImageIndex: [
        (Colors.white, null),
        (Colors.blue, 2),
        (Colors.yellowAccent, 1),
        (Colors.black, null),
      ],
    ),
    ProductModel(
      id: 2,
      title: 'تلویزیون 50 اینچ',
      price: 20000000,
      description: Consts.lorem,
      images: [
        AppAssets.tV,
        AppAssets.tV,
        AppAssets.tV,
      ],
      colorsWithImageIndex: [
        (Colors.black, null),
      ],
    ),
    ProductModel(
      id: 3,
      title: 'گوشی موبایل شیائومی',
      price: 12000000,
      description: Consts.lorem,
      images: [
        AppAssets.mobile,
        AppAssets.mobile,
        AppAssets.mobile,
      ],
      colorsWithImageIndex: [
        (Colors.white, null),
        (Colors.blue, null),
        (Colors.black, null),
      ],
    ),
    ProductModel(
      id: 4,
      title: 'ساعت هوشمند',
      price: 5000000,
      description: Consts.lorem,
      images: [
        AppAssets.smartWatch,
        AppAssets.smartWatch,
        AppAssets.smartWatch,
      ],
      colorsWithImageIndex: [
        (Colors.white, null),
        (Colors.black, null),
      ],
    ),
    ProductModel(
      id: 5,
      title: 'ساعت هوشمند',
      price: 5000000,
      description: Consts.lorem,
      images: [
        AppAssets.smartWatch,
        AppAssets.smartWatch,
        AppAssets.smartWatch,
      ],
      colorsWithImageIndex: [
        (Colors.white, null),
        (Colors.black, null),
      ],
    ),
    ProductModel(
      id: 6,
      title: 'دسته مخصوص Xbox',
      price: 2000000,
      description: Consts.lorem,
      images: [
        AppAssets.controller,
        AppAssets.controllerYellow,
        AppAssets.controllerBlue,
      ],
      colorsWithImageIndex: [
        (Colors.white, null),
        (Colors.blue, 2),
        (Colors.yellowAccent, 1),
        (Colors.black, null),
      ],
    ),
  ];
}
