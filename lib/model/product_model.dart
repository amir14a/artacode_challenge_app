import 'dart:ui';

class ProductModel {
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.colorsWithImageIndex,
  });

  int id;
  String title;
  int price;
  String description;
  List<String> images;
  List<(Color, int?)> colorsWithImageIndex;
}
